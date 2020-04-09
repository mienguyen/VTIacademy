USE 				Testingsyetem;
COMMIT;
	-- Question 2 : Lấy tất cả dữ liệu bảng Department
SELECT 
    *
FROM
    Department ;
    
	-- Question 3: Lấy ID phòng "Sale"
SELECT 
    Department_id, Department_name
FROM
    Department
WHERE
    Department_name = 'sale';
    
	-- Question 4: Lấy mgười có full name dài nhất và sắp theo thứ tự giảm dần

SELECT 		*, 	LENGTH(Fullname)
FROM	 	`Account`
WHERE		LENGTH(Fullname) = (SELECT 	MAX(LENGTH(Fullname))
							FROM	 `Account`)
ORDER BY Fullname  DESC ;

-- Question 5: Lấy mgười có full name dài nhất và ID = 3
  SELECT 	*, LENGTH(Fullname)
FROM	 	`Account`
WHERE		LENGTH(Fullname) = (SELECT 	MAX(LENGTH(Fullname))
							FROM	 `Account`) AND (Department_id = 3) ;
                            
-- Question 6 : Lấy ra ID tên group tham gia trước ngày 20/20/2019
SELECT     	  Group_id
FROM 		GroupAccount
WHERE 		Join_date > '2019-12-20' ;
  
 -- Question 7: Lấy ra ID Question có câu trả lời >=2 ;
SELECT 		Question_id
 FROM 		Answer
 WHERE		isCorrect >= 2 ;

-- Question 8 : Lấy ra Code bài thi có time >= 90 phút và được tạo ra trước ngày 20/12/2019.
SELECT 
    'Code'
FROM
    Exam
WHERE
    Duration >= 80
        AND Create_date < '2019-12-20';

 -- Question 9 : Lấy 5 group tạo gần đây nhất

SELECT 
    *
FROM
    `Group`
ORDER BY Create_date DESC
LIMIT 5;

-- Quesition ****** : Lấy nhân viên có Department có id =2 
SELECT 
    *
FROM
    `Account`
WHERE
    Department_id IN (SELECT 
            Department_id
        FROM
            `Account`
        WHERE
            Department_id = 2);

-- Quesition 10 : Đếm số nhân viên thuộc Department có id =2 
SELECT Department_name, 
     COUNT(Department_id) AS So_nhan_vien
FROM
    Department
WHERE
    Department_id = 2;
    
-- Question 11 : Lấy ra tên nhân viên có tên bắt đầu bằng "D" và kết thúc bằng "o".
  SELECT 
*
FROM
    `Account`
WHERE
    Username LIKE 'D%o';
    
-- Question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019  
  DELETE FROM   Exam
  WHERE Create_date < '2020-12-20' ;
 
 
 -- Question 13: xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"  
 DELETE FROM Question 
 WHERE      Content LIKE 'câu hỏi%' ;
    
    
    
-- Question 14: update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn     
UPDATE `Account` 
SET 
    Fullname = 'Nguyễn Bá Lộc',
    Email = 'loc.nguyenba@vti.com.vn'
WHERE
    Account_id = 5; 

 -- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
 UPDATE `Account`
 SET Department_id = '4'
 WHERE Account_id = '5' ; 
 
 
 
 
 

 
