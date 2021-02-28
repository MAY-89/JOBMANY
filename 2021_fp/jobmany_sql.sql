
/* 이하 member table  */
create table tbl_user(
    uno int primary key auto_increment,
    uemail varchar(60) unique not null,
    upassword varchar(30) not null,
    uname varchar(50) not null,
    unickname varchar(50) not null,
    ubirth varchar(12) not null,
    uregdate timestamp not null default now(),
    ischeck char not null default 'N',
    pic varchar(80),
    addr varchar(100),
    postcode varchar(10),
    detailAddr varchar(60),
    signCode varchar(5)
);
select * from tbl_user;
drop table tbl_user;


create table tbl_banid(
    uemail varchar(60) not null,
    count int default 1,
    bandate timestamp default now(),
    constraint fk_tbl_community_board foreign key(uemail) REFERENCES tbl_user(uemail)
    
);
select * from tbl_banid;
drop table tbl_banid;

/* 이하 comunity table  */

CREATE TABLE tbl_community_board(
    cbno INT PRIMARY KEY auto_increment,
    cbtitle VARCHAR(200) NOT NULL,
    cbcontent TEXT NOT NULL,
    cbwriter VARCHAR(200) NOT NULL,
    cbregdate timestamp NOT NULL DEFAULT now(),
    cbupdatedate TIMESTAMP NULL DEFAULT now(),
    cbviewcnt INT DEFAULT 0,
    uno INT NOT NULL,
    constraint fk_tbl_community_board foreign key(uno) REFERENCES tbl_user(uno)
);
drop table tbl_community_board;
select * from tbl_community_board;

CREATE TABLE tbl_community_comment(
    ccno INT PRIMARY KEY auto_increment,
    cbno INT NOT NULL,
    cccontent TEXT NOT NULL,
    ccwriter VARCHAR(200) NOT NULL,
    ccregdate TIMESTAMP NOT NULL DEFAULT now(),
    ccorigin INT NOT NULL DEFAULT 0,
    ccdepth INT NOT NULL DEFAULT 0,
    ccshowboard VARCHAR(10) NULL DEFAULT 'Y',
    uno INT NOT NULL,
    constraint fk_tbl_community_comment foreign key(uno) REFERENCES tbl_user(uno)
);
drop table tbl_comment;
select * from tbl_comment;

create table communityLike(
    cbno int not null,
    uno int not null,
    constraint foreign key(uno) REFERENCES tbl_user(uno),
    constraint foreign key(cbno) REFERENCES tbl_community_board(cbno)
);
drop table communityLike;
select * from communityLike;

/* 이하 Resume table  */

create table resumetable(
	rno int primary key unique,
    rname varchar(20) not null,
    rbirth varchar(50) not null,
    email varchar(50) not null,
    mobile varchar(50) not null,
    phone varchar(50),
    postcode varchar(50) not null,
    addr varchar(50) not null,
    detailAddr varchar(50) not null,
    schoolType varchar(50) not null,
    uniType varchar(50),
    uniName varchar(50),
    uniMajor varchar(50),
    uniGrade varchar(5),
    careerType varchar(50) not null,
    companyName varchar(50),
    exStartDate varchar(50),
    exEndDate varchar(50),
    introduce text,
    pic text,
    portfolio text,
    regdate timestamp default now(),
    updatedate timestamp default now(),
	views int default 0,
    likecnt int default 0,
    showhide varchar(1) default 'y'
);
drop table resumetable;
select * from resumetalbe;

create table liketable(
	rno int not null,
    uno int not null,
    CONSTRAINT FOREIGN KEY(uno) REFERENCES tbl_user(uno),
    CONSTRAINT FOREIGN KEY(rno) REFERENCES resumetable(rno)
);
drop table liketable;
select * from liketable;

--  이하 mylist table
create table tbl_mylist(
	uno int not null,
    board char not null,
    bno int,
    scrapDate timestamp default now(),
    CONSTRAINT fk_tbl_user_uno FOREIGN KEY(uno) REFERENCES tbl_user(uno)
);
drop table tbl_mylist;
select * from tbl_mylist;


