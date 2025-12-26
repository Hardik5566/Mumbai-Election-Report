use MumbaiReport
-------------------------

truncate table tbl_booth_report
truncate table tbl_user_summary

-------------------------
---- Booth Report -------
-------------------------
CREATE TABLE tbl_booth_report
(
    id INT IDENTITY(1,1) PRIMARY KEY,

    ward_no INT NOT NULL,
    booth_no INT NOT NULL,

    total_voter INT NOT NULL DEFAULT 0,
    slip_sent INT NOT NULL DEFAULT 0,
    survey_done INT NOT NULL DEFAULT 0,

    positive INT NOT NULL DEFAULT 0,
    negative INT NOT NULL DEFAULT 0,
    doubtful INT NOT NULL DEFAULT 0,
    cant_say INT NOT NULL DEFAULT 0,

    created_on DATETIME NOT NULL DEFAULT GETDATE(),
    created_by INT NULL
);


-------------------------
---- User Summary -------
-------------------------
CREATE TABLE tbl_user_summary
(
    id INT IDENTITY(1,1) PRIMARY KEY,

    ward_no INT NOT NULL,

    total_user INT NOT NULL DEFAULT 0,

    admin INT NOT NULL DEFAULT 0,
    active_admin INT NOT NULL DEFAULT 0,

    sub_admin INT NOT NULL DEFAULT 0,
    active_sub_admin INT NOT NULL DEFAULT 0,

    sakti INT NOT NULL DEFAULT 0,
    active_sakti INT NOT NULL DEFAULT 0,

    booth_pramukh INT NOT NULL DEFAULT 0,
    active_booth_pramukh INT NOT NULL DEFAULT 0,

    sah_sakti INT NOT NULL DEFAULT 0,
    active_sah_sakti INT NOT NULL DEFAULT 0,

    sah_booth_pramukh INT NOT NULL DEFAULT 0,
    active_sah_booth_pramukh INT NOT NULL DEFAULT 0,

    karykarta INT NOT NULL DEFAULT 0,
    active_karykarta INT NOT NULL DEFAULT 0,

    phonebook_match_user BIGINT NOT NULL DEFAULT 0,
    phonebook_match_voter BIGINT NOT NULL DEFAULT 0,

    created_on DATETIME NOT NULL DEFAULT GETDATE(),
    created_by INT NULL
);
