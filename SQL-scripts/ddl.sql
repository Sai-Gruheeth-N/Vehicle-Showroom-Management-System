drop database if exists vehicleshowroom;
create database vehicleshowroom;
\c vehicleshowroom;

create table administration
(
    adminname varchar(15),
    adminid varchar(10),
    passwrd varchar(7),
    username varchar(7),
    status varchar(20),
    contactno varchar(10), 
    lastlogin TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (adminid)
);

create table dealer
(
    dealerID varchar(10),
    username varchar(10),
    lastlogin TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    passwrd varchar(20),
    name varchar(20),
    image varchar(10),
    companyname varchar(30),
    contactno varchar(10),
    adminid varchar(10),
    address varchar(50),
    primary key(dealerID),
    foreign key (adminid) references administration on delete set null
);

alter table dealer drop column lastlogin;

create table vehicle
(
    vehicletype varchar(10),
    vehicleID varchar(20),
    vehiclemodel varchar(30),
    stats varchar(15),
    dealerID varchar(10),
    vehiclecost int,
    vehiclename varchar(20),
    description varchar(20),
    primary key(vehicleID),
    unique (vehicleID),
    foreign key (dealerID) references dealer on update cascade
);

alter table vehicle add check (vehiclecost>0);

create table img
(
    defaultimage varchar(15),
    vehicleID varchar(20),
    imageID varchar(20),
    imageName varchar(30),
    imagePath varchar(50),
    primary key (imageID),
    unique (imageID),
    foreign key (vehicleID) references vehicle on update cascade on delete cascade
);

create table showroom
(
    showroomID int,
    dealerID varchar(10),
    showroomName varchar(15),
    imageID varchar(10),
    contactno int,
    address varchar(50),
    primary key (showroomID),
    unique (showroomID),
    foreign key (dealerID) references dealer on update cascade,
    foreign key (imageID) references img on delete set null
);

create table customer
(
    custid varchar(10),
    lname varchar(25) ,
    fname varchar(25) NOT NULL,
    contactno varchar(10),
    emailid varchar(30),
    passwrd varchar(20),
    address varchar(50),
    gender varchar(10),
    createdat date,
    stats varchar(30) check (stats in ('item_finalising', 'item_shortlisted','paid')),
    primary key (custid)
);

create table sales
(
    salesid varchar(10),
    vehicleID varchar(10),
    custid varchar(10),
    showroomid varchar(10),
    cost decimal(10,2) check (cost>0),
    ord_date date,
    delv_date date default null,
    description varchar(30),
    stats varchar(20) check (stats in ('packaged', 'shipped', 'delivered')),
    primary key (salesid),
    foreign key (vehicleID) references vehicle on update cascade on delete cascade,
    foreign key (custid) references customer on delete set null
);
