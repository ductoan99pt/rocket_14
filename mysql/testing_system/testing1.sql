-- create database
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- create table: Department
CREATE TABLE Department(
	DepartmentID 			INT auto_increment primary key,
    DepartmentName 			NVARCHAR(50)
);

-- create table: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID				INT auto_increment primary key,
    PositionName			NVARCHAR(50)
);

-- create table: Account
CREATE TABLE `Account`(
	AccountID				INT auto_increment primary key,
    Email					NVARCHAR(50),
    Username				NVARCHAR(50),
    FullName				NVARCHAR(50),
    DepartmentID 			INT,
    PositionID				INT,
    CreateDATE				DATE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table: Group
CREATE TABLE `Group`(
	GroupID					INT auto_increment primary key,
    GroupName				VARCHAR(50),
    CreatorID				INT,
    CreateDATE				DATE
);

-- create table: GroupAccount
CREATE TABLE GroupAccount(
	GroupID					INT primary key,
    AccountID				int primary key,
    JoinDATE				DATE
);

-- create table: TypeQuestion
CREATE TABLE TypeQuestion (
    TypeID 		INT,
    TypeName  ENUM('sesay','multyple-choice')
);

-- create table: CategoryQuestion
CREATE TABLE CategoryQuestion(
    CategoryID				INT auto_increment primary key,
    CategoryName			NVARCHAR(50) 
);

-- create table: Question
CREATE TABLE Question(
    QuestionID				INT auto_increment primary key,
    Content					NVARCHAR(50) ,
    CategoryID				INT,
    TypeID					INT,
    CreatorID				INT,
    CreateDATE				DATE,
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);

-- create table: Answer
CREATE TABLE Answer(
    Answers					INT auto_increment primary key,
    Content					NVARCHAR(50),
    QuestionID				INT,
    isCorrect				BIT, 
    foreign key (QuestionID) references Question(QuestionID)
);

-- create table: Exam2
CREATE TABLE Exam(
    ExamID					INT auto_increment primary key,
    Code					NVARCHAR(10),
    Title					NVARCHAR(50),
    CategoryID				INT,
    Duration				INT,
    CreatorID				INT,
    CreateDATE				DATE,
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table: ExamQuestion
CREATE TABLE ExamQuestion(
    ExamID				INT,
	QuestionID			INT,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    PRIMARY KEY (ExamID,QuestionID)
);
