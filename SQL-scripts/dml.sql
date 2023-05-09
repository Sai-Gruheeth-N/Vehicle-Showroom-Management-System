\c vehicleshowroom;

insert into administration values('Mike','Mg_100','mik','MG100','In office',1001);
insert into administration values('Tyler','Sp_200','tyl','SP200','In inspection',2001);
insert into administration values('Stifler','Sp_201','sti','SP201','In inspection',2002);
insert into administration values('Rahul', 'fin_101', 'rah', 'FIN101', 'Out of office', 9696);
insert into administration values('Raj', 'fin_102', 'raj', 'FIN102', 'In a Meeting', 9695);
insert into administration values('Zara', 'sc_103', 'zar', 'SC103', 'Out of office',9694);
insert into administration values('Anya', 'sc_104', 'any', 'SC104', 'Company Volunteering', 9693);
insert into administration values('Anjali', 'sc_105', 'anj', 'SC105', 'Out of office',9692);

insert into dealer values ('ta_501', 'ta501', 'cad', 'Priya', 'image1.jpg', 'Ford Motors', 5656, 'fin_101', 'Boravalli');
insert into dealer values ('ta_502', 'ta502', 'tad', 'Alexander', 'image2.jpg', 'Walt Motors', 5655, 'fin_102', 'Boravalli');
insert into dealer values ('ta_503', 'ta503', 'sad', 'Sravya', 'image3.jpg', 'Disney Motors', 5654, 'sc_103', 'Jigani');
insert into dealer values ('ta_504', 'ta504', 'mad', 'Madhav', 'image4.jpg', 'Ferarri Motors', 5653, 'sc_104', 'Electronic City');
insert into dealer values ('ta_505', 'ta505', 'gad', 'Jessica', 'image5.jpg', 'Hersheys Motors', 5652, 'sc_105', 'Rajajinagar');

insert into vehicle values('car', 'v101', 'EcoBoost', 'In Stock', 'ta_501', 2084843, 'Mustang', 'Premuim Fastback');
insert into vehicle values('bike', 'v102', 'Bullet 350', 'In Stock', 'ta_502',143843, 'Royal Enfield', 'Supreme');
insert into vehicle values('bike', 'v103', 'Interceptor 650', 'Out of Stock','ta_503', 156843, 'Royal Enfield', 'Supreme');
insert into vehicle values('car', 'v104', 'dezir lvi', 'In Stock', 'ta_504', 573843, 'swift', 'variant');
insert into vehicle values('car', 'v105', 'dezir lxi', 'Out of Stock', 'ta_505', 653843, 'swift', 'variant');

insert into img values('vehicle_logo', 'v101', 'image1', 'Mustang EcoBoost','C:\\downloads\\image1.jpg');
insert into img values('vehicle_logo', 'v101', 'image2', 'Royal Enfield Bullet 350', 'C:\\downloads\\image2.jpg');
insert into img values('vehicle_logo', 'v101', 'image3', 'Royal Enfield Interceptor 650', 'C:\\downloads\\image3.jpg');
insert into img values('vehicle_logo', 'v101', 'image4', 'swift dezir lvi','C:\\downloads\\image4.jpg');
insert into img values('vehicle_logo', 'v101', 'image5', 'swift dezir lxi','C:\\downloads\\image5.jpg');

insert into showroom values(2121, 'ta_501', 'sr_401', 'image1', '1211', 'Boravalli');
insert into showroom values(2122, 'ta_502', 'sr_402', 'image2', '1212', 'Boravalli');
insert into showroom values(2123, 'ta_503', 'sr_403', 'image3', '1213', 'Jigani');
insert into showroom values(2124, 'ta_504', 'sr_404', 'image4', '1214', 'Electronic City');
insert into showroom values(2125, 'ta_505', 'sr_405', 'image5', '1215', 'Rajajinagar');

insert into customer values('c201', 'Bhatta', 'Alia', 4545, 'alia@gmail.com','a101', 'Bhtutan', 'female', '2020-06-17', 'paid');
insert into customer values('c202', 'Bhatta', 'Abhishek', 4544, 'abhi@gmail.com', 'a102', 'Navi Mumbai', 'male', '2020-04-20', 'paid');
insert into customer values('c203', 'Reddy', 'Keshav', 4543, 'k@gmail.com', 'a103', 'Vidya Nagar', 'female', '2021-03-17', 'paid');
insert into customer values('c204', 'satyamurthy', 'Arjun', 4542, 'arjun@gmail.com', 'a104', 'Electronic City', 'male', '2019-06-17', 'paid');
insert into customer values('c205', 'Mittal', 'Sneha', 4541, 'sneha@gmail.com','a105', 'Koromangala', 'female', '2020-01-17', 'paid');

insert into sales values('sl101', 'v101', 'c201', 'sr401', 208443.89, '2020-06-18', '2020-07-17', 'delivered');
insert into sales values('sl102', 'v102', 'c202', 'sr402', 143843.89, '2020-04-21', '2020-03-17', 'shipped');
insert into sales values('sl103', 'v103', 'c203', 'sr403', 156843.89, '2020-03-18', '2021-04-17', 'delivered');
insert into sales values('sl104', 'v104', 'c204', 'sr404', 576843.89, '2019-06-18', '2019-07-17', 'shipped');
insert into sales values('sl105', 'v105', 'c205', 'sr405', 953843.89, '2020-01-18', '2020-02-17', 'delivered');

-- (dealerID, username, passwrd, name, image, companyname, contactno, adminid, address) 




create user mike with password 'mik';
create user tyler with password 'tyl';
create user stifler with password 'sti';

grant all privileges on table administration,customer,dealer,img,sales,showroom,vehicle to mike;
grant all privileges on table dealer,sales,vehicle,img to tyler;
grant all privileges on table dealer,sales,vehicle,img to stifler;

create user Rahul with password 'rah';
create user Raj with password 'raj';
create user Zara with password 'zar';
create user Anya with password 'any';
create user Anjali with password 'anj';

grant all privileges on table customer,sales to Rahul,Raj,Zara,Anya,Anjali;

create user Priya with password 'pri';
create user Alexander with password 'ale';
create user Sravya with password 'sra';
create user Madhav with password 'mad';
create user Jessica with password 'jes';

grant all privileges on table sales to Priya,Alexander,Sravya,Madhav,Jessica;





--nested queries :

-- 1. list of customers whose vehicles have been delivered in 2021
-- with list as (select custid,vehicleid,delv_date from sales where description='delivered') select C.fname,C.lname from customer C,list l where l.custid=C.custid and l.delv_date between '2021-01-01' and '2022-01-01';

-- 2. list of dealers who have sold cars worth more than 500000
with list as (select dealerid from vehicle where vehiclecost>500000) select D.name,D.companyname from dealer D,list l where l.dealerid=D.dealerid;

-- 3. list of customers who have bought bikes
with list as (select * from vehicle where vehicletype='bike') select C.fname,C.lname,l.vehiclename,l.vehiclemodel from customer C,list l,sales S where C.custid=S.custid AND l.vehicleid=S.vehicleid;




SELECT C.fname,C.lname from customer C where(select count(*) from sales S where C.custid=S.custid)>=2; 
SELECT * FROM sales WHERE (ord_date BETWEEN '2020-01-01' AND '2020-12-31');
SELECT * FROM sales WHERE (delv_date BETWEEN '2021-01-01' AND '2021-12-31');
Select count(distinct vehicleID) from vehicle;
SELECT * FROM sales WHERE (cost>30000 AND delv_date BETWEEN '2020-01-01' AND '2020-12-31' AND showroomid='sr401');


--Satyam

-- list bikes
SELECT vehiclename,vehiclemodel FROM VEHICLE WHERE vehicletype='bike';
-- most expensive bike and car
SELECT vehicletype,MAX(vehiclecost) FROM vehicle GROUP BY vehicletype;


--access permissions
alter role ravi WITH PASSWORD 'ravi';
\c vehicleshowroom ravi


