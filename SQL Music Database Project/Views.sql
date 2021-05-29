SELECT * FROM tblACCESS

USE Proj_A3

/*
Write code to determine which male users streamed at least 2 Alternative Rock recordings and is from 
North America who also downloaded at most 2 songs from the album titled 'Nevermind'
*/
CREATE VIEW Male_Rock_Nevermind_view
AS

SELECT U.UserID, U.FirstName, U.LastName, Num_RockStreams, COUNT(AM.AlbumID) AS Nevermind_Downloads
FROM tblUSER U
	JOIN tblACCESS A ON U.UserID = A.UserID
	JOIN tblACCESS_TYPE ACT ON A.AccessTypeID = ACT.AccessTypeID
	JOIN tblRECORDING R ON A.RecordingID = R.RecordingID
	JOIN tblALBUM_RECORDING AR ON R.RecordingID = AR.RecordingID
	JOIN tblALBUM AM ON AR.AlbumID = AM.AlbumID
	JOIN (SELECT U.UserID, U.FirstName, U.LastName, COUNT(R.RecordingID) AS Num_RockStreams
		  FROM tblUSER U
			JOIN tblGENDER GR ON U.GenderID = GR.GenderID
			JOIN tblCOUNTRY C ON U.CountryID = C.CountryID
			JOIN tblREGION RG ON C.RegionID = RG.RegionID
			JOIN tblACCESS A ON U.UserID = A.UserID
			JOIN tblACCESS_TYPE ACT ON A.AccessTypeID = ACT.AccessTypeID
			JOIN tblRECORDING R ON A.RecordingID = R.RecordingID
			JOIN tblGENRE G ON R.GenreID = G.GenreID
		  WHERE G.GenreName = 'Alternative Rock'
			AND ACT.AccessTypeName = 'Stream'
			AND RG.RegionName = 'North America'
			AND GR.GenderName = 'Male'
		  GROUP BY U.UserID, U.FirstName, U.LastName
		  HAVING COUNT(R.RecordingID) >= 2) AS subq1 ON U.UserID = subq1.UserID
WHERE AM.AlbumName = 'Nevermind'
	AND ACT.AccessTypeName = 'Download'
GROUP BY U.UserID, U.FirstName, U.LastName, Num_RockStreams
HAVING COUNT(AM.AlbumID) <= 2

/* 
Write code to determine the most popular Hip Hop song recording that was streamed at least 2
times by users whose first names start with an 'S' and are older than 17 years old
*/

CREATE VIEW HipHop_stream_view
AS

SELECT TOP 1 R.RecordingID, S.SongID, S.SongName, COUNT(R.RecordingID) AS Num_Streams
FROM tblUSER U
	JOIN tblACCESS A ON U.UserID = A.UserID
	JOIN tblACCESS_TYPE ACT ON A.AccessTypeID = ACT.AccessTypeID
	JOIN tblRECORDING R ON A.RecordingID = R.RecordingID
	JOIN tblGENRE G ON R.GenreID = G.GenreID
	JOIN tblSONG S ON R.SongID = S.SongID
WHERE G.GenreName = 'Hip Hop'
	AND ACT.AccessTypeName = 'Stream'
	AND U.FirstName LIKE 'S%'
	AND U.BirthDate < (SELECT GetDate() - (365.25*17))
GROUP BY R.RecordingID, S.SongID, S.SongName
HAVING COUNT(R.RecordingID) >= 2
ORDER BY COUNT(R.RecordingID) DESC

