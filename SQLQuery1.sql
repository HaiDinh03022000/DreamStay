﻿select *
from Motel m, Room r
where m.mid=r.mid and m.mid = 1

select * from Category

SELECT m.mid, m.mname, m.motelimg, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Review r ON m.mid = r.mid
GROUP BY m.mid, m.mname, m.motelimg, m.maddress;

SELECT m.mid, m.mname, m.motelimg,m.mdescription,  m.maddress,m.dateupload,m.coordinates,m.accid, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Review r ON m.mid = r.mid
WHERE m.mid = 2
GROUP BY m.mid, m.mname, m.motelimg,m.mdescription, m.maddress,m.dateupload,m.coordinates,m.accid

select r.roommid from Motel m, Room r where m.mid = r.mid and m.mid =2

select * from Room where roommid = ?

select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen
from Motel m, Alert a, Account ac , InforUser i, Room r
where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and m.accid = ? and (a.staid = 1 or a.staid = 5)

select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen
from Motel m, Alert a, Account ac , InforUser i
where m.mid = a.roommid and ac.accid = a.idsend and i.usid = ac.usid and idsend = ? and (staid = 1 or staid = 5)

select top(4) a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen
from Motel m, Alert a, Account ac , InforUser i, Room r
where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and idget = ? and (staid = 1 or staid = 4 or staid = 6)
order by alertid desc

select r.roommid, c.catenme from Motel m, Room r, Category c where m.mid = r.mid and r.cateid = c.cateid and m.mid = ?

SELECT m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice ,m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Room rm ON m.mid = rm.mid
LEFT JOIN Review r ON m.mid = r.mid
GROUP BY m.mid, m.mname, m.motelimg, m.maddress;

select m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
from Motel m 
LEFT JOIN Room rm ON m.mid = rm.mid
LEFT JOIN Review r ON m.mid = r.mid
where maddress like '%'+?+'%' and avgprice < ? and avgprice >= ? and rm.cateid = ?
group by m.mid, m.mname, m.motelimg, maddress

SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Room rm ON m.mid = rm.mid
LEFT JOIN Review r ON m.mid = r.mid
WHERE m.maddress like '%'+?+'%'  and rm.cateid = ?
GROUP BY m.mid, m.mname, m.motelimg, m.maddress
HAVING AVG(rm.price) < ? AND AVG(rm.price) >= ?;

SELECT DISTINCT  m.mid, m.mname, m.motelimg, AVG(ro.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Review r ON m.mid = r.mid
INNER JOIN Room ro ON m.mid = ro.mid
WHERE ro.price BETWEEN 1000000 AND 2000000
GROUP BY m.mid, m.mname, m.motelimg, m.maddress;

SELECT DISTINCT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Review r ON m.mid = r.mid
INNER JOIN Room rm ON m.mid = rm.mid
WHERE m.maddress LIKE '%Hai Chau%' AND (rm.price BETWEEN 1000000 AND 2000000)
GROUP BY m.mid, m.mname, m.motelimg, m.maddress;

SELECT m.mid, m.mname, m.motelimg, avg_price.avg_price, m.maddress, COALESCE(avg_review.avg_review_score, 0) AS avgsc
FROM Motel m
JOIN (
    SELECT rm.mid, AVG(rm.price) AS avg_price
    FROM Room rm
    WHERE rm.price BETWEEN 1000000 AND 2000000
    GROUP BY rm.mid
) avg_price ON m.mid = avg_price.mid
LEFT JOIN (
    SELECT r.mid, AVG(r.rscore) AS avg_review_score
    FROM Review r
    GROUP BY r.mid
) avg_review ON m.mid = avg_review.mid
WHERE m.maddress LIKE '%Hải Châu%';


SELECT m.mid, m.mname, m.motelimg, m.mdescription, m.maddress, m.dateupload, m.coordinates, m.accid, COALESCE(AVG(r.rscore), 0) AS avgsc
FROM Motel m
LEFT JOIN Review r ON m.mid = r.mid
WHERE m.accid = 2
GROUP BY m.mid, m.mname, m.motelimg, m.mdescription, m.maddress, m.dateupload, m.coordinates, m.accid;

SELECT m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice ,m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc
                FROM Motel m
                LEFT JOIN Room rm ON m.mid = rm.mid
                LEFT JOIN Review r ON m.mid = r.mid
                Where m.accid = 2
                GROUP BY m.mid, m.mname, m.motelimg, m.maddress;


update Motel set mname = '1' ,motelimg = '1', mdescription = '1',maddress = '1' ,coordinates = '1'
              where mid = 20

SELECT c.* FROM Category c
LEFT JOIN Room r ON c.cateid = r.cateid AND r.mid = ?
WHERE r.cateid IS NULL;

update Room set price = ?, quantity = ? where roommid = ?

select b.accid from Bill b, Motel m, Room r
where b.roommid = r.roommid and m.mid = r.mid and  b.accid = ? and m.mid = ?; 

SELECT top(4) a.alertid, a.imagecheck, a.textarea, a.dateup, a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar, a.seen
FROM Alert a
JOIN Account ac ON ac.accid = a.idsend
JOIN InforUser i ON i.usid = ac.usid
WHERE a.idget = 1
order by a.alertid desc

select top(1) i.usid, i.fullname, i.uaddress, i.phonenumber, i.birthday, i.avatar, i.email
from InforUser i, Motel m, Review r, Account a where i.usid = a.usid and m.accid = a.accid and m.mid = r.mid 
group by i.usid, i.fullname, i.uaddress, i.phonenumber, i.birthday, i.avatar, i.email order by avg(r.rscore) desc

--lấy top4 review motel
select top(4) m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress , SUM(r.rscore) as 'Total Score' 
from Motel m, Review r
where m.mid = r.mid 
group by m.mid,m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress 
ORDER BY 'Total Score' DESC;


--lấy review theo mid
select r.rvid , r.img, r.rscore, r.comment, r.accid, a.username , i.avatar
from Review r , Account a ,InforUser i 
where r.accid = a.accid and i.usid = a.usid and mid = ?

--lấy thông tin người dùng trong trang payment
select i.fullname , i.uaddress, i.phonenumber,i.birthday,i.avatar,i.email 
from InforUser i , Paycard p , Motel m, Account a
where m.usid=i.usid and p.accid = a.accid and a.usid = i.usid

--lấy tất cả 4 bảng
select *
from InforUser i , Paycard p , Motel m, Account a
where m.usid=i.usid and p.accid = a.accid and a.usid = i.usid

--lấy tất cả thông tin của trọ theo mid
select *
from Motel
where mid =5


select a.accid ,a.username, a.password, a.acctype , a.datesign , a.otpcode, a.usid, a.pcid
from Account a, InforUser i
where a.usid = i.usid and a.username = ? and i.email = ?

update Paycard set cmoney = cmoney - 1000

update Paycard set cmoney = cmoney - 100000.0 where pcid = 7

select * from Account where accid = 2

insert into Alert (textarea, dateup, staid,accid, mid)
values (?,?,?, ?);

select * 
from Account 

DeLETE FROM Review WHERE accid = 4

DELETE FROM Bill WHERE accid = 4

DELETE FROM Account WHERE accid = 4

DELETE FROM InforUser WHERE usid IN (SELECT usid FROM Account WHERE accid = 4) 

	