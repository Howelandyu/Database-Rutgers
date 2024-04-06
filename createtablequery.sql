
drop table Transactions
CREATE TABLE Transactions (
    bill_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    item VARCHAR(255) NOT NULL,
    `type` ENUM('food', 'beer') NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bills(bill_id)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Transactions.csv' 
INTO TABLE transactions 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5) 
SET bill_id=@col1,
quantity=@col2,
item=@col3,
`type`=@col4,
price=@col5

-- -------------------------------------------------------------
drop table barfood
CREATE TABLE BarFood (
    name VARCHAR(255) NOT NULL,
    primary key(name)
)
LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//BarFood.csv' 
INTO TABLE barfood 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1) 
SET name=@col1
-- -----------------------------------------------
drop table Bartender
CREATE TABLE Bartender (
    name VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    state VARCHAR(255),
    primary key(name)
)

LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Bartender.csv' 
INTO TABLE Bartender 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3) 
SET name=@col1,
Phone=@col2,
state=@col3
-- ----------------------------------------------
drop table Bills
create table Bills(
	bill_id VARCHAR(255) NOT NULL,
    bar VARCHAR(255) NOT NULL,
    `date` datetime NOT NULL,
    drinker VARCHAR(255) NOT NULL,
    items_price FLOAT NOT NULL,
    tax_price FLOAT NOT NULL,
    tip FLOAT NOT NULL,
    total_price FLOAT NOT NULL,
    `time` time NOT NULL,
    bartender VARCHAR(255) NOT NULL,
    `day` VARCHAR(255) NOT NULL,
	primary key(bill_id),
    FOREIGN KEY (bar) REFERENCES bars(name),
    FOREIGN KEY (drinker) REFERENCES drinkers(name),
    FOREIGN KEY (bartender) REFERENCES bartender(name)-- ,
--     FOREIGN KEY (`day`) REFERENCES Day(`name`)
)

LOAD DATA local INFILE 'C:\\Program Files\\MySQL\\MySQL Server 8.0\\download\\Bills.csv' 
INTO TABLE bills 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5,@col6,@col7,@col8,@col9,@col10,@col11) 
SET bill_id=@col1,
bar=@col2,
`date`=@col3,
drinker=@col4,
items_price=@col5,
tax_price=@col6,
tip=@col7,
total_price=@col8,
`time`=@col9,
bartender=@col10,
`day`=@col11
-- --------------------------
drop table day
create table Day(
	name VARCHAR(255) NOT NULL,
    primary key(name)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Day.csv' 
INTO TABLE day 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1) 
SET name=@col1
-- ---------------------------------
drop table inventory
 CREATE TABLE Inventory (
    bar VARCHAR(255) NOT NULL,
    beer VARCHAR(255) NOT NULL,
    date VARCHAR(255) NOT NULL,
    startquantity Int NOT NULL,
    endquantity INT NOT NULL,
    FOREIGN KEY (bar) REFERENCES bars(name),
    FOREIGN KEY (beer) REFERENCES beers(name)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Inventory.csv' 
INTO TABLE inventory 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5) 
SET bar=@col1,
beer=@col2,
date=@col3,
startquantity=@col4,
endquantity=@col5

-- ------------------------------------
drop table Operates
  CREATE TABLE Operates (
    bar VARCHAR(255) NOT NULL,
    day VARCHAR(255) NOT NULL,
    start time NOT NULL,
    end time NOT NULL,
    date date NOT NULL,
	FOREIGN KEY (bar) REFERENCES bars(name),
    FOREIGN KEY (day) REFERENCES day(name)
)

LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Operates.csv' 
INTO TABLE operates 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5) 
SET bar=@col1,
day=@col2,
start=@col3,
end=@col4,
date=@col5

-- ------------------------------------------
drop table sellsbeer
CREATE TABLE SellsBeer (
    barname VARCHAR(255) NOT NULL,
    beername VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
	FOREIGN KEY (barname) REFERENCES bars(name),
    FOREIGN KEY (beername) REFERENCES beers(name)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//SellsBeer.csv' 
INTO TABLE sellsbeer 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3) 
SET barname=@col1,
beername=@col2,
price=@col3

-- -----------------------------------------
drop table SellsFood
CREATE TABLE SellsFood (
    barname VARCHAR(255) NOT NULL,
    foodname VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
	FOREIGN KEY (barname) REFERENCES bars(name)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//SellsFood.csv' 
INTO TABLE sellsfood 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3) 
SET barname=@col1,
foodname=@col2,
price=@col3

-- --------------------------------------------
drop table Shift
 CREATE TABLE Shift (
    bar VARCHAR(255) NOT NULL,
    bartender VARCHAR(255) NOT NULL,
    day VARCHAR(255) NOT NULL,
    start VARCHAR(255) NOT NULL,
    end VARCHAR(255) NOT NULL,
    date VARCHAR(255) NOT NULL,
    FOREIGN KEY (bar) REFERENCES bars(name),
    FOREIGN KEY (bartender) REFERENCES bartender(name),
    FOREIGN KEY (day) REFERENCES day(name)
)

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Shifts.csv' 
INTO TABLE shift 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5,@col6) 
SET bar=@col1,
bartender=@col2,
day=@col3,
start=@col4,
end=@col5,
date=@col6
-- ------------------------------------------------
DROP TABLE IF EXISTS `beers`;

CREATE TABLE `beers` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `manf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
)  

LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Beer.csv' 
INTO TABLE beers 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2) 
SET name=@col1,
manf=@col2
-- ----------------------------------------------------------------
drop table frequents
create table frequents(
	bar varchar(255) Not null,
    drinker varchar(255) not null,
	FOREIGN KEY (bar) REFERENCES bars(name),
    FOREIGN KEY (drinker) REFERENCES drinkers(name)
)
LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Frequents.csv' 
INTO TABLE frequents 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2) 
SET bar=@col1,
drinker=@col2
-- ----------------------------------------------------------

-- ----------------------------------------------------------
drop table likes
create table likes(
	drinker varchar(255) Not null,
    beer varchar(255) not null,
    FOREIGN KEY (drinker) REFERENCES drinkers(name),
    FOREIGN KEY (beer) REFERENCES beers(name)
)
LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Likes.csv' 
INTO TABLE likes 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2) 
SET drinker=@col1,
beer=@col2
-- --------------------------------------------------------
drop table drinkers
create table drinkers(
	name varchar(255) Not null,
    phone varchar(255) not null,
    state varchar(255) not null,
    primary key(name)
)
LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Drinker.csv' 
INTO TABLE drinkers 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2,@col3) 
SET name=@col1,
phone=@col2,
state=@col3
-- -------------------------------------------------------------------
drop table bars
create table bars(
	name varchar(255) Not null,
    state varchar(255) not null,
    primary key(name)
)
LOAD DATA local INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Bar.csv' 
INTO TABLE bars 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1,@col2) 
SET name=@col1,
state=@col2
    
-- -------------------------------------------------------------------
drop table test
create table test(
	test1 VARCHAR(255) NOT NULL,
    day VARCHAR(255) NOT NULL,
	primary key(test1),
    FOREIGN KEY (day) REFERENCES Day(name)
)



