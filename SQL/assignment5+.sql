USE `adventureworks`;
-- Exercise 1: Subquery  Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'. 
SELECT 	`Name`
FROM 	product
WHERE 	ProductSubcategoryID =	 (SELECT ProductSubcategoryID
									FROM productsubcategory
									WHERE `Name` = 'Saddles');


-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau. 
SELECT 	`Name`
FROM 	product
WHERE 	ProductSubcategoryID IN	 (SELECT ProductSubcategoryID
									FROM productsubcategory
									WHERE `Name` LIKE 'Bo%');
-- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3) 
SELECT  `Name` 
FROM 	 product
WHERE 	ListPrice	=	(	SELECT MIN(ListPrice)
						FROM product
						WHERE ProductSubcategoryID = 3);
                        
                        
 -- Exercise 2: JOIN nhiều bảng  
 -- Question 1: Viết query lấy danh sách tên country và province được lưu  trong AdventureWorks2008sample database.  
SELECT 	c.`Name`,s.`Name`
FROM 	countryregion c
JOIN 	stateprovince s ON c.CountryRegionCode  = s.CountryRegionCode;
-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada 
SELECT 	c.`Name`,s.`Name`
FROM 	countryregion c
JOIN 	stateprovince s ON c.CountryRegionCode  = s.CountryRegionCode
WHERE 	 c.`Name`IN ( 'Germany',  'Canada');                  
-- Question 3: SalesOrderID, OrderDate and SalesPersonID. 
-- Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), 
-- Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)                        
 SELECT 	sad.SalesOrderID,sad.OrderDate,sa.SalesPersonID,sa.SalesPersonID AS  BusinessEntityID ,sa.Bonus,sa.SalesYTD
 FROM 		salesperson sa
JOIN  		salesorderheader   sad ON    sa.SalesPersonID  =     sad.SalesPersonID;    
-- Question 4:  Sử dụng câu query, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.  
SELECT 		sad.SalesOrderID,sad.OrderDate,e.Title AS Jobtitle  , sa.Bonus ,sa.SalesYTD   
FROM 		salesperson sa
JOIN 	 	salesorderheader   sad ON    sa.SalesPersonID  =     sad.SalesPersonID
JOIN 		employee e ON  sad.SalesPersonID = e.EmployeeID;
 
 
 
 
 
 
 
 

