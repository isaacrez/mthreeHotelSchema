DROP DATABASE IF EXISTS HotelSchema;
CREATE DATABASE HotelSchema;

USE HotelSchema;

CREATE TABLE RoomType (
	RoomTypeId INT PRIMARY KEY AUTO_INCREMENT,
    RoomType VARCHAR(20),
    RoomOccupancy INT,
    MaxRoomOccupancy INT,
    ExtraPersonFee DECIMAL(5, 2),
    Price DECIMAL(6, 2),
    hasJacuzzi BOOL,
    hasOven BOOL
);

CREATE TABLE Room (
	RoomNumber INT PRIMARY KEY,
    RoomTypeId INT,
	FOREIGN KEY fk_Room_RoomType (RoomTypeId)
		REFERENCES RoomType (RoomTypeId),
	
    ADA BOOL,
    hasMicrowave BOOL,
    hasFridge BOOL
);

CREATE TABLE Guest (
	GuestId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(30),
    State CHAR(2),
    Zipcode CHAR(5),
    Phone CHAR(10)
);

CREATE TABLE Reservation (
	ReservationId INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber INT,
    FOREIGN KEY fk_Reservation_Room (RoomNumber)
		REFERENCES Room (RoomNumber),
        
	GuestId INT,
    FOREIGN KEY fk_Reservation_Guest (GuestId)
		REFERENCES Guest (GuestId),
        
	StartDate DATE,
    EndDate DATE,
    TotalCost DEC(8, 2),
    Adults INT,
    Children INT
);
