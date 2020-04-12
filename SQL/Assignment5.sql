USE 					Testingsyetem;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale 
-- cách 1
DROP VIEW IF EXISTS Account_Dep;
CREATE VIEW 		Account_Dep AS
SELECT  			a.Fullname,d.Department_name
FROM 				`Account` a 
JOIN 				Department  d ON a.Department_id = d.Department_id
WHERE  				Department_name ='sale';

SELECT *
FROM 		Account_Dep;
-- cách 2 sử dung subquery
DROP VIEW IF EXISTS		 V_account;
CREATE VIEW 			V_account_dep AS
SELECT 					Account_id,Fullname
FROM 					`Account`
WHERE					 Department_id = (SELECT Department_id
											FROM Department 
											WHERE Department_name = 'sale') ;  
SELECT * FROM  V_account_dep ;               

  -- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW 	 	v_account AS
SELECT		 		 a.Account_id,Email,Fullname, COUNT(Group_id) AS so_group
 FROM				 `Account` a 
JOIN 				GroupAccount g ON a.Account_id = g.Account_id
GROUP BY 			a.Account_id
HAVING COUNT(Group_id) = (SELECT COUNT(Group_id)
						FROM `Account` a 
						JOIN GroupAccount g ON a.Account_id = g.Account_id
						GROUP BY a.Account_id
						HAVING COUNT(Group_id)
						ORDER BY COUNT(Group_id) DESC
						LIMIT 1);

                     
                        
COMMIT;
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 11 từ được coi là quá dài) và xóa nó đi 
DROP VIEW IF EXISTS LengthQuestion;
CREATE VIEW  LengthQuestion AS
SELECT *, LENGTH(Content)
FROM Question
WHERE LENGTH(Content)>12;


SELECT *
FROM LengthQuestion;

DROP VIEW  Length_view;
ROLLBACK;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất 
DROP VIEW IF EXISTS MaxAccountDepartment;
CREATE VIEW MaxAccountDepartment AS
SELECT d.Department_id,Department_name, COUNT(Account_id) AS so_nhan_vien
FROM Department d
JOIN `Account` a ON d.Department_id = a.Department_id
GROUP BY d.Department_id
HAVING COUNT(Account_id)=
							(SELECT COUNT(Account_id)
							FROM Department d
							JOIN `Account` a ON d.Department_id = a.Department_id
							GROUP BY d.Department_id
							HAVING COUNT(Account_id)
							ORDER BY COUNT(Account_id) DESC
							LIMIT 1);
SELECT *
FROM  MaxAccountDepartment;


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo 
DROP VIEW IF EXISTS QeAccount_view;
CREATE VIEW  QeAccount_view AS
SELECT  a.Fullname , GROUP_CONCAT(Content," ")
FROM  `Account` a 
JOIN Question q ON a.Account_id = q.Creator_id
WHERE Fullname LIKE ('Nguyen%')
GROUP BY a.Account_id;

SELECT *
FROM QeAccount_view;










