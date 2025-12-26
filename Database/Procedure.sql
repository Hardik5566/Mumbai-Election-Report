use MumbaiReport

alter PROCEDURE dis_user_summary_sp
(
    @ward_no INT = 0
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        id,
        ward_no,
        total_user,

        admin,
        active_admin,

        sub_admin,
        active_sub_admin,

        sakti,
        active_sakti,

        booth_pramukh,
        active_booth_pramukh,

        sah_sakti,
        active_sah_sakti,

        sah_booth_pramukh,
        active_sah_booth_pramukh,

        karykarta,
        active_karykarta,

        phonebook_match_user,
        phonebook_match_voter,

        -- ✅ Total Active User
    (
        active_admin +
        active_sub_admin +
        active_sakti +
        active_booth_pramukh +
        active_sah_sakti +
        active_sah_booth_pramukh +
        active_karykarta
    ) AS total_active_user,

    -- ✅ Total Inactive User
    total_user -
    (
        active_admin +
        active_sub_admin +
        active_sakti +
        active_booth_pramukh +
        active_sah_sakti +
        active_sah_booth_pramukh +
        active_karykarta
    ) AS total_inactive_user

    FROM tbl_user_summary
    WHERE (@ward_no=0 OR ward_no = @ward_no)
    ORDER BY ward_no;
END


alter proc dis_admin_dash_sp
as
begin
select
	sum(total_user) as total_user,

	sum(active_admin +
        active_sub_admin +
        active_sakti +
        active_booth_pramukh +
        active_sah_sakti +
        active_sah_booth_pramukh +
        active_karykarta) as total_active,

		sum(total_user)-sum(active_admin +
        active_sub_admin +
        active_sakti +
        active_booth_pramukh +
        active_sah_sakti +
        active_sah_booth_pramukh +
        active_karykarta) as total_inactive,

	sum(phonebook_match_user) as phonebook_match_user,
	sum(phonebook_match_voter) as phonebook_match_voter
from
	tbl_user_summary


select
	sum(survey_done) as survey_done,
	sum(positive) as positive,
	sum(negative) as negative,
	sum(doubtful) as doubtful,
	sum(cant_say) as cant_say
from
	tbl_booth_report
end


create proc dis_zone_wise_user_summany_sp
as
begin
SELECT
    zone_name,

	STRING_AGG(CAST(ward_no AS varchar(5)), ', ') AS ward_nos,


    SUM(total_user) AS total_user,

    -- Active / Inactive
    SUM(active_admin + active_sub_admin + active_sakti + active_booth_pramukh 
        + active_sah_sakti + active_sah_booth_pramukh + active_karykarta) AS total_active,

    SUM(total_user) -
    SUM(active_admin + active_sub_admin + active_sakti + active_booth_pramukh 
        + active_sah_sakti + active_sah_booth_pramukh + active_karykarta) AS total_inactive,

    -- Role-wise
    SUM(admin) AS admin,
    SUM(sub_admin) AS sub_admin,
    --SUM(sakti) AS sakti,
    SUM(booth_pramukh) AS booth_pramukh,
    SUM(karykarta) AS karykarta,
	sum(phonebook_match_user) as phonebook_match_user,
	sum(phonebook_match_voter) as phonebook_match_voter
FROM (
    SELECT *,
        CASE
            WHEN ward_no IN (
                9,13,14,15,16,17,18,1,2,6,7,8,10,3,4,5,11,12,
                25,26,23,24,27,28,29,36,44,45,19,20,21,22,
                30,31,32,33,34,35,46,47,48,49
            ) THEN 'NORTH MUMBAI'

            WHEN ward_no IN (
                103,104,105,106,107,108,111,117,118,119,120,122,
                109,110,112,113,114,115,116,123,124,126,127,
                128,129,125,130,131,132,133,134,135,136,137,
                138,139,140,141,142
            ) THEN 'NORTH EAST'

            WHEN ward_no IN (
                70,82,83,84,85,86,88,156,157,158,159,160,161,
                162,163,164,149,151,168,169,170,171,89,90,
                91,165,166,167,87,92,93,94,95,96,97,98,99,
                100,101,102
            ) THEN 'NORTH CENTRAL'

            WHEN ward_no IN (
                52,53,72,73,74,77,78,79,37,38,39,40,41,42,43,
                50,51,54,55,56,57,58,59,60,61,62,63,64,65,
                66,67,68,69,71,75,76,80,81,121
            ) THEN 'NORTH WEST'

            WHEN ward_no IN (
                143,144,145,146,147,148,150,152,153,154,155,
                183,184,185,186,187,188,189,172,173,174,175,
                176,179,180,181,177,178,200,201,182,190,191,
                192,194
            ) THEN 'SOUTH CENTRAL'

            WHEN ward_no IN (
                193,195,196,197,198,199,202,203,204,205,206,
                207,208,209,210,211,212,214,215,217,218,219,
                213,216,220,223,221,222,224,225,226,227
            ) THEN 'SOUTH MUMBAI'
        END AS zone_name
    FROM tbl_user_summary
) t
GROUP BY zone_name
ORDER BY zone_name;
end


create proc dis_survey_report_sp
as
begin
select
	b.ward_no,
	sum(b.survey_done) as survey_done,
	sum(b.positive) as positive,
	sum(b.negative) as negative,
	sum(b.doubtful) as doubtful,
	sum(b.cant_say) as cant_say
from
	tbl_booth_report as b
group by
	b.ward_no
order by
	b.ward_no
end