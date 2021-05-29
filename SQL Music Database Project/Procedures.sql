 USE Proj_A3

-- COUNTRY procedure

CREATE PROCEDURE INSERT_tblCOUNTRY
@Country_Name varchar(20),
@Region_Name varchar (20),
@Country_Descr varchar(30)
AS

DECLARE @R_ID INT

SET @R_ID = (SELECT RegionID 
			 FROM tblREGION 
			 WHERE RegionName = @Region_Name)

IF @R_ID IS NULL
	BEGIN
	PRINT 'Error present in @R_ID'; 
	THROW 51007, '@R_ID cannot be NULL; process is terimnating', 1;
	END


BEGIN TRANSACTION C1
INSERT INTO tblCOUNTRY(CountryName, RegionID, CountryDescr)
VALUES (@Country_Name, @R_ID, @Country_Descr)
IF @@ERROR <> 0
	BEGIN
		PRINT 'Something is wrong...rolling back' 
		ROLLBACK 
	END
ELSE
	COMMIT TRANSACTION C1

-- USER procedure

CREATE PROCEDURE INSERT_tblUSER
@Country_Name varchar(20),
@First_Name varchar(20),
@Last_Name varchar(20),
@Birth_Date Date,
@Race_Name varchar(20),
@Gender_Name varchar(20)
AS

DECLARE @C_ID INT, @R_ID INT, @G_ID INT

SET @C_ID = (SELECT CountryID 
			 FROM tblCOUNTRY
			 WHERE CountryName = @Country_Name)

IF @C_ID IS NULL
	BEGIN
	PRINT 'Error present in @C_ID'; 
	THROW 51007, '@C_ID cannot be NULL; process is terimnating', 1;
	END

SET @R_ID = (SELECT RaceID 
			 FROM tblRACE
			 WHERE RaceName = @Race_Name)

IF @R_ID IS NULL
	BEGIN
	PRINT 'Error present in @R_ID'; 
	THROW 51007, '@R_ID cannot be NULL; process is terimnating', 1;
	END

SET @G_ID = (SELECT GenderID 
			 FROM tblGENDER
			 WHERE GenderName = @Gender_Name)

IF @G_ID IS NULL
	BEGIN
	PRINT 'Error present in @G_ID'; 
	THROW 51007, '@G_ID cannot be NULL; process is terimnating', 1;
	END

BEGIN TRANSACTION U1
INSERT INTO tblUSER(CountryID, FirstName, LastName, BirthDate, RaceID, GenderID)
VALUES (@C_ID, @First_Name, @Last_Name, @Birth_Date, @R_ID, @G_ID)
IF @@ERROR <> 0
	BEGIN
		PRINT 'Something is wrong...rolling back' 
		ROLLBACK 
	END
ELSE
	COMMIT TRANSACTION U1

-- ACCESS procedure

CREATE PROCEDURE INSERT_tblACCESS
@First_Name varchar(20),
@Last_Name varchar(20),
@Birth_Date Date,
@Song_Name varchar(50),
@Recording_Type varchar(50),
@Access_Date Date,
@Access_Type_Name varchar(20)
AS

DECLARE @U_ID INT, @S_ID INT, @R_ID INT, @AT_ID INT

SET @U_ID = (SELECT UserID 
			 FROM tblUSER
			 WHERE FirstName = @First_Name
				AND LastName = @Last_Name
				AND BirthDate = @Birth_Date)

IF @U_ID IS NULL
	BEGIN
	PRINT 'Error present in @U_ID'; 
	THROW 51007, '@U_ID cannot be NULL; process is terimnating', 1;
	END

SET @S_ID = (SELECT SongID 
			 FROM tblSONG
			 WHERE SongName = @Song_Name)

IF @S_ID IS NULL
	BEGIN
	PRINT 'Error present in @S_ID'; 
	THROW 51007, '@S_ID cannot be NULL; process is terimnating', 1;
	END

SET @R_ID = (SELECT RecordingID 
			 FROM tblRECORDING
			 WHERE SongID = @S_ID 
				AND RecordingType = @Recording_Type)

IF @R_ID IS NULL
	BEGIN
	PRINT 'Error present in @R_ID'; 
	THROW 51007, '@R_ID cannot be NULL; process is terimnating', 1;
	END

SET @AT_ID = (SELECT AccessTypeID 
			 FROM tblACCESS_TYPE
			 WHERE AccessTypeName = @Access_Type_Name)

IF @AT_ID IS NULL
	BEGIN
	PRINT 'Error present in @AT_ID'; 
	THROW 51007, '@AT_ID cannot be NULL; process is terimnating', 1;
	END

BEGIN TRANSACTION A1
INSERT INTO tblACCESS (UserID, RecordingID, AccessDate, AccessTypeID)
VALUES (@U_ID, @R_ID, @Access_Date, @AT_ID)
IF @@ERROR <> 0
	BEGIN
		PRINT 'Something is wrong...rolling back' 
		ROLLBACK 
	END
ELSE
	COMMIT TRANSACTION A1

