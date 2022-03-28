create table temp_tourist2( 
tourPK smallint constraint conPKTourPK primary key identity(1,1), 
tourN varchar(20) constraint conNTourN NOT NULL, 
tourFN varchar(20), 
tourG varchar(1) constraint conCHTourG CHECK(tourG in('M','F')) 
constraint conDFTourG default('M'), 
tourB date constraint conCHTourB check(tourB > GETDATE()), 
tourP varchar(20) constraint conUNTourP unique 
)

create table hotel2( 
hotelPK smallint constraint conPKHotelPK PRIMARY KEY NOT NULL IDENTITY(1,1), 
hotelN varchar(122) constraint conUNHotelN UNIQUE, 
hotelC smallint 
)

create table room2( 
roomPK smallint constraint conPKRoomPK primary key identity(1,1), 
roomN varchar(5) constraint conCHRoomN check(roomN like '[A-Z][A-Z][0-9][0-9][0-9]'), 
roomD DECIMAL(6,2) constraint conCHRoomD CHECK(roomD > 100) 
constraint conDFRoomD default(105), 
roomC smallint constraint conCHRoomC check(roomC > 0 AND roomC < 5) 
--hotelid smallint not null FOREIGN KEY REFERENCES dbo.hotel3(HotelId)  
)
alter table room2  
add hotelID smallint constraint conFKHotelID foreign key references hotel3(hotelPK)

create table stay 
( 
stayid int constraint conPKStayID primary key not null identity(1,1), 
staydatestart date not null, 
staydateend date not null, 
stayroomkey int not null, 
stayprice decimal(6,2) not null 
constraint conCHStayprice check(stayprice > 0.00), 
touristid smallint foreign key references temp_tourist2(tourPK) 
)
alter table stay add constraint conFKStayroomkey 
foreign key(stayroomkey) references room2(roomPK)

--------------------------------------------------------
Exercise 1 


create table activities( 
actID int constraint conPKActID primary key not null identity(1,1), 
actName varchar(20) unique, 
actPrice decimal(6,2) 
constraint conCHActPrice check(actPrice >= 10 and  
actPrice <= 200) 
constraint conDFActPrice default(23), 
actParticipants int constraint conCHActParticipants 
check(actParticipants BETWEEN 0 and 50), 
actCode varchar(3) unique  
constraint conCHActCode check(actCode like '[A-Z][A-Z][A-Z]') 
)

create table partic  // many-to-many relations pass through here
( 
particID int primary key not null identity(1,1), 
particStayID int foreign key references stay(stayid), 
particActivityID int foreign key references activities(actid) 
)

create table country( 
countryID int primary key not null identity(1,1), 
countryName varchar(30) not null unique 
)

alter table temp_tourist2 add tourC int
alter table temp_tourist2 add constraint conFKtourC foreign key(tourC) references country(countryID)

... drop constraint ... drop column 

create table student( 
studentID int primary key not null identity(1,1), 
studentFirstName varchar(30), 
studentLastName varchar(40) not null 
)

create table course 
( 
courseID int primary key not null identity(1,1), 
coursePoints int check(coursePoints between 3 and 60) unique not null, 
courseDescription varchar(255) 
)

create table coursestudent( 
courseID int foreign key references course(courseID), 
studentID int foreign key references student(studentID), 
points int foreign key references course(coursePointes), 
[Date] datetime unique not null check([Date] > '2000-01-01'), 
primary key(courseID,studentID) 
)

create table numberlist 
( 
CourseID int foreign key references course(courseID), 
StudentID int foreign key references student(studentID), 
[Date] datetime foreign key references coursestudent([Date]), 
Points int foreign key references course(coursePoints), 
primary key(CourseID, StudentID, Date) 
)