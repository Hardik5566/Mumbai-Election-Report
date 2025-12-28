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


-------------------------------------
---------- User Table --------------
-------------------------------------
CREATE TABLE tbl_users (
    ward_no INT NOT NULL,
    admin_id INT,
    type NVARCHAR(50),
    sub_type NVARCHAR(50),
    main_admin_id INT,
    name NVARCHAR(200),
    mobile_no NVARCHAR(20),
    photo NVARCHAR(MAX),
    booth_javabdari NVARCHAR(MAX),
    last_login DATETIME,
	active bit,
    temp_status INT,  
    log_date DATETIME 
);

--------------------------------------
-------------- Ward Table-------------
--------------------------------------
create table tbl_ward
(
	id int identity(1,1),
	ward_no int,
	total_booth int,
	total_voter bigint,
	log_date datetime
)

--------------------------------------
--------- Zone Table-----------------
--------------------------------------
create table tbl_zone
(
	zone_id int identity(1,1),
	zone_name varchar(200),
	ward_no varchar(max)
)
--insert into tbl_zone values
--('North Mumbai','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,44,45,46,47,48,49'),
--('North East Mumbai','103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,122,123,124,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142'),
--('North Central','70,82,83,84,85,86,88,87,92,93,94,95,96,97,98,99,100,101,102,149,151,168,169,170,171,156,157,158,159,160,161,162,163,164,89,90,91,165,166,167'),
--('North West Mumbai','37,38,39,40,41,42,43,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,71,72,73,74,77,78,79,75,76,80,81,121'),
--('South Central Mumbai','143,144,145,146,147,148,150,152,153,154,155,172,173,174,175,176,179,180,181,177,178,200,201,182,190,191,192,194,183,184,185,186,187,188,189'),
--('South Mumbai','193,195,196,197,198,199,202,203,204,205,206,207,208,209,210,211,212,214,215,217,218,219,213,216,220,223,221,222,224,225,226,227')


--------------------------------------
--------- Get Date Function-----------
--------------------------------------
ALTER function [dbo].[get_date]()
returns datetime
begin
	declare @date datetime
	set @date=(select dateadd(hh,5,dateadd(mi,30,getutcdate())))
	return @date
end
