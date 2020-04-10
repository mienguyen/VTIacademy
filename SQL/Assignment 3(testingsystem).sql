USE 					Testingsyetem;
-- Question 2: lấy ra tất cả các phòng ban 
SELECT 
    *
FROM
    Department;
-- Question 3: lấy ra id của phòng ban "Sale" 
SELECT 
    Department_id, Department_name
FROM
    Department
WHERE
    Department_name = 'Sale';
-- Question 4: lấy ra thông tin account có full name dài nhất và sắp xếp chúng theo thứ tự giảm dần 
SELECT 
    *, LENGTH(Fullname)
FROM
    `Account`
WHERE
    LENGTH(Fullname) = (SELECT 
            MAX(LENGTH(Fullname))
        FROM
            `Account`)
ORDER BY Fullname DESC;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 
SELECT 
    *, LENGTH(Fullname)
FROM
    `Account`
WHERE
    LENGTH(Fullname) = (SELECT 
            MAX(LENGTH(Fullname))
						FROM
            `Account`)	 AND Department_id=3;




-- Question 6: lấy ra tên group đã tham gia sau ngày 20/12/2019
SELECT 
    *
FROM
    `Group`
WHERE
    Create_date > '2019-12-20';
-- Question 7: Lấy ra ID của question có >= 2 câu trả lời 
SELECT		 Question_id, Content,COUNT(Answer_id) AS so_cau_hoi
FROM 		Answer
GROUP BY 	Question_id
HAVING   	 COUNT(Answer_id)>=2;  
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo sau  ngày 20/12/2019
SELECT 
    *
FROM
    Exam
WHERE
    (Duration) >= 60
        AND Create_date > '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất 
SELECT 
    Group_name, Create_date
FROM
    `Group`
ORDER BY Create_date
LIMIT 5;
-- Question 10: Đếm số nhân viên thuộc department có id = 2 
SELECT 
    Department_id, COUNT(Account_id) AS so_nhan_vien
FROM
    `Account`
WHERE
    Department_id = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "N" và kết thúc bằng chữ "i" 
SELECT 
    Fullname
FROM
    `Account`
WHERE
    Fullname LIKE ('N%i'); 

-- Question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam 
WHERE
    Create_date < '2019-12-20';
   --  Question 13: xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
   
   DELETE FROM Question
   WHERE Content LIKE ('câuhỏi%');
-- Question 14: update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn 
UPDATE		  `Account` 
SET				 Fullname = 'Nguyễn Bá Lộc',
				Email = 'thành loc.nguyenba@vti.com.vn' 
WHERE			 Account_id=5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
UPDATE 			 GroupAccount
SET				 Group_id =4
WHERE			 Account_id =5;






 
