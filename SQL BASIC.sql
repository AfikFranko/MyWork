drop database if exists `TARGIL` ;
CREATE DATABASE `TARGIL` ;

USE `TARGIL`;
#
# Dropping tables
#

DROP TABLE IF EXISTS hotels;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS reservation;

#
# Table structure for tables hotels, guests, rooms and reservation
#

CREATE TABLE hotels(
hotel_code int(4) unsigned NOT NULL default '0',
hotel_name char(20) default NULL,
city char(20) default NULL,
address char(20) default NULL,
hotel_rank int(1) unsigned NOT NULL default '0',
phone char(10) default NULL,
number_of_rooms int(4) unsigned NOT NULL default '0',
PRIMARY KEY  (hotel_code));

CREATE TABLE guests(
id char(10) default NULL,
name char(20) default NULL,
city char(20) default NULL,
address char(20) default NULL,
state char(20) default NULL,
UNIQUE KEY  (id));

CREATE TABLE rooms(
hotel_code int(4) unsigned NOT NULL default '0',
room_number int(4) unsigned NOT NULL default '0',
type char(20) default NULL,
beds int(4) unsigned NOT NULL default '0',
price int(4) unsigned NOT NULL default '0',
PRIMARY KEY  (hotel_code, room_number));

CREATE TABLE reservation(
hotel_code int(4) unsigned NOT NULL default '0',
room_number int(4) unsigned NOT NULL default '0',
from_date char(20) default NULL,
to_date char(20) default NULL,
payment_method char(20) default NULL,
id char(10) default NULL,
UNIQUE KEY  (hotel_code, room_number, from_date));

#
# Dumping data for tables hotels, guests, rooms and reservation
#

INSERT INTO hotels VALUES
(1, 'Meridian', 'Tel Aviv', 'Shinkin 24', 3, '03-6527384', 230),
(2, 'Meridian', 'Tveria', 'Kineret 22', 5, '04-7369944', 320),
(3, 'King David', 'Jerusalem', 'Kineret 22', 5, '02-7435334', 200),
(4, 'Hilton', 'Jerusalem', 'Kineret 22', 4, '02-4566324', 180),
(5, 'Herods', 'Eilat', 'Dolphin 14', 4, '09-7333245', 190),
(6, 'Hof Yam', 'Haifa', 'Kasam 39', 5, '04-7344545', 150),
(7, 'Ha Tsuk', 'Haifa', 'Lohem 17', 3, '04-7345678', 110),
(8, 'Ha Nesiha', 'Eilat', 'Suf 4', 5, '09-6543543', 170),
(9, 'King David', 'Tveria', 'Kineret 55', 5, '04-7445544', 270);

INSERT INTO guests VALUES
('00000001-0', 'Adam', 'Gan Eden', 'Mango 3', 'Israel'),
('00000002-0', 'Eve', 'Gan Eden', 'Avucado 12', 'Israel'),
('04352244-4', 'Dani Mor', 'Tel Aviv', 'Magen 3', 'Israel'),
('06112343-6', 'Amiad Rozenberg', 'Petah Tikva', 'Zahal 14', 'Israel'),
('12345678-0', 'Ehud Olmert', 'Jerusalem', 'Money 99', 'Israel'),
('87654321-0', 'Moris Talenski', 'Jerusalem', 'Money 100', 'Israel'),
('04256372-0', 'Uri Meser', 'Holyland', 'Money 101', 'Israel'),
('02637482-0', 'Shula Zaken', 'Jerusalem', 'Money 102', 'Israel'),
('00000000-0', 'Gimel', 'Mosad', 'Secret 007', 'Dubai');

INSERT INTO rooms VALUES
(1, 100, 'basic', 2, 100),
(1, 101, 'basic', 2, 100),
(1, 102, 'basic', 2, 100),
(1, 200, 'double', 2, 100),
(1, 201, 'double', 2, 100),
(1, 202, 'double', 2, 100),
(1, 300, 'truple', 3, 180),
(1, 400, 'honeymoon', 2, 270),
(2, 100, 'basic', 2, 100),
(2, 200, 'double', 4, 200),
(2, 201, 'double', 4, 200),
(2, 202, 'double', 4, 200),
(2, 300, 'truple', 5, 220),
(2, 400, 'honeymoon', 3, 230),
(2, 401, 'honeymoon', 3, 230),
(3, 100, 'basic', 2, 80),
(3, 200, 'double', 2, 210),
(3, 201, 'double', 2, 210),
(3, 202, 'double', 2, 210),
(3, 300, 'truple', 4, 220),
(3, 400, 'honeymoon', 3, 230),
(4, 100, 'basic', 2, 100),
(4, 200, 'double', 1, 500),
(4, 300, 'truple', 4, 120),
(4, 301, 'truple', 4, 120),
(4, 400, 'honeymoon', 3, 230),
(4, 401, 'honeymoon', 3, 230),
(4, 402, 'honeymoon', 3, 230),
(4, 403, 'honeymoon', 3, 230),
(5, 100, 'basic', 2, 100),
(5, 200, 'double', 4, 150),
(5, 300, 'truple', 4, 340),
(5, 400, 'honeymoon', 3, 210),
(6, 100, 'basic', 2, 100),
(6, 101, 'basic', 2, 100),
(6, 200, 'double', 3, 110),
(6, 201, 'double', 3, 110),
(6, 300, 'truple', 4, 310),
(6, 400, 'honeymoon', 1, 240),
(7, 100, 'basic', 2, 100),
(7, 101, 'basic', 2, 100),
(7, 102, 'basic', 2, 100),
(7, 200, 'double', 4, 130),
(7, 300, 'truple', 2, 250),
(7, 301, 'truple', 2, 250),
(7, 302, 'truple', 2, 250),
(7, 400, 'honeymoon', 3, 280),
(8, 100, 'basic', 2, 90),
(8, 200, 'double', 4, 290),
(8, 300, 'truple', 2, 430),
(8, 400, 'honeymoon', 3, 150),
(9, 100, 'basic', 2, 130),
(9, 200, 'double', 4, 150),
(9, 300, 'truple', 2, 280),
(9, 400, 'honeymoon', 3, 270);

INSERT INTO reservation VALUES
(6, 300, '2010-06-15', '2010-06-29', 'cash', '00000001-0'),
(5, 400, '2010-01-02', '2010-01-13', 'credit', '00000001-0'),
(4, 300, '2010-06-15', '2010-07-01', 'cash', '00000002-0'),
(5, 400, '2010-01-01', '2010-01-13', 'credit', '00000002-0'),
(3, 200, '2010-06-15', '2010-08-01', 'cash', '04352244-4'),
(2, 100, '2010-04-15', '2010-06-21', 'cash', '06112343-6'),
(1, 100, '2010-06-23', '2010-07-01', 'cash', '06112343-6'),
(8, 300, '2010-04-12', '2010-04-15', 'cash', '12345678-0'),
(8, 200, '2010-04-12', '2010-04-15', 'cash', '87654321-0'),
(8, 100, '2010-04-12', '2010-04-15', 'cash', '04256372-0'),
(8, 200, '2010-04-17', '2010-04-25', 'cash', '04256372-0'),
(8, 200, '2010-04-25', '2010-04-29', 'cash', '02637482-0');
