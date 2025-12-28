
alter proc sp_generate_user_summary
as
begin
DECLARE @i INT = 1;
DECLARE @sql NVARCHAR(MAX);

truncate table MumbaiReport.dbo.tbl_user_summary

WHILE @i <= 277
BEGIN
    SET @sql = '
	
	

    INSERT INTO MumbaiReport.dbo.tbl_user_summary
    (
        ward_no,

        total_user,

        admin, active_admin,
        sub_admin, active_sub_admin,
        sakti, active_sakti,
        booth_pramukh, active_booth_pramukh, booth_active,
        sah_sakti, active_sah_sakti,
        sah_booth_pramukh, active_sah_booth_pramukh,
        karykarta, active_karykarta,

        phonebook_match_user,
        phonebook_match_voter,

        created_on
    )
    SELECT
        ' + CAST(@i AS NVARCHAR(5)) + ',

        -- Total users
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1),

        -- Admin
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''A''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''A'' AND last_login IS NOT NULL),

        -- Sub Admin
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''SA''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''SA'' AND last_login IS NOT NULL),

        -- Sakti
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SP''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SP'' AND last_login IS NOT NULL),

        -- Booth Pramukh
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''BP''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''BP'' AND last_login IS NOT NULL),

		-- ✅ Unique Booth Pramukh (booth_javabdari)
        (SELECT COUNT(DISTINCT booth_javabdari) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE sub_type = ''BP'' AND status = 1),

        -- Sah Sakti
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SS''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SS'' AND last_login IS NOT NULL),

        -- Sah Booth Pramukh
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SBP''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND sub_type = ''SBP'' AND last_login IS NOT NULL),

        -- Karykarta
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''K''),
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_admin WHERE status = 1 AND type = ''K'' AND last_login IS NOT NULL),

        -- Phonebook
        (SELECT COUNT(1) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_user_phonebook_count),
        (SELECT ISNULL(SUM(total_voter),0) FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_user_phonebook_count),

        GETDATE();
    ';

    EXEC sp_executesql @sql;
    SET @i += 1;
END;
end

