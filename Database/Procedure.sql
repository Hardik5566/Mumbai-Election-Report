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
        v.ward_no,
        total_users,

		total_active,
		total_users - total_active as total_inactive,

        total_admin,
        total_active_admin,

        total_sub_admin,
        total_active_sub_admin,

        total_saktikendra_pramukh,
        total_active_saktikendra_pramukh,

        total_booth_pramukh,
        total_active_booth_pramukh,

        total_sah_saktikendra_pramukh,
        total_active_sah_saktikendra_pramukh,

        total_sah_booth_pramukh,
        total_active_sah_booth_pramukh,

        total_karykarta,
        total_active_karykarta,

        p.phonebook_match_user,
        p.phonebook_match_voters

    FROM VW_user_summary as v
	join tbl_phonebook as p
	on v.ward_no = p.ward_no
    WHERE (@ward_no=0 OR v.ward_no = @ward_no)
    ORDER BY ward_no;
END




--------------------------------
--------Admin Dashboard--------
--------------------------------
alter proc dis_admin_dash_sp
as
begin
----------- Ward Report -------
select 
	227 as total_ward,
	count(1) as total_ward_active,
	227-count(1) as total_ward_inactive
from 
	VW_user_summary
where
	total_active>5


----------- Booth Report -------
declare @total_booth int = (select sum(total_booth) from tbl_ward)
;with booth as 
(
	select
		count(distinct booth_javabdari) as booth_Active 
	from
		tbl_users as u
	where
		u.sub_type='BP'
)


select 
	@total_booth as total_booth,
	b.booth_Active,
	@total_booth-b.booth_Active as not_active_booth
from 
	booth as b


----------- User Report -------
select
	sum(total_users) as total_user,
	sum(total_active) as total_active_user,
	sum(total_users)-sum(total_active) as total_inactive_user
from
	VW_user_summary


--------- Zone Wise User Report --------

;with zn as
(
	select
		z.[zone_name],
		w.ward_no
	from
		tbl_zone as z
		outer apply
		(
			select
				[value] as ward_no
			from
				string_split(z.ward_no,',') 
		) as w
)

select 
	zn.[zone_name],
	sum(u.total_active) as active_user
from 
	zn
	join VW_user_summary as u on zn.ward_no=u.ward_no
group by
	zn.[zone_name]


------- Phonebook Report ---------
select
	sum(phonebook_match_user) as phonebook_match_user,
	sum(phonebook_match_voters) as phonebook_match_voters
from
	tbl_phonebook as p

---------- Survey -----------
select
	sum(survey_done) as survey_done,
	sum(positive) as positive,
	sum(negative) as negative,
	sum(doubtful) as doubtful,
	sum(cant_say) as cant_say
from
	tbl_booth_report
end

--------------------------------
--------Zone Wise Summary--------
--------------------------------
ALTER proc [dbo].[dis_zone_wise_user_summany_sp]
as
begin
;with zn as
(
	select
		z.[zone_name],
		w.ward_no
	from
		tbl_zone as z
		outer apply
		(
			select
				[value] as ward_no
			from
				string_split(z.ward_no,',') 
		) as w
)

select 
	zn.[zone_name],
	STRING_AGG(CAST(zn.ward_no AS varchar(5)), ', ') AS ward_nos,

	sum(u.total_users) as total_user,
	sum(u.total_active) as total_active,
		
	sum(u.total_users) - sum(u.total_active) as total_inactive,

	sum(total_admin) as admin,
	sum(total_active_admin) as active_admin,

	sum(total_sub_admin) as sub_admin,
	sum(total_active_sub_admin) as active_sub_admin,

	sum(total_saktikendra_pramukh) AS sakti,
	sum(total_active_saktikendra_pramukh) AS active_sakti,

	sum(total_booth_pramukh) AS booth_pramukh,
	sum(total_active_booth_pramukh) AS active_booth_pramukh,

    sum(total_karykarta) AS karykarta,
    sum(total_active_karykarta) AS active_karykarta,

	sum(phonebook_match_user) as phonebook_match_user,
	sum(phonebook_match_voters) as phonebook_match_voter

from 
	zn
	join VW_user_summary as u on zn.ward_no=u.ward_no
	join tbl_phonebook as p on zn.ward_no  = p.ward_no
group by
	zn.[zone_name]
end


--------------------------------
--------- Survey Report --------
--------------------------------
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

--------------------------------
--------- Survey Report --------
--------------------------------
create proc dis_ward_wise_booth_pramukh_sp
(
	@ward_no int
)
as
begin
select
	u.admin_id,
	u.booth_javabdari,
	u.name,
	u.mobile_no,
	u.photo
from
	tbl_users as u
where
	u.ward_no=@ward_no
	and u.sub_type='BP'
order by
	cast(u.booth_javabdari as int)
end