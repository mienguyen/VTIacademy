-- create FresherManagement database
DROP DATABASE IF EXISTS FresherManagement;
CREATE DATABASE IF NOT EXISTS  FresherManagement;
USE   FresherManagement;
-- create Trainee table
DROP TABLE IF EXISTS Trainee;
CREATE TABLE IF NOT EXISTS Trainee(
	Trainee_id    		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Full_name     		NVARCHAR(50) NOT NULL,
    
    Birth_date    		DATE NOT NULL,
    Gender				ENUM( 'male','female','unknown'),
    ET_IQ				TINYINT UNSIGNED NOT NULL CHECK(ET_IQ <= 20),
    ET_Gmath        	TINYINT UNSIGNED NOT NULL CHECK(ET_Gmath<=20),
    ET_English			TINYINT UNSIGNED NOT NULL CHECK (ET_English<=50),
    Training_Class		VARCHAR(50),
    Evaluation_Notes	TEXT
);

ALTER TABLE Trainee
  ADD VTI_Account VARCHAR(50) UNIQUE KEY NOT NULL; 
  
  -- Question 1: Thêm ít nhất 10 bản ghi vào table  
   
  
  INSERT INTO Trainee 	( Full_name		    ,Birth_date	 ,  Gender		,	ET_IQ   ,ET_Gmath,  ET_English,  Training_Class,  Evaluation_Notes, VTI_Account			)
  VALUES          		('Nguyễn Thị Mai'   , '1997-07-14', 'female'	,	5, 			12,			45,		'VTI_Tester'	, 'có cố gắng'	  , 	'mai.nguyethi@vti.com'					),
						('Đỗ Thu Huyền '    , '1996-08-19', 'female'	,	13 , 		12,			34,		'VTI_Java'		,	NULL		  ,		'huyen.nguyethi@vti.com'					), 
						('Vương Huy Hoàng'  , '2000-10-20', 'male'		,	19, 		16,			34,		'VTI_Dev'		, 'có cố gắng'	  ,		'hoang.nguyethi@vti.com'					), 
						('Đinh Thu Loan'    , '1996-12-15', 'female'	,	13, 		17,			20,		'VTI_Html'		,	NULL		  ,		'loan.nguyethi@vti.com'					),	 
						('Nguyễn Đưc Duy'   , '1993-06-25', 'male'		,	07, 		05,			16,		'VTI_Html'		,	NULL		  ,		'duy.nguyethi@vti.com'					), 
						('Lê Văn Sơn'       , '1995-04-05', 'male'		,	11, 		15,			39,		'VTI_Dev'		,'có cố gắng'	  ,		'sơn.nguyethi@vti.com'					),
						('Hoàng Ngọc Nam'   , '1996-08-23', 'male'		,	09, 		17,			46,		'VTI_Tester'	,	NULL		  ,		'nam.nguyethi@vti.com'					),
						('Dương Thị Phương' , '1994-11-11', 'female'	,	18, 		16,			50,		'VTI_Dev'		,'có cố gắng'	  ,		'phương.nguyethi@vti.com'					),
						('Nguyễn Thị Thảo'  , '1997-01-07', 'female'	,	16, 		12,			43,		'VTI_Html'		,	NULL		  ,		'thảo.nguyethi@vti.com'					),
						('Đỗ Thị Tương'     , '1996-04-19', 'female'	,	12, 		12,			45,		'VTI_Dev'		,'có cố gắng'	  ,		'tương.nguyethi@vti.com'					);
                        
                        
-- question2 Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau 
SELECT CONCAT(full_name, " ", Birth_date)
FROM Trainee;

SELECT MONTH(Birth_date ),GROUP_CONCAT(full_name)
FROM Trainee
GROUP BY MONTH (Birth_date );
-- question 2
 SELECT *,LENGTH(full_name)
 FROM Trainee
 WHERE LENGTH(full_name)= (SELECT MAX(LENGTH(full_name)) FROM Trainee);
 -- question 4
 SELECT *
 FROM Trainee
 WHERE (ET_IQ +  ET_Gmath) >= 20
 AND ET_IQ>=8 
 AND ET_Gmath>=8 
 AND ET_English>=18 ;
 -- question 5xóa thực tập sinh có TraineeID = 3 
 DELETE FROM Trainee
 WHERE Trainee_id=3;
 -- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database 
 UPDATE Trainee
 SET Training_Class= 'VTI_Java'
 WHERE Trainee_id='5';
 
 
 
 
 
 
 
 