DROP TABLE IF EXISTS         student;
CREATE  TABLE IF NOT EXISTS  student (
		student_id 		SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		 `name`		NVARCHAR(50) NOT NULL,
         age		TINYINT NOT NULL,
         gender		ENUM('M','F','NULL') 
);
-- Create   Table --
DROP TABLE IF EXISTS         `Subject`;
CREATE  TABLE IF NOT EXISTS  `Subject` (
		s_id 	SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        s_name	VARCHAR(100) NOT NULL UNIQUE  KEY
);

-- Create   Table --
DROP TABLE IF EXISTS         StudentSubject;
CREATE  TABLE IF NOT EXISTS StudentSubject(
student_id		SMALLINT UNSIGNED NOT NULL,
s_id			SMALLINT UNSIGNED NOT NULL,
mark 			TINYINT NOT NULL,
`date`			DATE NOT NULL,
FOREIGN KEY (student_id) REFERENCES student (student_id),
FOREIGN KEY (s_id) REFERENCES `Subject` (s_id),
PRIMARY KEY (student_id,s_id)
);


INSERT INTO student (`name`	   ,age  ,gender)
VALUES 		('nguyen thi hoa',  18,		'F'),
			('nguyen van anh',  18,'M'),
			('nguyen ngoc lan',  18,'F');
            
 INSERT INTO `Subject`   (s_name)
 VALUES				('toan'),
					('van'),
					('anh');
                    
                    
INSERT INTO      StudentSubject (student_id,s_id,mark,`date`)
VALUES					(1  ,1  ,8, '2020-04-04'),
						(1  ,3  ,5, '2020-04-04'),
                        (2  ,1  ,4, '2020-04-04'),
                        (3 , 3 ,10, '2020-04-04'),
                        (2  ,3  ,8, '2020-04-04');
 -- b) Viết lệnh để a.
 -- Lấy tất cả các môn học không có bất kì điểm nàob.
 SELECT *
 FROM `Subject`   
 WHERE s_id NOT IN (SELECT s_id FROM StudentSubject);
 --  Lấy danh sách các môn học có ít nhất 2 điểm                    
SELECT   s_name
FROM `Subject` s 
JOIN StudentSubject  st ON s.s_id = st.s_id
WHERE mark >=2
GROUP BY s.s_id ;
 -- Tạo "StudentInfo" view có các thông tin về học sinh bao gồm:
 -- RN,sID,Name, Age, Gender, sName, Mark, Date. Với cột Gender show Male để thay thế cho 0,
 -- Female thay thế cho 1 và Unknow thay thế cho null. 
 DROP VIEW IF EXISTS V_student_infor ;
 CREATE VIEW V_student_infor AS 
 SELECT  *, CASE
		WHEN gender = 'M' THEN 'male'
        WHEN gender = 'F' THEN 'female'
        ELSE 'Unknown'
        END AS gender
 FROM student s 
LEFT JOIN StudentSubject st ON  s.student_id =  st.student_id 
LEFT JOIN `Subject`sb ON st.s_id = sb.s_id;
SELECT * FROM  V_student_infor;
                    
 -- Tạo trigger cho table Subject: a. Trigger CasUpdate: 
 -- khi thay đổi data của cột sID, thì giá trị của cột sID của table StudentSubject cũng thay đổi theo                    
  DROP TRIGGER IF EXISTS trigger_casupdate;
 DELIMITER $$
 CREATE TRIGGER trigger_casupdate
 BEFORE UPDATE ON  `Subject`
 FOR EACH ROW
 BEGIN 
		  
         IF s_id = NEW.s_id THEN
         UPDATE StudentSubject
         SET s_id = subject_id;
         END IF;
  
 END$$
 DELIMITER ;                   
                    
 -- Trigger casDel: Khi xóa 1 student, các dữ liệu của table StudentSubject cũng sẽ bị xóa theo 

DROP TRIGGER IF EXISTS trigger_casdel;
 DELIMITER $$
 CREATE TRIGGER trigger_casdel
 BEFORE DELETE  ON StudentSubject
 FOR EACH ROW
 BEGIN 
DELETE FROM `Subject`
WHERE s_id = OLD.s_id;
 END$$
 DELIMITER ;                   
 
 
 
 
            
            