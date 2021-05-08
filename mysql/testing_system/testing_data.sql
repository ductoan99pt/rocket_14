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
	GroupID					INT,
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
INSERT INTO  Department(departmentName) 
VALUE 										
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'quanly'	    ),
						(N'ketoan'      ),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
                                               
INSERT INTO Position (PosittionNane)
VALUE               ('Dev'			),
					('Test'			),
					('Scrum Master'	),
					('PM'			); 
                    
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUE                (N'tu@gamil.com'  					,'tu11'				,'vu tu'				,'2'			,'2'		,'2010/05/06'),
					 (N'toan@gmail.com'					,'toan11'			,'vu toan1'				,'3' 			,'4'		,'2010/05/04'),
					 (N'toan2@gmail.com'				,'toan12'			,'vu toan2'				,'1' 			,'4'		,'2010/05/04'),
					 (N'toan3@gmail.com'				,'toan13'			,'vu toan3'				,'5' 			,'4'		,'2010/05/04'),
					 (N'toan4@gmail.com'				,'toan14'			,'vu toan4'				,'6' 			,'2'		,'2010/05/04'),
				     (N'toan5@gmail.com'				,'toan15'			,'vu toan5'				,'4' 			,'1'		,'2010/05/04'),
					 (N'toan6@gmail.com'				,'toan16'			,'vu toan6'				,'9' 			,'3'		,'2010/05/04'),
					 (N'toan7@gmail.com'				,'toan117'			,'vu toan7'				,'10' 			,'2'		,'2010/05/04'),
					 (N'toan8@gmail.com'				,'toan18'			,'vu toan8'				,'8' 			,'3'		,'2010/05/04'),
					 (N'toan9@gmail.com'				,'toan19'			,'vu toan9'				,'7' 			,'1'		,'2010/05/04');

INSERT INTO `Group`(  GroupName				, CreatorID		, CreateDate)
VALUES 				(N'ROCKE_1'			,   5			,'2012/02/06'),
					(N'ROCKE_1'			,   1			,'2012/03/04'),
                    (N'ROCKE_1'			,   2			,'2012/04/05'),
                    (N'ROCKE_1'			,   3			,'2012/05/06'),
                    (N'ROCKE_1'			,   4			,'2010/05/07'),
                    (N'ROCKE_1'			,   6			,'2012/05/08'),
                    (N'ROCKE_1'			,   7			,'2012/08/09'),
                    (N'ROCKE_1'			,   8			,'2012/05/12'),
                    (N'ROCKE_1'			,   9			,'2020-04-09'),
                    (N'ROCKE_1'			,   10			,'2012/08/10');
				
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	5		,    1		,'2012/05/06'),
							(	6		,    2		,'2012/06/07'),
							(	7		,    3		,'2012/07/08'),
							(	8		,    4		,'2012/08/09'),
							(	9		,    5		,'2012/09/10'),
							(	10		,    6		,'2012/01/02'),
							(	1		,    7		,'2012/02/03'),
							(	2		,    8		,'2011/03/04'),
							(	3		,    9		,'2012-04-09'),
							(	4		,    10		,'2012/05/01');

INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 
                            
                            
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
                    
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'CAU HOI 1'		,	1		,   '1'			,   '1'		,'2012/02/06'),
						(N'CAU HOI 2'		,	2		,   '2'			,   '2'		,'2012/02/07'),
						(N'CAU HOI 3'		,	3		,   '2'			,   '3'		,'2012/02/08'),
						(N'CAU HOI 4'		,	4		,   '1'			,   '4'		,'2012/02/09'),
						(N'CAU HOI 5'		,	5		,   '2'			,   '5'		,'2012/02/010'),
						(N'CAU HOI 6'		,	6		,   '2'			,   '6'		,'2012/204/06'),
						(N'CAU HOI 7'		,	7		,   '1'			,   '7'		,'2012/05/07'),
						(N'CAU HOI 8'		,	8		,   '1'			,   '8'		,'2012/03/04'),
						(N'CAU HOI 9'		,	9		,   '2'			,   '9'		,'2012/03/08'),
						(N'CAU HOI 10'		,	10		,   '1'			,   '10'	,'2012/05/01');
                        
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   2			,	0		),
					(N'Trả lời 02'	,   6			,	1		),
                    (N'Trả lời 03'	,   5			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
                    
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('DE 1'			, N'Đề thi 1'			,	1			,	60		,   '5'			,'2012-04-05'),
					('DE 2'			, N'Đề thi 2'			,	10			,	60		,   '2'			,'2012-04-05'),
                    ('DE 3'			, N'Đề thi 3'			,	9			,	120		,   '2'			,'2012-04-07'),
                    ('DE 4'			, N'Đề thi 4'			,	6			,	60		,   '3'			,'2012-04-08'),
                    ('DE 5'			, N'Đề thi 5'			,	5			,	120		,   '4'			,'2012-04-10'),
                    ('DE 6'			, N'Đề thi 6'			,	3			,	60		,   '6'			,'2012-04-05'),
                    ('DE 7'			, N'Đề thi 7'			,	2			,	60		,   '7'			,'2012-04-05'),
                    ('DE 8'			, N'Đề thi 8'			,	8			,	60		,   '8'			,'2012-04-07'),
                    ('DE 9'			, N'Đề thi 9'			,	4			,	90		,   '9'			,'2012-04-07'),
                    ('DE 10'		, N'Đề thi 10'			,	7			,	90		,   '10'		,'2012-04-08');
                    
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		);                    
---------------------------------------

                     
                                        
                                                
