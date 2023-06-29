--create table
drop table Bill
drop table Review
drop table Alert
drop table Astatus
drop table Room
drop table Category
drop table Motel
drop table Account
drop table Paycard
drop table InforUser

create table InforUser(
usid int identity(1,1) not null primary key,
fullname nvarchar(255),
uaddress nvarchar(255) ,
phonenumber nvarchar(30),
birthday varchar(4) ,
avatar nvarchar(max),
email varchar(100),
)

create table Paycard(
pcid int identity(1,1) not null primary key,
fullname nvarchar(max),
numcard nvarchar(50) ,
cmoney int,
releasedate nvarchar(50),
pincode nvarchar(6),
)

create table Account(
accid int identity(1,1) not null primary key,
username nvarchar(max),
password nvarchar(max),
acctype bit not null,
datesign nvarchar(255),
otpcode varchar(6),
usid int,
foreign key (usid) references InforUser(usid),
pcid int,
foreign key (pcid) references Paycard(pcid),
accstatus bit
)

create table Motel(
mid int identity(1,1) not null primary key,
mname nvarchar(max),
motelimg nvarchar(max),
mdescription nvarchar(max),
maddress nvarchar(255),
dateupload nvarchar(50),
coordinates nvarchar(max),
accid int,
foreign key (accid) references Account(accid),
)

create table Category(
cateid int identity(1,1) not null primary key,
catenme varchar(255),
)

create table Room(
roommid int identity(1,1) not null primary key,
mimage1 nvarchar(max),
mimage2 nvarchar(max),
mimage3 nvarchar(max) ,
price int,
quantity int not null,
mid int,
foreign key (mid) references Motel(mid),
cateid int,
foreign key (cateid) references Category(cateid),
codition bit,
)

create table Astatus(
staid int identity(1,1) not null primary key,
typename nvarchar(100)
)

create table Alert(
alertid int identity(1,1) not null primary key,
imagecheck nvarchar(max),
textarea nvarchar(max),
dateup nvarchar(50),
pmoney int,
staid int,
foreign key (staid) references Astatus(staid),
idsend int,
foreign key (idsend) references Account(accid),
roommid int,
foreign key (roommid) references Room(roommid),
idget int, 
foreign key (idget) references Account(accid),
seen bit
)

CREATE TABLE Review (
  rvid int identity(1,1) not null primary key,
  img nvarchar(max),
  dateup nvarchar(50),
  rscore double PRECISION,
  comment nvarchar(255),
  accid int,
  foreign key (accid) references Account(accid),
  mid int,
  foreign key (mid) references Motel(mid)
);

create table Bill(
bid int identity(1,1) not null primary key,
datebill nvarchar(50),
bdescription nvarchar(max),
price int,
datedue nvarchar(50),
roommid int,
foreign key (roommid) references Room(roommid),
accid int,
foreign key (accid) references Account(accid),
condition bit
)



insert into InforUser( fullname, uaddress, phonenumber, birthday,avatar,email)
values 
	(N'Trần Admin',N'Hà Nội','0356788241','1999','avaadmin.webp','admin@gmail.com'),
	(N'Hoàng Đức Hiền',N'Đà Nẵng','0523927504','2002','avahien.webp','hienhdde160299@fpt.edu.vn'),
	(N'Hà Thanh Phúc',N'Quảng Bình','0905123789','2001','avaphuc.webp','phuchtde160466@fpt.edu.vn'),
	(N'Huỳnh Thành Đạt',N'Đà Nẵng','0905667432','2000','avatdat.webp','dathtde160551@fpt.edu.vn'),
	(N'Hoàng Công Hải Định',N'Quảng Bình','0901345672','2001','avadinh.webp','dinhhchde106607@fpt.edu.vn'),
	(N'Kiều Văn Quốc Đạt',N'Đà Nẵng','0905180307','2002','avaqdat.webp','datkvqde160284@fpt.edu.vn');
	
insert into Account(username ,password,acctype ,datesign ,otpcode,usid,accstatus )
values 
	('admin', '12345678', 0, '20/5/2023','́́*',1,1),
	('hdhien12', '12345678', 1, '20/5/2023','́́*',2,1),
	('htphuc202', '12345678', 0, '20/5/2023','́́*',3,1),
	('htdat12', '12345678', 0, '20/5/2023','́́*',4,1),
	('hchding123', '12345678', 1, '20/5/2023','́́*',5,1),
	('kvqdat12', '12345678', 1, '20/5/2023','́́*',6,1);

insert into Paycard(fullname,numcard,cmoney,releasedate,pincode)
values 
	('Admin Ne','1234 5678 9012 3456','0','25/12','999999'),
	('Hoang Duc Hien','8762569723895555', '900000000', '18/24', '111111'),
	('Ha Thanh Phuc','6555999876542323', '60000000', '05/25', '070502'),	
	('Kieu Van Quoc Dat','6342210005134567', '400000000', '26/25', '121212'),
	('Hoang Cong Hai Dinh','6776101288897643', '650000000', '16/26', '787878'),
	('Huynh Thanh Dat','7842911062774388', '567400000', '13/24', '565656');

insert into Category(catenme)
values 
	('Cheap'),
	('Normal'),
	('Vip'),
	('Small'),
	('Big');
	   	
insert into Motel(mname ,motelimg,mdescription,maddress ,dateupload ,coordinates ,accid)
values
(
N'Phòng trọ cao cấp giá rẻ mới xây - Shophouse dầu khí - Đường Võ Chí Công, Hòa Quý, Đà Nẵng',
'tro11.webp',
N'1. Vị trí ở Shophouse Dầu Khí, Hòa Quý, Đà Nẵng. Phòng mới xây sử dụng lần đầu, thông thoáng sạch sẽ. Giao thông đi lại thuận tiện.
2. Phòng khép kín, có chỗ nấu ăn,... Wifi miễn phí, nhà xe, Camera an ninh.
Ghi chú: Phòng Không nội thất.
4. Giá thuê: Từ 2,2tr - 3.5tr/phòng/tháng (tùy phòng).
Cọc 01 triệu. Nộp tiền theo tháng. Điện nước theo công tơ riêng.
Phù hợp: Gia đình nhỏ, nhân viên văn phòng, sinh viên có nhu cầu ở lâu dài.',
N'214 Đường Võ Chí Công, Hòa Quý, Đà Nẵng',
'16/05/2023',
'https://goo.gl/maps/z5YsfwxD5yVoUQ1g8',1
),

(
N'Phòng trọ 30m tại Nguyễn văn thoại,an Hải đông,Sơn trà',
'tro21.webp',
N'Cho thuê phòng trọ tại kiệt 145 Nguyễn văn thoại,dt 30m ,gần biển,chợ gần cầu Trần thị lý,giá cho thuê 2triệu 8/tháng LH 0936 441 755',
N'145 Nguyễn Văn Thoại, Phường An Hải Đông, Sơn Trà',
'20/05/2023',
'https://goo.gl/maps/gkjSXKiVZYAeKpgL9',2
),

(
N'Cho thuê phòng trọ ở trung tâm thành phố',
'tro31.webp',
N'Cho thuê phòng cho trọ ở q Hải Châu, thoáng mát sạch đẹp, yên tĩnh giá chỉ từ 1,6 tr/th/ng 2,1tr/th/2ng có Tolet, bếp nấu, có gác lưng. Thang máy, nơi để xe tầng trệt và lối đi riêng, ra vào 24/24. 2 lớp cửa thẻ từ và vân tay nên an ninh cực kỳ tốt. Mặt tiền đường Duy tân, lối ra vào sân bay ĐN. gần các trường đại hoc duy tân, kiến trúc, ngoại ngữ....',
N'132 Đường Duy Tân, Phường Hòa Thuận Tây, Hải Châu',
'20/05/2023',
'https://goo.gl/maps/nmeUFjSbRXpYH1bp8',6
),

(
N'Cho thuê phòng trọ giá rẻ khu vực ngay chợ Non Nước',
'tro41.webp',
N'Cho thuê nhà ngay chợ Non Nước , gần nhiều trường đại học cao đẳng cho các bạn sinh viên như Đại học công nghệ thông tin và truyền thông Việt - Hàn , Trường ĐH FPT Đà Nẵng …..

Có lối để xe rộng rãi

An ninh tốt

phòng ở thoáng mát sạch sẽ có wifi free ( nhiều phòng có trang thiết bị đầy đủ như giường , tủ …)

camera 24/24 nên mọi người có thể yên tâm

tất cả các phòng đều có cửa số thoáng mát nhiều ánh sáng

Có thể trực tiếp đến xem phòng bất cứ lúc nào . Hãy liên hệ nếu bạn cần nhé',
N'K35/3 Đường Nam Thành, Phường Hòa Hải, Ngũ Hành Sơn',
'10/05/2023',
'https://goo.gl/maps/NscNAPQXKeyH1VcL9',5
),

(
N'Phòng trọ giá rẻ ngã tư Hoàng Diệu-Nguyễn Văn Linh, gần ĐH Duy Tân',
'tro51.webp',
N'- Phòng chất lượng cao ở lầu 2 ( Nhà ở mái đúc 2 tấm mới, cả tầng chỉ có 2 phòng và sân thượng) - lối đi riêng, cho nữ thuê lâu dài tại K266 H14/19 Hoàng Diệu, (đi thẳng kiệt 254 HD 80m là đến nhà), ngay ngã tư Hoàng Diệu-NVLinh, cạnh KS Mường Thanh Sông Hàn (Hoàng Anh Gia Lai cũ).

- Nhà ngay trung tâm TP nên rất thuận tiện việc đi lại. Gần chợ, siêu thị, trường học, bệnh viện...Cách Cầu Rồng 600m, ĐH Duy Tân 500m, cách đường Hoàng Diệu 80m, đường ôtô vào tận cổng. Thân thiện, an ninh, yên tĩnh. Vào ở ngay.

- Đã trang bị điều hòa, tủ bếp, nệm, Wifi miễn phí, nước nóng lạnh năng lượng, tủ lạnh, tủ áo, bàn salon, Xe đạp thể dục, WC cao cấp.

- DT: trong phòng là 16m2, tổng diện tích sử dụng 70m2/ tầng 2, có sân thượng trước nhà thoáng mát, phơi đồ thoải mái, có bếp nấu ăn, rửa chén . . ',
N'k266 H14/19 Đường Hoàng Diệu, Phường Nam Dương, Hải Châu',
'08/05/2023',
'https://goo.gl/maps/d92iUs9sZdn6p37n8',2
),

(
N'Cho thuê phòng trọ tại số 78 Nguyễn Xuân Hữu, Hoà Thọ Đông, Cẩm Lệ, Đà Nẵng',
'tro61.webp',
N'Phòng trọ 20m2, có gác lửng, có khu vực bếp, có bình nóng lạnh, gạch ốp tới trần nên sạch sẽ và thoáng mát. Cả dãy trọ chỉ có 4 phòng, có sân phơi đồ và chỗ để xe riêng. Gần chợ Cẩm Lệ, Hoà Cầm và trường tiểu học Trần Nhân Tông, khu dân cư đông đúc, giờ giấc tự do. Ưu tiên cho gia đình nhỏ ở dài lâu. Liên hệ A An 0905.229.886. Giá 1800k/ tháng',
N'Đường Nguyễn Xuân Hữu, Phường Hòa Thọ Đông, Cẩm Lệ',
'15/05/2023',
'https://goo.gl/maps/a7Qqh2NA1nDii7U86',6
),

(
N'Cho thuê căn hộ sát chợ Non Nước',
'tro71.webp',
N'Cho thuê căn hộ sát bên cạnh chợ Non Nước – Ngũ Hành Sơn (06 Nam Thành) – Nằm ở vị trí 2 mặt tiền, diện tích 32m2, có gác lửng rộng rãi, thiết bị vệ sinh sinh cao cấp, giá cho thuê. 2tr/căn hộ Liên hệ Đt, zalo: 0905 868 758 (A.Thịnh)',
N'06 Nam Thành,Hòa Hải, Ngũ Hành Sơn',
'01/03/2021',
'https://goo.gl/maps/5KdMh7sJzQajnj9Y8',2
),

(
N'CHO THUÊ PHÒNG TRỌ GIÁ RẺ ĐƯỜNG TRỤC LỚN TÔN ĐỨC THẮNG',
'tro81.webp',
N'Cho thuê phòng trọ giá rẻ Hòa Minh, Liên Chiểu

Địa chỉ: 380 Tôn Đức Thắng,P. Hòa Minh, Liên Chiểu, Đà Nẵng

Mặt tiền của trục đường chính Tôn Đức Thắng, gần trung tâm thành phố, gần chợ, siêu thị.

Gần các trường tiểu học

Gần trường đại học sư phạm, Bách khoa, Duy Tân

Phòng rộng rãi, thoáng , view đẹp

Có chỗ để xe riêng

Không chung chủ, giờ giấc tự do

Dưới là trung tâm tiếng anh WISE ENGLISH có tiếng tại Đà Nẵng, gần cho các bạn sinh viên muốn học luyện thi IELTS, TOEIC,... nhé

Giá: từ 2tr đến 2tr7/tháng, cọc 2 triệu

Liên hệ: 0326482674 ( Thương )',
N'380 Tôn Đức Thắng,P. Hòa Minh, Liên Chiểu',
'19/04/2021',
'https://goo.gl/maps/2JX25jwd74kUwDQw7',2
),

(
N'Cho thuê phòng trọ tại Ngũ Hành Sơn, Đà Nẵng',
'tro91.webp',
N'Cho thuê phòng trọ ở 346 Ngũ Hành Sơn quận Ngũ Hành Sơn Đà Nẵng.

Giá 2,5 triệu/1phòng/1tháng, có nhà vệ sinh riêng hệ thống nóng lạnh từng phòng, có thang máy, gần trường đại học Kinh tế (cách 700m).

Cho thuê nguyên tầng làm văn phòng, spa.

Cho thuê mặt tiền kinh doanh giá 7 triệu/1tháng.

Liên hệ: 034 851 0149 (chú Dũng)

036 897 0278 (cô Hoa)',
N'346 Ngũ Hành Sơn, Ngũ Hành Sơn',
'19/04/2025',
'https://goo.gl/maps/T1KZLoVrD2azmFHf8',6
),


(
N'Cho thuê phòng trọ thoáng mát, sạch sẽ',
'tro101.webp',
N'Cho thuê phòng chung chủ, phòng lớn có ban công có lối đi riêng. Cách trường ĐH Đông Á, Kiến Trúc, Chợ Đầu mối Hòa Cường, có thể đi bộ khoảng 290m, Gần bệnh viện Vinmec, gần trường Đại học ngoại ngữ. Có điều hoà, nóng lạnh, có chỗ nấu ăn, Yêu cầu: sinh viên nữ ưu tiên những bạn sinh viên năm 1, chưa có xe.',
N'582 Đường số 2/9, Phường Hòa Cường Nam, Hải Châu',
'28/03/2023',
'https://goo.gl/maps/nKvSAkm9zdqC2758A',5
),


(
N'Cho thuê phòng trọ giá rẻ 1tr7 một phòng',
'tro111.webp',
N'Diện tích: 40m2. Có gác lửng, thoáng mát, tiện nghi.

Cho thuê phòng trọ hoặc mặt bằng kinh doanh.

Liên hệ: 0825.64.55.78 Chú Sơn.',
N'Phường Hòa Minh, Liên Chiểu',
'28/03/2023',
'https://goo.gl/maps/ZceA1wM2SYw3vtJcA',5
),


(
N'Cho thuê nhà cấp 4 mặt tiền giá rẻ',
'tro121.webp',
N'nhà cấp 4, đường 7m5, 100m2, có sân, 1PK, 1PN, 1 Bếp, 1 VS,

Nội thất có sẵn 1 giường và bộ bàn ghế phòng khách,

địa chỉ: đường Võ Văn Đồng, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng. gần FPT Plaza 1-2.

Điên nước tự quản theo giá nhà nước.

Giá cho thuê 3tr/tháng.

LH: Zin-0962308846',
N'Đường Nguyễn Duy Trinh, Phường Hòa Hải, Ngũ Hành Sơn',
'05/02/2025',
'https://goo.gl/maps/GHm3cJxV8uaxZbuj9',6
),


(
N'Cho thuê nhà cấp 4 mặt tiền giá rẻ',
'tro131.webp',
N'phòng trọ rộng rãi thoáng mát giá rẻ.gần khu công nghiệp,cách chợ 200m,phòng mới xây và có sân vuờn rộng rãi. chỗ để xe thoải mái và an toàn

giá 1tr2 chưa tính điện nước

địa chỉ 1033 âu cơ chạy lên 100m có tiệm thuốc tây KIM TÂN',
N'Phường Hòa Khánh Bắc, Liên Chiểu',
'31/01/2023',
'https://goo.gl/maps/8jhbFUCBaDtfxq9W7',2
),

(
N'Cho thuê phòng trọ phù hợp cho gia đình nhỏ',
'tro141.webp',
N'Co 03 Phòng rộng từ 30 đến 35m2 có phòng ngủ riêng, phòng ăn và wc',
N'382/6k Đường Núi Thành, Phường Hòa Cường Bắc, Hải Châu',
'28/01/2023',
'https://goo.gl/maps/94f5PgpDadLfoKPr8',5
);

insert into Room(mimage1, mimage2, mimage3, price, quantity, mid, cateid,codition)
values
	('tro11.webp','tro11.webp','tro11.webp',3500000,10,1,1,1),
	('tro11.webp','tro11.webp','tro11.webp',1500000,10,1,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2000000,10,1,3,1),
	('tro11.webp','tro11.webp','tro11.webp',2500000,10,2,1,1),
	('tro11.webp','tro11.webp','tro11.webp',2300000,10,2,2,1),
	('tro11.webp','tro11.webp','tro11.webp',1800000,10,3,1,1),
	('tro11.webp','tro11.webp','tro11.webp',1700000,10,3,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2700000,10,4,1,1),
	('tro11.webp','tro11.webp','tro11.webp',2600000,10,4,2,1),
	('tro11.webp','tro11.webp','tro11.webp',3000000,10,4,3,1),
	('tro11.webp','tro11.webp','tro11.webp',1500000,10,5,1,1),
	('tro11.webp','tro11.webp','tro11.webp',2000000,10,5,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2300000,10,5,3,1),
	('tro11.webp','tro11.webp','tro11.webp',2000000,10,6,1,1),
	('tro11.webp','tro11.webp','tro11.webp',1400000,10,6,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2900000,10,7,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2600000,10,7,3,1),
	('tro11.webp','tro11.webp','tro11.webp',1900000,10,8,1,1),
	('tro11.webp','tro11.webp','tro11.webp',2700000,10,9,1,1),
	('tro11.webp','tro11.webp','tro11.webp',3000000,10,10,1,1),
	('tro11.webp','tro11.webp','tro11.webp',2000000,10,11,2,1),
	('tro11.webp','tro11.webp','tro11.webp',2100000,10,12,1,1),
	('tro11.webp','tro11.webp','tro11.webp',1800000,10,12,2,1),
	('tro11.webp','tro11.webp','tro11.webp',3100000,10,13,3,1),
	('tro11.webp','tro11.webp','tro11.webp',2400000,10,13,1,1),
	('tro11.webp','tro11.webp','tro11.webp',1600000,10,14,3,1),
	('tro11.webp','tro11.webp','tro11.webp',1800000,10,14,2,1);

insert into Review (img,dateup ,rscore ,comment,accid ,mid )
values 
	('motelimage/tro11.webp','2023-06-07T09:41:22.883','5',N'Thật sự là một nhà trọ đáng sống giữa thành phố nhộn nhịp',6,1),
	('motelimage/tro11.webp','2023-06-07T09:41:22.883','3',N'Trọ ổn áp nhưng không có điều hòa và nóng',6,2),
	('motelimage/tro14.webp','2023-06-07T09:41:22.883','2',N'Trọ nóng, không mới lắm',3,1),
	('motelimage/tro16.webp','2023-06-07T09:41:22.883','4',N'Chủ trọ tốt bụng, trọ hơi xa trung tâm',4,3),
	('motelimage/tro16.webp','2023-06-07T09:41:22.883','5',N'Trọ đẹp nhất trong tầm giá',5,5),
	('motelimage/tro15.webp','2023-06-07T09:41:22.883','4',N'Đáng để thuê, hơi xa',5,4),
	('motelimage/tro16.webp','2023-06-07T09:41:22.883','5',N'Trọ tuyệt vời',4,6),
	('motelimage/tro16.webp','2023-06-07T09:41:22.883','3',N'Trọ này đẹp,nhưng ồn ào',5,7),
	('motelimage/tro15.webp','2023-06-07T09:41:22.883','5',N'Đẹp, sạch, gần trung tâm  rất tiện lợi mọi người nên thử',5,8);

insert into Astatus(typename)
values
	('pending'),
	('Approve'),
	('NotApprove'),
	('complete'),
	('Locked'),
	('Out of Date'),
	('ad-pending'),
	('ad-complete');
