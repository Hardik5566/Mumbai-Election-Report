--exec get_user_bluepirnt_sp
--exec get_ward_blueprint_sp
--exec get_phonebook_blueprint_sp

----------------------------------------
------------User Blueprint-------------
----------------------------------------
alter proc get_user_bluepirnt_sp
as
begin
TRUNCATE TABLE MumbaiReport.dbo.tbl_users;

    DECLARE @wards VARCHAR(MAX) = 
    '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,44,45,46,47,48,49,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,70,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,149,151,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,37,38,39,40,41,42,43,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,78,79,80,81,121,143,144,145,146,147,148,150,152,153,154,155,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,194,200,201,193,195,196,197,198,199,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227';

    DECLARE @sql NVARCHAR(MAX) = N'';

    SELECT @sql = @sql + '
    INSERT INTO MumbaiReport.dbo.tbl_users
    (
        ward_no,
        admin_id,
        type,
        sub_type,
        main_admin_id,
        name,
        mobile_no,
        photo,
        booth_javabdari,
        last_login,
        active,
        temp_status,
        log_date
    )
    SELECT
        ' + LTRIM(RTRIM(value)) + ' AS ward_no,
        admin_id,
        type,
        sub_type,
        main_admin_id,
        name,
        mobile_no,
        photo,
        booth_javabdari,
        last_login,
        CASE WHEN last_login IS NOT NULL THEN 1 ELSE 0 END AS active,
        temp_status,
        MumbaiReport.dbo.get_date() AS log_date
    FROM mumbai' + LTRIM(RTRIM(value)) + '.dbo.tbl_admin
    WHERE status = 1;
    '
    FROM STRING_SPLIT(@wards, ',')
    WHERE LTRIM(RTRIM(value)) <> ''
      AND TRY_CAST(LTRIM(RTRIM(value)) AS INT) IS NOT NULL;

    EXEC sp_executesql @sql;
end

----------------------------------------
------------Ward Blueprint-------------
----------------------------------------
create proc get_ward_blueprint_sp
as
begin
	TRUNCATE TABLE MumbaiReport.dbo.tbl_ward;
	DECLARE @wards VARCHAR(MAX) = 
	'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227';
	DECLARE @sql NVARCHAR(MAX) = N'';
	
	SELECT @sql = @sql + '
	INSERT INTO MumbaiReport.dbo.tbl_ward
	(
	    ward_no,
	    total_booth,
	    total_voter,
	    log_date
	)
	SELECT
	    ' + LTRIM(RTRIM(value)) + ' AS ward_no,
	    COUNT(DISTINCT part_no) AS total_booth,
	    COUNT(1) AS total_voter,
	    MumbaiReport.dbo.get_date() AS log_date
	FROM 
		mumbai' + LTRIM(RTRIM(value)) + '.dbo.tbl_voting_record;
	'
	FROM STRING_SPLIT(@wards, ',')
	WHERE LTRIM(RTRIM(value)) <> ''
	  AND TRY_CAST(LTRIM(RTRIM(value)) AS INT) IS NOT NULL;
	
	EXEC sp_executesql @sql;

end

----------------------------------------
---------phonebook Blueprint------------
----------------------------------------
create proc get_phonebook_blueprint_sp
as
begin
TRUNCATE TABLE MumbaiReport.dbo.tbl_phonebook;
	DECLARE @wards VARCHAR(MAX) = 
	'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227';
	DECLARE @sql NVARCHAR(MAX) = N'';
	
	SELECT @sql = @sql + '
	INSERT INTO MumbaiReport.dbo.tbl_phonebook
	(
	    ward_no,
	    phonebook_match_user,
	    phonebook_match_voters,
	    log_date
	)
	SELECT
	    ' + LTRIM(RTRIM(value)) + ' AS ward_no,
	    count(1) as phonebook_match_user,
		ISNULL(SUM(total_voter),0) as	phonebook_match_voters,
	    MumbaiReport.dbo.get_date() AS log_date
	FROM 
		mumbai' + LTRIM(RTRIM(value)) + '.dbo.tbl_user_phonebook_count;
	'
	FROM STRING_SPLIT(@wards, ',')
	WHERE LTRIM(RTRIM(value)) <> ''
	  AND TRY_CAST(LTRIM(RTRIM(value)) AS INT) IS NOT NULL;
	
	EXEC sp_executesql @sql;
end
