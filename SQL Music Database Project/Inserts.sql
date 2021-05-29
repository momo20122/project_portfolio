USE Proj_A3

INSERT INTO tblRACE (RaceName, RaceDescr)
VALUES ('Asian', 'Asian people'),
('Black', 'Black people'),
('White', 'White people'),
('Hispanic', 'Hispanic people'),
('Native American', 'Native Americans'),
('Pacific Islander', 'Pacific Islanders')
GO

DELETE FROM tblRACE WHERE RaceID = 2;

SELECT * FROM tblRACE

INSERT INTO tblGENDER (GenderName, GenderDescr)
VALUES ('Male', 'Identifies as male'),
('Female', 'Identifies as female'),
('Non-Binary', 'Not one gender')
GO

INSERT INTO tblACCESS_TYPE (AccessTypeName, AccessTypeDescr)
VALUES ('Download', 'Downloading a song'),
('Stream', 'Streaming a song')
GO

-- insert into country

EXEC INSERT_tblCOUNTRY
@Country_Name = 'United States',
@Region_Name = 'North America',
@Country_Descr = '50 states'

EXEC INSERT_tblCOUNTRY
@Country_Name = 'United Kingdom',
@Region_Name = 'Europe',
@Country_Descr = 'Great Britain, N. Ireland'

EXEC INSERT_tblCOUNTRY
@Country_Name = 'Brazil',
@Region_Name = 'South America',
@Country_Descr = 'Largest SA country'

EXEC INSERT_tblCOUNTRY
@Country_Name = 'Nigeria',
@Region_Name = 'Africa',
@Country_Descr = 'On Gulf of Guinea'

EXEC INSERT_tblCOUNTRY
@Country_Name = 'South Korea',
@Region_Name = 'Asia',
@Country_Descr = 'Green, hilly countryside'

-- insert into Group

INSERT INTO tblGROUP(GroupName, GroupDescr, BeginDate, EndDate)
VALUES ('N.W.A.', 'Gangsta rap group', 'January 5, 1987', 'February 1, 1992')
GO

-- insert into Artist Group

ALTER TABLE tblARTIST_GROUP
ALTER COLUMN EndDate Date NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Nirvana',
@A_Fname = 'Kurt',
@A_Lname = 'Cobain',
@A_Bday = 'February 20, 1967',
@AG_BD = 'September 14, 1987',
@AG_ED = 'December 2, 1994'

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Nirvana',
@A_Fname = 'Krist',
@A_Lname = 'Novoselic',
@A_Bday = 'May 16, 1965',
@AG_BD = 'September 14, 1987',
@AG_ED = 'December 2, 1994'

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Nirvana',
@A_Fname = 'Dave',
@A_Lname = 'Grohl',
@A_Bday = 'January 14, 1969',
@AG_BD = 'September 14, 1987',
@AG_ED = 'December 2, 1994'

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Thom',
@A_Lname = 'Yorke',
@A_Bday = 'October 7, 1968',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Jonny',
@A_Lname = 'Greenwood',
@A_Bday = 'November 5, 1971',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Colin',
@A_Lname = 'Greenwood',
@A_Bday = 'June 26, 1969',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Ed',
@A_Lname = 'O''Brien',
@A_Bday = 'April 15, 1968',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Philip',
@A_Lname = 'Selway',
@A_Bday = 'May 23, 1967',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'Radiohead',
@A_Fname = 'Philip',
@A_Lname = 'Selway',
@A_Bday = 'May 23, 1967',
@AG_BD = 'January 2, 1985',
@AG_ED = NULL

EXEC INSERT_tblARTIST_GROUP 
@G_name = 'N.W.A.',
@A_Fname = 'Eric',
@A_Lname = 'Wright',
@A_Bday = 'September 7, 1964',
@AG_BD = 'January 5, 1987',
@AG_ED = 'February 1, 1992'

-- insert into User

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Mark',
@Last_Name = 'Fox',
@Birth_Date = 'November 1, 1990',
@Race_Name = 'White',
@Gender_Name = 'Male'

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Jack',
@Last_Name = 'Jones',
@Birth_Date = 'December 12, 1995',
@Race_Name = 'Black',
@Gender_Name = 'Male'

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Robert',
@Last_Name = 'Edwards',
@Birth_Date = 'September 22, 1997',
@Race_Name = 'Hispanic',
@Gender_Name = 'Male'

EXEC INSERT_tblUSER
@Country_Name = 'South Korea',
@First_Name = 'Henry',
@Last_Name = 'Lee',
@Birth_Date = 'November 25, 1999',
@Race_Name = 'Asian',
@Gender_Name = 'Male'

EXEC INSERT_tblUSER
@Country_Name = 'South Korea',
@First_Name = 'John',
@Last_Name = 'Kim',
@Birth_Date = 'May 5, 1990',
@Race_Name = 'Asian',
@Gender_Name = 'Male'

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Sam',
@Last_Name = 'Scott',
@Birth_Date = 'June 17, 1994',
@Race_Name = 'White',
@Gender_Name = 'Non-Binary'

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Max',
@Last_Name = 'Smith',
@Birth_Date = 'August 9, 1996',
@Race_Name = 'Black',
@Gender_Name = 'Non-Binary'

EXEC INSERT_tblUSER
@Country_Name = 'United States',
@First_Name = 'Sally',
@Last_Name = 'Griffin',
@Birth_Date = 'January 19, 2000',
@Race_Name = 'Native American',
@Gender_Name = 'Female'

EXEC INSERT_tblUSER
@Country_Name = 'United Kingdom',
@First_Name = 'Cheryl',
@Last_Name = 'Houston',
@Birth_Date = 'November 18, 2001',
@Race_Name = 'Pacific Islander',
@Gender_Name = 'Female'

EXEC INSERT_tblUSER
@Country_Name = 'United Kingdom',
@First_Name = 'Liz',
@Last_Name = 'Jackson',
@Birth_Date = 'October 29, 2000',
@Race_Name = 'White',
@Gender_Name = 'Female'

-- insert into Song

EXECUTE INSERT_tblSONG 
@S_name = 'Karma Police', 
@Y_released = 1991, 
@S_descr = 'Beautiful and haunting rock ballad.', 
@G_name = 'Radiohead',
@A_Fname = 'Thom', 
@A_Lname = 'Yorke', 
@A_Bday = 'October 7, 1968'

EXECUTE INSERT_tblSONG 
@S_name = 'Straight Outta Compton', 
@Y_released = 1988, 
@S_descr = 'Famous influential gangsta rap song.', 
@G_name = 'N.W.A.',
@A_Fname = 'Eric', 
@A_Lname = 'Wright', 
@A_Bday = 'September 7, 1964'

-- insert into Recording

EXEC INSERT_RECORDING
@G_Name = 'Alternative Rock',
@S_Name = 'Drain you',
@R_Type = 'Studio',
@R_Descr = 'Official version of the song recorded in a studio setting and released to the public'

EXEC INSERT_RECORDING
@G_Name = 'Alternative Rock',
@S_Name = 'Karma Police',
@R_Type = 'Studio',
@R_Descr = 'Official version of the song recorded in a studio setting and released to the public'

EXEC INSERT_RECORDING
@G_Name = 'Hip Hop',
@S_Name = 'Straight Outta Compton',
@R_Type = 'Studio',
@R_Descr = 'Official version of the song recorded in a studio setting and released to the public'

-- insert into Album_Recording

EXECUTE INSERT_ALBUM_RECORDING 
@R_Type = 'Studio', 
@A_Name = 'Nevermind',
@S_Name = 'Drain you'

EXECUTE INSERT_ALBUM_RECORDING 
@R_Type = 'Studio', 
@A_Name = 'OK Computer',
@S_Name = 'Karma Police'

EXECUTE INSERT_ALBUM_RECORDING 
@R_Type = 'Studio', 
@A_Name = 'N.W.A. and the Posse',
@S_Name = 'Straight Outta Compton'

-- insert into Album
INSERT INTO tblALBUM(AlbumName, AlbumDescr, ReleaseDate)
VALUES ('N.W.A. and the Posse', 'Gangsta rap album', 'November 6, 1987')

-- insert into Access

EXEC INSERT_tblACCESS
@First_Name = 'Mark',
@Last_Name = 'Fox',
@Birth_Date = 'November 1, 1990',
@Song_Name = 'Drain you',
@Recording_Type = 'Studio',
@Access_Date = 'September 9, 2018',
@Access_Type_Name = 'Download'

EXEC INSERT_tblACCESS
@First_Name = 'Jack',
@Last_Name = 'Jones',
@Birth_Date = 'December 12, 1995',
@Song_Name = 'Smells Like Teen Spirit',
@Recording_Type = 'Studio',
@Access_Date = 'October 28, 2019',
@Access_Type_Name = 'Stream'

EXEC INSERT_tblACCESS
@First_Name = 'Robert',
@Last_Name = 'Edwards',
@Birth_Date = 'September 22, 1997',
@Song_Name = 'Karma Police',
@Recording_Type = 'Studio',
@Access_Date = 'March 2, 2017',
@Access_Type_Name = 'Download'

EXEC INSERT_tblACCESS
@First_Name = 'Henry',
@Last_Name = 'Lee',
@Birth_Date = 'November 25, 1999',
@Song_Name = 'Karma Police',
@Recording_Type = 'Studio',
@Access_Date = 'August 5, 2019',
@Access_Type_Name = 'Download'

EXEC INSERT_tblACCESS
@First_Name = 'John',
@Last_Name = 'Kim',
@Birth_Date = 'May 5, 1990',
@Song_Name = 'Drain you',
@Recording_Type = 'Studio',
@Access_Date = 'June 18, 2017',
@Access_Type_Name = 'Stream'

EXEC INSERT_tblACCESS
@First_Name = 'Mark',
@Last_Name = 'Fox',
@Birth_Date = 'November 1, 1990',
@Song_Name = 'Smells Like Teen Spirit',
@Recording_Type = 'Studio',
@Access_Date = 'September 17, 2018',
@Access_Type_Name = 'Stream'

EXEC INSERT_tblACCESS
@First_Name = 'Mark',
@Last_Name = 'Fox',
@Birth_Date = 'November 1, 1990',
@Song_Name = 'Karma Police',
@Recording_Type = 'Studio',
@Access_Date = 'September 20, 2018',
@Access_Type_Name = 'Stream'

EXEC INSERT_tblACCESS
@First_Name = 'Sally',
@Last_Name = 'Griffin',
@Birth_Date = 'January 19, 2000',
@Song_Name = 'Boyz-n-the-Hood',
@Recording_Type = 'Studio',
@Access_Date = 'January 5, 2019',
@Access_Type_Name = 'Stream'

EXEC INSERT_tblACCESS
@First_Name = 'Sally',
@Last_Name = 'Griffin',
@Birth_Date = 'January 19, 2000',
@Song_Name = 'Boyz-n-the-Hood',
@Recording_Type = 'Studio',
@Access_Date = 'January 6, 2019',
@Access_Type_Name = 'Stream'

SELECT * FROM tblGROUP
SELECT * FROM tblSONG
SELECT * FROM tblCOUNTRY
SELECT * FROM tblARTIST
SELECT * FROM tblALBUM
SELECT * FROM tblARTIST_GROUP
SELECT * FROM tblARTIST
SELECT * FROM tblGENRE
SELECT * FROM tblACCESS
SELECT * FROM tblRACE
SELECT * FROM tblGENDER
SELECT * FROM tblUSER
SELECT * FROM tblRECORDING
SELECT * FROM tblALBUM_RECORDING
SELECT * FROM tblACCESS_TYPE







