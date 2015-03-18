CREATE TABLE SchoolInformation (
 schoolId INT NOT NULL,
 schoolName CHAR(50) NOT NULL,
 address VARCHAR(100),
 tuition FLOAT(10),
 score FLOAT(20),
 ranking INT,
 phoneNumber CHAR(20),
 emailAddress CHAR(40),
 schoolLogo CHAR(50),
 description VARCHAR(300)
);

ALTER TABLE SchoolInformation ADD CONSTRAINT PK_SchoolInformation PRIMARY KEY (schoolId);


CREATE TABLE SchoolNews (
 schoolNewsId INT NOT NULL,
 newsDate TIMESTAMP(10),
 newsContent CHAR(40),
 schoolId INT
);

ALTER TABLE SchoolNews ADD CONSTRAINT PK_SchoolNews PRIMARY KEY (schoolNewsId);


CREATE TABLE User (
 userId INT NOT NULL,
 userName CHAR(30),
 sex BIT(1),
 headImage CHAR(100),
 emailAddress CHAR(40),
 score FLOAT(10),
 test_Type BIT(10),
 GPA FLOAT(10),
 GREScore FLOAT(10)
);

ALTER TABLE User ADD CONSTRAINT PK_User PRIMARY KEY (userId);


CREATE TABLE Favourites (
 collectId INT NOT NULL,
 collectType BIT(1),
 schoolId INT,
 userId INT
);

ALTER TABLE Favourites ADD CONSTRAINT PK_Favourites PRIMARY KEY (collectId);


CREATE TABLE Note (
 noteId INT NOT NULL,
 pushDate TIMESTAMP(10),
 collectedTimes INT,
 userId INT,
 pushContent VARCHAR(1000)
);

ALTER TABLE Note ADD CONSTRAINT PK_Note PRIMARY KEY (noteId);


CREATE TABLE Comment (
 commentId INT NOT NULL,
 userId INT NOT NULL,
 commentDate TIMESTAMP(10),
 noteId INT NOT NULL,
 commentContent VARCHAR(300)
);

ALTER TABLE Comment ADD CONSTRAINT PK_Comment PRIMARY KEY (commentId);


ALTER TABLE SchoolNews ADD CONSTRAINT FK_SchoolNews_0 FOREIGN KEY (schoolId) REFERENCES SchoolInformation (schoolId);


ALTER TABLE Favourites ADD CONSTRAINT FK_Favourites_0 FOREIGN KEY (schoolId) REFERENCES SchoolInformation (schoolId);
ALTER TABLE Favourites ADD CONSTRAINT FK_Favourites_1 FOREIGN KEY (userId) REFERENCES User (userId);


ALTER TABLE Note ADD CONSTRAINT FK_Note_0 FOREIGN KEY (userId) REFERENCES User (userId);


ALTER TABLE Comment ADD CONSTRAINT FK_Comment_0 FOREIGN KEY (userId) REFERENCES User (userId);
ALTER TABLE Comment ADD CONSTRAINT FK_Comment_1 FOREIGN KEY (noteId) REFERENCES Note (noteId);


