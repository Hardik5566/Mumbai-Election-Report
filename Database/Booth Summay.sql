create proc sp_booth_summary
as
begin
DECLARE @i INT = 1;
DECLARE @sql NVARCHAR(MAX);

truncate table MumbaiReport.dbo.tbl_booth_report

WHILE @i <= 277
BEGIN
    SET @sql = '
    INSERT INTO MumbaiReport.dbo.tbl_booth_report
    (
        ward_no,
        booth_no,
        total_voter,
        survey_done,
        positive,
        negative,
        doubtful,
        cant_say,
        created_on
    )
    SELECT
        ' + CAST(@i AS NVARCHAR(5)) + ' AS ward_no,
        b.booth_no,
        b.total_voter,

        -- Total survey done
        ISNULL(ps.p,0) + ISNULL(ns.n,0) + ISNULL(ds.d,0) + ISNULL(cs.c,0) AS survey_done,

        ISNULL(ps.p,0) AS positive,
        ISNULL(ns.n,0) AS negative,
        ISNULL(ds.d,0) AS doubtful,
        ISNULL(cs.c,0) AS cant_say,

        GETDATE()
    FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.tbl_booth AS b

    OUTER APPLY
    (
        SELECT COUNT(1) AS p
        FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.get_uniq_survey_view s
        WHERE s.booth_no = b.booth_no
          AND voter_available = 1
          AND voter_status = ''P''
    ) ps

    OUTER APPLY
    (
        SELECT COUNT(1) AS n
        FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.get_uniq_survey_view s
        WHERE s.booth_no = b.booth_no
          AND voter_available = 1
          AND voter_status = ''N''
    ) ns

    OUTER APPLY
    (
        SELECT COUNT(1) AS d
        FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.get_uniq_survey_view s
        WHERE s.booth_no = b.booth_no
          AND voter_available = 1
          AND voter_status = ''D''
    ) ds

    OUTER APPLY
    (
        SELECT COUNT(1) AS c
        FROM ' + QUOTENAME('mumbai' + CAST(@i AS NVARCHAR(5))) + '.dbo.get_uniq_survey_view s
        WHERE s.booth_no = b.booth_no
          AND voter_available = 1
          AND voter_status = ''C''
    ) cs;
    ';

    EXEC sp_executesql @sql;
    SET @i += 1;
END;
end