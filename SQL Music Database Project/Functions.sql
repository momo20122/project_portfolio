USE Proj_A3

/*
Future Dates (User and album)

User BirthDate is 13 or older

*/

-- User must be at least 13 years old

CREATE FUNCTION fn_MustBe13()
RETURNS INTEGER 
AS
BEGIN
	DECLARE @RET INTEGER = 0
	IF EXISTS (SELECT *
			   FROM tblUSER
			   WHERE BirthDate > DateAdd(Year, -13, GetDate())
			  )
	BEGIN
		SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblUSER
ADD CONSTRAINT CK_No13
CHECK (dbo.fn_MustBe13() = 0)

-- User BirthDate cannot be in the future

CREATE FUNCTION fn_AppropriateBirthDate()
RETURNS INTEGER 
AS
BEGIN
	DECLARE @RET INTEGER = 0
	IF EXISTS (SELECT *
			   FROM tblUSER
			   WHERE BirthDate > GetDate()
			  )
	BEGIN
		SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblUSER
ADD CONSTRAINT CK_AppropriateBirthDate
CHECK (dbo.fn_AppropriateBirthDate() = 0)

-- Album release date cannot be in the future

CREATE FUNCTION fn_AppropriateAlbumDate()
RETURNS INTEGER 
AS
BEGIN
	DECLARE @RET INTEGER = 0
	IF EXISTS (SELECT *
			   FROM tblALBUM
			   WHERE ReleaseDate > GetDate()
			  )
	BEGIN
		SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblALBUM
ADD CONSTRAINT CK_AppropriateAlbumDate
CHECK (dbo.fn_AppropriateAlbumDate() = 0)

-- There cannot be a song created by a Hip Hop artist who is over 100 
-- years old and has a name handle beginning with 'Lil'

CREATE FUNCTION fn_No100HipHopLil()
RETURNS INTEGER 
AS
BEGIN
	DECLARE @RET INTEGER = 0
	IF EXISTS (SELECT *
			   FROM tblARTIST A
				JOIN tblARTIST_GROUP AG on A.ArtistID = AG.ArtistID
				JOIN tblSONG S ON AG.Artist_GroupID = S.Artist_GroupID
				JOIN tblRECORDING R ON S.SongID = R.SongID
				JOIN tblGENRE G ON R.GenreID = G.GenreID
			   WHERE BirthDate < DateAdd(Year, -100, GetDate())
				AND A.ArtistHandle LIKE 'Lil%'
				AND G.GenreName = 'Hip Hop'
			  )
	BEGIN
		SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblSONG
ADD CONSTRAINT CK_No100HipHopLil
CHECK (dbo.fn_No100HipHopLil() = 0)







