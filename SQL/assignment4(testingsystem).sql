USE 					Testingsyetem;

-- Exercise 1: Join 
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT 		a.Fullname,a.Department_id,Department_name
FROM		 `Account` a 
JOIN 		Department d ON a.Department_id=d.Department_id;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
SELECT 				*
FROM			 `Account`
WHERE			 Create_date  > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer 
SELECT 			Position_name, GROUP_CONCAT(Fullname)
FROM 			 `Account` a
JOIN 			`Position` p ON a.Position_id=p.Position_id
WHERE 			Position_name='Developer'
GROUP BY 		p.Position_id;
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên 
SELECT 			d.Department_id,d.Department_name,COUNT( Account_id)AS so_nhan_vien
FROM 			Department d
JOIN 			`Account` a ON d.Department_id=a.Department_id
GROUP BY 		d.Department_id
HAVING			 COUNT( Account_id)>=2;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT 			q.Question_id,q.Content,COUNT(eq.Question_id)
FROM 			Question q
JOIN 			ExamQuestion eq ON q.Question_id=eq.Question_id
GROUP BY 		q.Question_id
HAVING 			COUNT(Exam_id) = (SELECT  COUNT(eq.Question_id)
							FROM Question q
							JOIN ExamQuestion eq ON q.Question_id=eq.Question_id
							GROUP BY eq.Question_id
							ORDER BY COUNT(eq.Question_id) DESC
							LIMIT 1);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question 													
SELECT 			c.Category_id,c.Category_name,COUNT(Question_id) AS so_cau_hoi
FROM 			Question q 
JOIN 			CategoryQuestion c ON q.Category_id =c.Category_id
GROUP BY 		Category_id;
 
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 
SELECT   		q.Question_id, COUNT(Category_id) AS so_cau_hoi
FROM 			Question q 
JOIN 			Exam c ON q.Category_id =c.Category_id
GROUP BY 		Category_id;
 -- Question 8: Lấy ra Question có nhiều câu trả lời nhất 
SELECT 		q.Question_id,q.Content,COUNT(Answer_id) AS so_cau_tra_loi
FROM 		Question q
JOIN 		Answer a ON q.Question_id=a.Question_id
GROUP BY 	q.Question_id 
HAVING 		COUNT(Answer_id)=(SELECT		 COUNT(Answer_id)
							FROM 		Question q
							JOIN 		Answer a ON q.Question_id=a.Question_id
							GROUP BY q.Question_id 
							ORDER BY COUNT(Answer_id) DESC LIMIT 1);
-- Question 9: Thống kê số lượng account trong mỗi group 
SELECT 			g.Group_id,g.Group_name, COUNT(Account_id) AS so_nhan_vien
FROM 			 `Group`g
JOIN 			GroupAccount ga ON g.Group_id=ga.Group_id
GROUP BY 		Group_id;
-- Question 10: Tìm chức vụ có ít người nhất  
SELECT			 p.Position_id, p.Position_name, COUNT(a.Account_id) 
FROM 			`Position` p 
JOIN 			 `Account` a ON p.Position_id=a.Position_id
GROUP BY 			p.Position_id
HAVING 			COUNT(a.Account_id)= ( SELECT   COUNT(a.Account_id) 
								 FROM `Position` p 
								JOIN 	 `Account` a ON p.Position_id=a.Position_id
								GROUP BY p.Position_id
								HAVING COUNT(a.Account_id) 
								ORDER BY  COUNT(a.Account_id) ASC LIMIT 1);
 

  -- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM 
SELECT   		d.Department_name, COUNT(Position_name), GROUP_CONCAT(Position_name)
FROM 			Department d
JOIN 			`Account`	a ON d.Department_id=a.Department_id
JOIN 			`Position` p  ON a.Position_id=p.Position_id
GROUP BY 		d.Department_name;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 
SELECT		 q.Question_id,q.Content,Type_name,Email,Fullname AS nguoi_tao_cau_hoi,a.Content AS cau_tra_loi
FROM		 Question q
JOIN 		TypeQuestion tq ON q.Type_id = tq.Type_id
JOIN  		Answer a 		ON q.Question_id = a.Question_id
JOIN 		`Account` ac ON q.Creator_id = ac.Account_id;
-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT 		COUNT(Content) AS so_cau_hoi ,Type_name
FROM 		 Question q 
JOIN  		TypeQuestion t ON q.Type_id=t.Type_id
WHERE 		Type_name IN ('Essay','Yes or No')
GROUP BY 	Type_name;
-- Question 14: lấy ra group không có account nào 
SELECT 				g.Group_id,g.Group_name
FROM 				`Group` g
LEFT  JOIN			GroupAccount	ga ON ga.Group_id=g.Group_id
WHERE 				ga.Group_id IS NULL;

-- Question 16: lấy ra question không có answer nào 
SELECT 				q.Question_id,q.Content
FROM 				Answer a
RIGHT  JOIN 		Question q ON a.Question_id=q.Question_id
WHERE  				a.Question_id IS NULL;

-- Exercise 2:
-- Union Question 17: 
-- a) Lấy các account thuộc nhóm thứ1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 

SELECT  ga.Group_id, a.Fullname
FROM  `Account` a
JOIN GroupAccount ga ON a.Account_id = ga.Account_id
WHERE ga.Group_id=1
UNION 
SELECT  ga.Group_id, a.Fullname
FROM  `Account` a
JOIN GroupAccount ga ON a.Account_id = ga.Account_id
WHERE ga.Group_id=2;
-- Question 18:  
-- a) Lấy các group có lớn hơn 1 thành viên 
-- b) Lấy các group có nhỏ hơn 3 thành viên 
-- c) Ghép 2 kết quả từ câu a) và câu b) 
SELECT  g.Group_name,COUNT(Account_id)
FROM `Group` g 
JOIN GroupAccount ga ON g.Group_id = ga.Group_id
GROUP BY g.Group_id
HAVING COUNT(Account_id)>1

UNION ALL
SELECT  g.Group_name,COUNT(Account_id)
FROM `Group` g 
JOIN GroupAccount ga ON g.Group_id = ga.Group_id
GROUP BY g.Group_id
HAVING COUNT(Account_id)<3;









