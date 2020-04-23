USE 					Testingsyetem;
--  1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước 
 INSERT INTO `Group`  ( Group_name   ,   Creator_id ,Create_date		 )   
VALUES 				         ( 'Group A '   ,     2 ,     '2020-01-10'  ),       
							 ( 'Group B '   ,     3  ,   '2019-01-11'   ); 
 DROP TRIGGER IF EXISTS trigger_group;
 DELIMITER $$
 CREATE TRIGGER trigger_group
 BEFORE INSERT ON  `Group`
 FOR EACH ROW
 BEGIN 
		IF NEW.`Create_date` < DATE_SUB(NOW(),INTERVAL 1 year) THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'CAN NOT INSERT';
 END IF;
 END$$
 DELIMITER ;
 
 -- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, 
 -- khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user" 
INSERT INTO  Department( Department_name)
VALUES                        ( 'sale'       ),        -- 1
							  ( 'sale'            );  
 DROP TRIGGER IF EXISTS trigger_user;
 DELIMITER $$
 CREATE TRIGGER trigger_user
 BEFORE INSERT ON  Department
 FOR EACH ROW
 BEGIN 
		IF NEW.Department_name = 'sale'    THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT =  'SALE cannot add more user' ;
 END IF;
 END$$
 DELIMITER ;
 
 -- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
 INSERT INTO  	GroupAccount (  Group_id    ,    Account_id  )              
 VALUES                      (     1        ,       1        ),      -- 1
							 (     1        ,       2        ),      -- 2
                             (     2        ,       1        ),      -- 3
						     (     2        ,       3        ),      -- 4
                             (     3        ,       1        ),      -- 5
                             (     1        ,       6        ),      -- 6
                             (     1        ,       8        ),      -- 7
                             (     1        ,       7        ),      -- 8
                             (     7        ,       1       ),       -- 9
                             (     1        ,       4        );   	 -- 10
   
DROP TRIGGER IF EXISTS trigger_max_user_of_group;
 DELIMITER $$
 CREATE TRIGGER trigger_max_user_of_group
 BEFORE   INSERT ON  GroupAccount
 FOR EACH ROW
 BEGIN 
		 DECLARE  NUMBER_OF_COUNT TINYINT UNSIGNED;
		 SELECT COUNT(Account_id)  INTO NUMBER_OF_COUNT
		 FROM GroupAccount;
 		IF  NUMBER_OF_COUNT  > 5  THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT =  '  vượt quá user cho phép'  ;          
 END IF;
 END$$
 DELIMITER ;
 
 
 
 -- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question 
DROP TRIGGER IF EXISTS trigger_max_question;
 DELIMITER $$
 CREATE TRIGGER trigger_max_question
 AFTER  INSERT ON  ExamQuestion
 FOR EACH ROW
 BEGIN 
  DECLARE NUMBER_OF_QUESTION TINYINT UNSIGNED;
  SELECT  COUNT(Question_id)  INTO NUMBER_OF_QUESTION
  FROM ExamQuestion
  GROUP BY Exam_id;
		IF  NUMBER_OF_QUESTION   >10  THEN
                   
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT =  '  vượt quá Question cho phép'  ;          
 END IF;
 END$$
 DELIMITER ;
 
 
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com (đây là tài khoản admin, 
-- không cho phép user xóa), còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó 
 DELETE FROM 	`Account`;
 DROP TRIGGER IF EXISTS trigger_delete_user;
 DELIMITER $$
 CREATE TRIGGER 	trigger_delete_user
 BEFORE DELETE  ON  `Account`
 FOR EACH ROW
 BEGIN 
		IF OLD.Email = 'admin@gmail.com'    THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT =  ' đây là tài khoản admin không được phép xóa' ;
 END IF;
 END$$
 DELIMITER ;
 ROLLBACK;
 -- Question 12: Lấy ra thông tin exam trong đó  Duration <= 30 thì sẽ đổi thành giá trị "Short time"
 -- 30 < duration <= 60 thì sẽ đổi thành giá trị "Medium time" duration >60 thì sẽ đổi thành giá trị "Long time" 
 SELECT * ,CASE
		WHEN 		Duration <= 30 THEN 'short time'
        WHEN 		 Duration >30 AND Duration <=60 THEN 'Medium time'
         ELSE 		   'Long time'
        END AS duration
 FROM Exam;
 
-- Question 13: Thống kê số account trong mỗi group
-- và in ra thêm 1 column nữa có tên là the_number_user_amount và mang giá trị được quy định như sau:  
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5  thì sẽ có giá trị là norma
-- l Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher  
SELECT *, CASE
			WHEN COUNT(ga.Account_id) <= 5 THEN 'few'
            WHEN  COUNT(ga.Account_id) >5 AND   COUNT(ga.Account_id) <= 20 THEN 'norma'
            ELSE 'higher'
            END AS the_number_user_amoun
FROM `Account` a 
JOIN GroupAccount ga  ON a.Account_id = ga.Account_id
GROUP BY ga.Group_id;

 

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user,
-- nếu phòng ban nào  không có user thì sẽ thay đổi giá trị 0 thành "Không có User" 
	 SELECT * , 	  CASE 
						  WHEN COUNT(a.Account_id) = 0 THEN 'Không có User'
                          ELSE COUNT(a.Account_id)
						 END AS so_ccount
 FROM 			Department  d
LEFT JOIN	 	`Account` a ON d.Department_id = a.Department_id
GROUP BY 		d.Department_name;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày 
DROP TRIGGER IF EXISTS trigger_delete_exam;
 DELIMITER $$
 CREATE TRIGGER trigger_delete_exam
 BEFORE DELETE  ON Exam
 FOR EACH ROW
 BEGIN 
		IF  OLD. Create_date > DATE_SUB(NOW(),INTERVAL 2 DAY)    THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT =  ' không được phép xóa' ;
 END IF;
 END$$
 DELIMITER ;
 -- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account,
 -- hãy tạo trigger cho phép người dùng khi tạo account không điền vào departmentID thì sẽ được phân vào phòng ban "waiting Department" 
 DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS		 `Account`(
		Account_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
        Email			VARCHAR(50) NOT NULL UNIQUE,
        Username		VARCHAR(10) NOT NULL,
        Fullname  		NVARCHAR(30) NOT NULL,
        Department_id 	TINYINT UNSIGNED   NULL  ,
        Position_id		TINYINT UNSIGNED NOT NULL DEFAULT 5 ,
        Create_date 	DATETIME DEFAULT NOW(),
        FOREIGN KEY (Department_id) REFERENCES Department (Department_id),
        FOREIGN KEY (Position_id) REFERENCES `Position`(Position_id)
);
INSERT INTO 		`Account`(       Email                  ,    Username ,    Fullname            , Department_id, Position_id)
 VALUES                      ('mai.nguyenthi@gmail.com'     ,   'Mai'     ,   'Nguyen Thi Mai'     ,    1        	,   3      ),      -- 1
							 ('phuong.dangthanh@gmail.com'  ,   'Phương'  ,   'Dang Thanh Phuong ' ,    NULL          ,   2      );     -- 2
 DROP TRIGGER IF EXISTS trigger_control_department;
 DELIMITER $$
 CREATE TRIGGER trigger_control_department
 BEFORE INSERT ON   `Account`
 FOR EACH ROW
 BEGIN 
 DECLARE 	 department_id TINYINT UNSIGNED;
 SELECT 	 a.Department_id   INTO department_id
 FROM 		`Account`a JOIN Department d ON a.Department_id = d.Department_id
 WHERE Department_name = 'Waiting Room'   ;
		IF  Department_id IS NULL THEN
        SET   Department_id = department_id; 

 END IF;
 END$$
 DELIMITER ;
 

 -- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào 
 DROP TRIGGER IF EXISTS trigger_group;
 DELIMITER $$
 CREATE TRIGGER trigger_group
 BEFORE INSERT ON  `Group`
 FOR EACH ROW
 BEGIN 
		IF NEW.`Create_date` < DATE_SUB(NOW(),INTERVAL 1 year) THEN
		SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'CAN NOT INSERT';
 END IF;
 END$$
 DELIMITER ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



 