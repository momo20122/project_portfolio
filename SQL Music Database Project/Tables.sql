--CREATE DATABASE Proj_A3

USE Proj_A3

CREATE TABLE tblRACE
(RaceID INTEGER IDENTITY(1,1) primary key,
RaceName varchar(20) NOT NULL,
RaceDescr varchar(20) NOT NULL)
GO

CREATE TABLE tblGENDER
(GenderID INTEGER IDENTITY(1,1) primary key,
GenderName varchar(20) NOT NULL,
GenderDescr varchar(20) NOT NULL)
GO

CREATE TABLE tblACCESS_TYPE
(AccessTypeID INTEGER IDENTITY(1,1) primary key,
AccessTypeName varchar(20) NOT NULL,
AccessTypeDescr varchar(20) NOT NULL)
GO

CREATE TABLE tblCOUNTRY
(CountryID INTEGER IDENTITY(1,1) primary key,
CountryName varchar(20) NOT NULL,
RegionID INTEGER FOREIGN KEY REFERENCES tblREGION (RegionID) NOT NULL,
CountryDescr varchar(30) NOT NULL)
GO

CREATE TABLE tblUSER 
(UserID INTEGER IDENTITY(1,1) primary key,
CountryID INTEGER FOREIGN KEY REFERENCES tblCOUNTRY (CountryID),
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
BirthDate Date,
RaceID INTEGER FOREIGN KEY REFERENCES tblRACE (RaceID),
GenderID INTEGER FOREIGN KEY REFERENCES tblGENDER (GenderID))
GO

CREATE TABLE tblACCESS 
(UserID INTEGER FOREIGN KEY REFERENCES tblUSER (UserID),
RecordingID INTEGER FOREIGN KEY REFERENCES tblRECORDING (RecordingID),
AccessDate Date)
GO

ALTER TABLE tblACCESS
ADD AccessTypeID INTEGER FOREIGN KEY REFERENCES tblACCESS_TYPE (AccessTypeID)
GO











