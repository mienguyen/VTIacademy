USE 	 Testingsyetem;
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DROP PROCEDURE IF EXISTS p_select_account_dep ;
DELIMITER $$
CREATE PROCEDURE p_select_account_dep (IN in_department_name NVARCHAR(50) )
	BEGIN 
		SELECT 	a.Account_id,a.Email,a.Username,a.Fullname
		FROM 	`Account` a 
		JOIN 	Department d ON a.Department_id = d.Department_id
		WHERE 	d.Department_name = in_department_name;
	END$$select_account_dep
DELIMITER ;	

CALL p_select_account_dep('sale') ;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group  
DROP PROCEDURE IF EXISTS p_get_account_of_each_group;
DELIMITER $$
CREATE PROCEDURE p_get_account_of_each_group()
BEGIN
	 SELECT Group_id,COUNT(Account_id) AS so_account
     FROM GroupAccount
     GROUP BY Group_id;
END $$ 
DELIMITER ;
-- using
CALL p_get_account_of_each_group;

 -- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DROP PROCEDURE IF EXISTS get_question_of_typequestion;
DELIMITER $$ 
CREATE PROCEDURE get_question_of_typequestion()
BEGIN
	 SELECT  	t.Type_id,t.Type_name, COUNT( q.Question_id) AS so_cau_hoi
     FROM 		Question q
     JOIN 		TypeQuestion t ON q.Type_id = t.Type_id
     WHERE 		 MONTH(Create_date)= MONTH(NOW())
     GROUP BY 		t.Type_id ;
END $$
DELIMITER ;
-- using--
CALL get_question_of_typequestion;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
DROP PROCEDURE IF EXISTS p_get_max_question_of_typequestion;
DELIMITER $$
CREATE PROCEDURE p_get_max_question_of_typequestion(OUT out_Type_id TINYINT UNSIGNED)
BEGIN 
	SELECT Type_id    INTO out_Type_id
    FROM   Question
        GROUP BY Type_id
        HAVING COUNT(Question_id)= (SELECT  COUNT(Question_id)
									FROM Question
									GROUP BY Type_id
								   ORDER BY  COUNT(Question_id) DESC LIMIT 1);
END $$
DELIMITER ;    

SET @out_Type_id =0;
CALL p_get_max_question_of_typequestion(@out_Type_id);
SELECT  @out_Type_id;                              
 
 -- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question 
 
 SET @v_out_Type_id = 0;
 CALL p_get_max_question_of_typequestion(@v_out_Type_id);
 SELECT Type_name
 FROM TypeQuestion
 WHERE Type_id = @v_out_Type_id;

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào 
 DROP PROCEDURE IF EXISTS p_get_group_username;
 DELIMITER $$
 CREATE PROCEDURE p_get_group_username ( IN nhap_thong_tin NVARCHAR(100)  )
 BEGIN
		SELECT  Group_name , NULL AS Username
        FROM `Group`
        WHERE Group_name LIKE CONCAT( '%', nhap_thong_tin, '%') 
UNION 
		SELECT NULL AS Group_name, Username 
        FROM `Account`
        WHERE Username LIKE CONCAT ('%', nhap_thong_tin, '%');
END$$
DELIMITER ;
 
CALL  p_get_group_username('G'); 

    

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID 
DROP PROCEDURE IF EXISTS p_delete_exam;
DELIMITER $$
CREATE PROCEDURE p_delete_exam(IN nhap_exam_id TINYINT UNSIGNED)
BEGIN
	DELETE 
    FROM 	Exam
    WHERE 	Exam_id = nhap_exam_id;
END $$
DELIMITER ;


 
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email 
-- và trong store sẽ tự động gán   username sẽ giống email nhưng bỏ phần @..mail đi
--  positionID: sẽ có default là developer  departmentID: sẽ được cho vào 1 phòng chờ Sau đó in ra kết quả tạo thành công 
DROP PROCEDURE IF EXISTS p_get_information_department;
DELIMITER $$
CREATE PROCEDURE p_get_information_department( IN in_full_name VARCHAR(10), IN in_email VARCHAR(50))
BEGIN
	DECLARE v_username VARCHAR(50);
    SET  v_username = SUBSTRING_INDEX(Email,'@',1);
    INSERT INTO 	`Account`(Email		,Username	,Fullname		,Department_id			,Position_id)
    VALUES 					(in_email	,v_username	,in_full_name	,		NULL				,	NULL	 	);

END$$
DELIMITER ;

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice 
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất 
DROP PROCEDURE IF EXISTS most_of_content;
DELIMITER $$
CREATE PROCEDURE most_of_content(IN in_Type_name  VARCHAR(20))
BEGIN 

WITH CTE_
SELECT * 
 
 END$$
 DELIMITER ;
 CALL most_of_content ('Essay');
  
 
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban 
-- và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc 
DROP PROCEDURE IF EXISTS delete_department;
DELIMITER $$
CREATE PROCEDURE delete_department( IN nhap_department_name VARCHAR(50))
BEGIN
UPDATE `Account`
SET Department_id = NULL
WHERE Department_id = (SELECT Department_id FROM Department WHERE Department_id = nhap_department_name);

DELETE FROM Department
WHERE Department_id = nhap_department_name;


 END$$
DELIMITER ;
 


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DROP PROCEDURE IF EXISTS get_question_each_month;
DELIMITER $$
CREATE PROCEDURE get_question_each_month()
BEGIN 
 
WITH get_month AS (
 select Month_in_year.`MONTH`
FROM (
    SELECT 1 AS `MONTH`
    UNION SELECT 2 AS `MONTH`
    UNION SELECT 3 AS `MONTH`
    UNION SELECT 4 AS `MONTH`
    UNION SELECT 5 AS `MONTH`
    UNION SELECT 6 AS `MONTH`
    UNION SELECT 7 AS `MONTH`
    UNION SELECT 8 AS `MONTH`
    UNION SELECT 9 AS `MONTH`
    UNION SELECT 10 AS `MONTH`
    UNION SELECT 11 AS `MONTH`
    UNION SELECT 12 AS `MONTH`
 )AS  Month_in_year )

SELECT g.`MONTH`, COUNT(Question_id)
FROM get_month g
LEFT JOIN Question  q ON MONTH(q.Create_date) = g.`MONTH`
GROUP BY MONTH 
ORDER BY g.`MONTH` ASC;
END$$
DELIMITER ;
CALL get_question_each_month;

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất 
-- (nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng") 










