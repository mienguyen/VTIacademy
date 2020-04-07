DROP DATABASE IF EXISTS Testingsystem;
CREATE DATABASE IF NOT EXISTS       TestingSystem;


DROP TABLE IF EXISTS   Department;
CREATE TABLE IF NOT EXISTS		Department(
Department_id       TINYINT UNSIGNED   AUTO_INCREMENT PRIMARY KEY ,
Department_name     NVARCHAR(50) NOT NULL UNIQUE KEY
);




DROP TABLE IF EXISTS  Position;
CREATE TABLE IF NOT EXISTS       Position (
Position_id           TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Position_name         NVARCHAR(50) NOT NULL UNIQUE KEY
);



DROP TABLE IF EXISTS  `Account`;
CREATE TABLE IF NOT EXISTS     `Account` (
	Account_id         	TINYINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    Email				NVARCHAR(50) UNIQUE KEY,
	User_name          	NVARCHAR(50)  NOT NULL,
	Full_name          	NVARCHAR(50)  NOT NULL,
	Department_id      	TINYINT UNSIGNED  NOT NULL,
	Position_id        	TINYINT UNSIGNED NOT NULL,
    Create_date			DATETIME DEFAULT NOW(),
    FOREIGN KEY (Department_id  ) REFERENCES Department (Department_id),
    FOREIGN KEY  (Position_id   ) REFERENCES `Position`(Position_id)
);



DROP TABLE IF EXISTS  `Group`;
CREATE TABLE IF NOT EXISTS `Group` (
    Group_id 	TINYINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    Group_name 	NVARCHAR(50) NOT NULL,
    Creator_id 	TINYINT NOT NULL,
    Create_date DATETIME DEFAULT NOW()
);



DROP TABLE IF EXISTS  	GroupAccount;
CREATE TABLE IF NOT EXISTS			GroupAccount(
	ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Group_id    TINYINT UNSIGNED NOT NULL,
    Account_id  TINYINT UNSIGNED NOT NULL,
    Join_date   DATETIME DEFAULT NOW(),
    FOREIGN KEY (Group_id) REFERENCES `Group`( Group_id),
    FOREIGN KEY (Account_id) REFERENCES `Account`(Account_id)
);



DROP TABLE IF EXISTS  	TypeQuestion;
CREATE TABLE IF NOT EXISTS			TypeQuestion(
	Type_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Type_name   NVARCHAR(1000) NOT NULL
);



DROP TABLE IF EXISTS   CategoryQuestion;
CREATE TABLE IF NOT EXISTS			CategoryQuestion(
	Category_id      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Category_name    VARCHAR(50) NOT NULL
);



DROP TABLE IF EXISTS Question ;
CREATE TABLE IF NOT EXISTS         Question(
	Question_id    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content        VARCHAR (5000),
    Category_id    TINYINT UNSIGNED ,
    Type_id        TINYINT UNSIGNED,
    Creator_id     TINYINT UNSIGNED NOT NULL,
    Creator_date   DATETIME DEFAULT NOW(),
    FOREIGN KEY (Category_id) REFERENCES CategoryQuestion (Category_id),
    FOREIGN KEY (Type_id)     REFERENCES  TypeQuestion (Type_id)
    
);



DROP TABLE IF EXISTS   Answer;
CREATE TABLE IF NOT EXISTS          Answer(
	Answer_id    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content      VARCHAR(1000),
    Question_id  TINYINT UNSIGNED,
    isCorrect    ENUM('TRUE','FALSE'),
    FOREIGN KEY (Question_id) REFERENCES Question(Question_id)
);


DROP TABLE IF EXISTS  Exam;
CREATE TABLE IF NOT EXISTS        Exam(
	Exam_id     	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   `Code`       	TINYINT  UNSIGNED UNIQUE KEY NOT NULL,
	Title			NVARCHAR(100),
    Category_id		TINYINT UNSIGNED NOT NULL,
    Duration        TINYINT NOT NULL,
    Creator_id		TINYINT UNSIGNED NOT NULL ,
    Creator_date	DATETIME DEFAULT NOW(),
    FOREIGN KEY (Category_id) REFERENCES CategoryQuestion(Category_id)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE IF NOT EXISTS  ExamQuestion(
	Exam_id 		TINYINT UNSIGNED NOT NULL  ,
    Question_id     TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (Exam_id,Question_id),
    FOREIGN KEY (Exam_id) REFERENCES Exam ( Exam_id),
    FOREIGN KEY (Question_id) REFERENCES Question (Question_id) 
    
);

-- question 1--
INSERT  Department	(department_name)
	VALUES
						('Hr'),							-- 1	
                        ('It'),							-- 2
                        ('Engineer'),						-- 3
                        ('Office Administration'),		-- 4	
                        ('Accounting'),					-- 5	
                        ('Quality Control'),			-- 6
                        ('Business Development'),		-- 7
                        ('Client Service'),				-- 8
                        ('Sales'),						-- 9
                        ('Marketing');					-- 10
   INSERT      Position          	(position_name)
	VALUES
						('Computer Engineeer'),			-- 1
                        ('IT Specialist'),				-- 2
                        ('Department Head'),			-- 3
                        ('Plant Manager'),				-- 4
                        ('Finance Director'),			-- 5
                        ('Managing Director'),			-- 6
                        ('Intership'),					-- 7
                        ('Salesman'),					-- 8
                        ('Consultants'),				-- 9
                        ('Customers Service');			-- 10
                        
INSERT  `Account` 	(Email			,	User_name,		Full_name,			Department_id,		Position_id )
	VALUES
						('cd1@gmail.com',	' A'	,	 	'Nguyen Van A'	,			8,			    10	)	,				 
                        ('cd2@gmail.com',	' B'	,	 	'Hoang Duc B'	 ,			2,				2	)	,
                        ('cd3@gmail.com',	' C'	,	 	'Tran Tuan C'	,			1,				3	)	,
                        ('cd4@gmail.com',	'D'		,		'Vu Thi D'		,			3,	    		1	)	,
                        ('cd5@gmail.com',	' E'	,		'Pham Thu E'	,	 		10,		   		4	)	,
                        ('cd6@gmail.com',	'F'		,		'Vo Van F'		,			4,				6	)	,
                        ('cd7@gmail.com',	'G'		,		'Phan Phuoc G'	,			9,				9	)	,
                        ('cd8@gmail.com',	' H'	,		'Nguyen Hoang H',			1,				5	)	,
                        ('cd9@gmail.com',	'I'		,		'Ngo Lan I'		,			9,				8	)	,
                        ('cd10@gmail.com',	'K'	,			'Mai Ngoc K'	,			9,				8	);
                        
INSERT  `Group`		(group_name,	creator_id)
	VALUES
						('A1',			1	),
                        ('B2',			2	),
                        ('AB',			3	),
                        ('12BH',		3	),
                        ('GLHF',		1	),
                        ('SV',			1	),
                        ('AFF',			2	),
                        ('MSI',			2	),
                        ('HO',			3	),
                        ('PS',			1	);
                        
INSERT INTO GroupAccount	(group_id, account_id)
	VALUES	
                            (1,			2		),
                            (2,			3		),
                            (5,			1		),
                            (3,			9		),
                            (2,			5		),
                            (7,			2		),
                            (10,		4		),
                            (2,			6		),
                            (4,			2		),
                            (8,			3		);
                            
INSERT  Typequestion	(type_name)
	VALUES
							('Essay'),
                            ('Multiple-Choice'),
                            ('True or Fail'),
                            ('Yes or No'),
							(' Short Answer'),
                            (' Matching    '),
                            (' Numerical    '),
                            ('Caculated'),
                            ('Stack'),
                            ('Description');

INSERT INTO  CategoryQuestion (Category_name)
VALUES     ('Java'),
           ('C++'),
           (' SQL'),
           (' POSTMAN'),
           ('RUBY'),
           ('CSS'),
           ('HTML'),
           ('PHP'),
           ('C.'),
           ('javascrip');
           
           INSERT INTO 		Question	(Content 			,  Category_id  	,   Type_id    ,   Creator_id   )
VALUES                         			( 'Java là gì '		,       1        	,    1         ,      1         ),
										( 'C++ là gì '  	,       2        	,    1         ,      2         ),
										( 'SQL là gì ' 		,       3        	,    2         ,      4         ),
										('RUBY là gì'		,       4        	,    2         ,      3         ),
										('POSTMAN là gì'	,       4        	,    2         ,      3         ),
										('CSS là gì'		,       4        	,    2         ,      3         ),
										('HTML là gì'		,       4        	,    2         ,      3         ),
										('PHP là gì'		,       4        	,    2         ,      3         ),
										('C. là gì'			,       4        	,    2         ,      3         ),
										('javascrip là gì'	,       4        	,    2         ,      3         );
							
    INSERT INTO Answer(              Content                                                                                          , Question_id ,   isCorrect )
VALUES                        ('JAVA là một ngôn ngữ lập trình hướng đối tượng (OOP) và dựa trên các lớp (class)'                               ,     1       ,      'False'      ),
                              ('SQL là viết tắt của Structured Query Language là ngôn ngữ truy vấn có cấu trúc'                                 ,     2       ,      'True'       ),
                              ('.Net Framework là một khuôn khổ phần mềm chạy chủ yếu trên Microsoft Windows được phát triển bởi Microsoft.'    ,     3       ,      'True'       ),
                              ('Postman là 1 ứng dụng REST Client, dùng để thực hiện test, gửi các request, API mà không cần sử dụng browser'   ,     4       ,      'False'      ),
							('C++ là một ngôn ngữ lập trình kiểu tĩnh,dữ liệu trừ tượng, phân biệt kiểu chữ thường chữ hoa' 					,5				,		'True'			),
								('Ruby là một ngôn ngữ hướng đối tượng'																			,6				,		'True')
								('CSS là ngôn ngữ tạo phong cách cho trang web – Cascading Style Sheet language'							
								('C. là một ngôn ngữ lập trình cấp trung')
								('PHP (viết tắt của cụm từ Personal Home Page) là ngôn ngữ lập trình kịch bản')
								('JavaScript là ngôn ngữ kịch bản cho phép tạo ra trang web động');
                    
                    
                    
                    
  INSERT INTO         Exam       (  `Code`       ,     Title         ,    Category_id    ,   Duration     ,   Creator_id   )
VALUES                         (12124327  , 'Tốt nghiệp VTI'  ,         2         ,   '180'      ,      1         ),
                               (32345678  , 'Tốt nghiệp VTI'  ,         1         ,   '90'      ,      3         ),
                               (12345278   , 'Tốt nghiệp VTI'  ,         4         ,   '150'      ,      4         ),
                               (12345378   , 'Tốt nghiệp VTI'  ,         3         ,   '120'      ,      2         );
                               (12124329  , 'Tốt nghiệp VTI'  ,         2         ,   '180'      ,      1         ),
                               (12124321  , 'Tốt nghiệp VTI'  ,         2         ,   '180'      ,      1         ),
                               (12124322  , 'Tốt nghiệp VTI'  ,         2         ,   '120'      ,      1         ),
                               (12124323  , 'Tốt nghiệp VTI'  ,         2         ,   '180'      ,      1         ),
                               (12124324  , 'Tốt nghiệp VTI'  ,         2         ,   '90'      ,      1         ),
                               (12124325  , 'Tốt nghiệp VTI'  ,         2         ,   '180'      ,      1         );
    -- Create ExamQuestion Table --
INSERT INTO       ExamQuestion (     Exam_id     ,     Question_id  )
VALUES                         (       2        ,       2           ),     
							   (       1        ,       3           ),
                               (       3        ,       4           ),
                               (       4        ,       5           ),
						       (       5        ,       6           ),
                               (       6        ,       7           ),
								(       7        ,       8           ),
								(       8        ,       9           ),
								(       9        ,       10           ),
                                (       10        ,       1           );
                                
           
           
           
           
           
           
           
           