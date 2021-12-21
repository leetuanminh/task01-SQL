USE AdventureWorks2019 --s? d?ng ki?u d? li?u AdventureWork2019

SELECT * FROM HumanResources.Employee 
--khai báo bi?n 
Go
DECLARE @deptID INT -- khái báo bi?n c?c b? tên là deptID ki?u int 
SELECT @deptID=1 -- gán giá tr? cho bi?n b?n 1
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @deptID
Go
SELECT @@LANGUAGE -- hi?n th? thông tin c?a bi?n toàn c?c @@LANGUAGE, tr? l?i thông tin ngôn ng? s? d?ng trong sever
SELECT @@VERSION --hi?n th? thông tin c?a bi?n toàn c?c @@ VERSION, tr? l?i thông tin v? phiên b?n sql sever

Go
-- l?y t?ng t?t c? giá tr? c?a các b?n ghi trong tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory

-- l?y giá tr? trung bình c?a tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory

-- l?y giá tr? l?n nh?t c?a tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory

--?ém t?ng s? b?ng ghi trong b?ng ProductPhoto
SELECT COUNT(*) FROM Production.ProductPhoto
SELECT * FROM Production.ProductPhoto

-- l?y ra ngày , gi? h? th?ng 
SELECT GETDATE()

--l?y ra gi? h? th?ng
SELECT DATEPART(hh,GETDATE())

-- ??nh d?ng ngày dùng hàm CONVERT
SELECT CONVERT(VarChar(50),GETDATE(),103)

--l?y ra ??nh d?ng c?a c? s? d? li?u
SELECT DB_ID('AdventureWorks2019')

--t?o c? s? d? li?u
CREATE DATABASE EXAMPLE3

USE EXAMPLE3

--t?o b?ng trong coe s? d? li?u 
CREATE TABLE Contacts
(MailID VARCHAR(20),
Name NTEXT,
TelephoneNumber INT)

--thêm 1 c?t vào b?ng ?ã có:
ALTER TABLE Contacts ADD Address NVARCHAR (50)

-- thêm d? li?u vào b?ng contacts:
INSERT INTO Contacts values ('abc@gmail.com',N'Lee Tu?n Minh',123456678,N'Hà N?i')
INSERT INTO Contacts values ('123@gmail.com',N'Lee Tu?n Minha',123456678,N'Hà N?i')
INSERT INTO Contacts values ('xyz@gmail.com',N'Lee Tu?n Minhb',123456678,N'Hà N?i')
INSERT INTO Contacts values ('jqk@gmail.com',N'Lee Tu?n Minhc',123456678,N'Hà N?i')
--vi?t các n?i dung có d?u thì nh? thêm "N" phía tr??c

--l?y ra d? li?u t? b?ng contacts:
SELECT * FROM Contacts

--xóa b?n ghi có mailID=123@gmail.com
DELETE FROM Contacts WHERE MailID='123@gmail.com'

--s?a b?n ghi có mailID=xyz@gmail.com
UPDATE Contacts SET Name=N'Lee Tu?n Minhreal' WHERE MailID='xyz@gmail.com'

--t?o login account ?? test GRANT
CREATE LOGIN example3 WITH PASSWORD='123456'

-- t?o user t? login account v?a t?o 
CREATE USER example3 FROM LOGIN example3

--h?y b? t?t c? các quy?n c?a user example3 trên b?ng COntacts
REVOKE ALL ON Contacts FROM example3
-- gán quy?n SELECT cho example3 trên b?ng Contacts
GRANT SELECT ON Contacts TO example3

