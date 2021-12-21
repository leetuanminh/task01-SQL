USE AdventureWorks2019 --s? d?ng ki?u d? li?u AdventureWork2019

SELECT * FROM HumanResources.Employee 
--khai b�o bi?n 
Go
DECLARE @deptID INT -- kh�i b�o bi?n c?c b? t�n l� deptID ki?u int 
SELECT @deptID=1 -- g�n gi� tr? cho bi?n b?n 1
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @deptID
Go
SELECT @@LANGUAGE -- hi?n th? th�ng tin c?a bi?n to�n c?c @@LANGUAGE, tr? l?i th�ng tin ng�n ng? s? d?ng trong sever
SELECT @@VERSION --hi?n th? th�ng tin c?a bi?n to�n c?c @@ VERSION, tr? l?i th�ng tin v? phi�n b?n sql sever

Go
-- l?y t?ng t?t c? gi� tr? c?a c�c b?n ghi trong tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory

-- l?y gi� tr? trung b�nh c?a tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory

-- l?y gi� tr? l?n nh?t c?a tr??ng StadardCostHistory thu?c b?ng ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory

--?�m t?ng s? b?ng ghi trong b?ng ProductPhoto
SELECT COUNT(*) FROM Production.ProductPhoto
SELECT * FROM Production.ProductPhoto

-- l?y ra ng�y , gi? h? th?ng 
SELECT GETDATE()

--l?y ra gi? h? th?ng
SELECT DATEPART(hh,GETDATE())

-- ??nh d?ng ng�y d�ng h�m CONVERT
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

--th�m 1 c?t v�o b?ng ?� c�:
ALTER TABLE Contacts ADD Address NVARCHAR (50)

-- th�m d? li?u v�o b?ng contacts:
INSERT INTO Contacts values ('abc@gmail.com',N'Lee Tu?n Minh',123456678,N'H� N?i')
INSERT INTO Contacts values ('123@gmail.com',N'Lee Tu?n Minha',123456678,N'H� N?i')
INSERT INTO Contacts values ('xyz@gmail.com',N'Lee Tu?n Minhb',123456678,N'H� N?i')
INSERT INTO Contacts values ('jqk@gmail.com',N'Lee Tu?n Minhc',123456678,N'H� N?i')
--vi?t c�c n?i dung c� d?u th� nh? th�m "N" ph�a tr??c

--l?y ra d? li?u t? b?ng contacts:
SELECT * FROM Contacts

--x�a b?n ghi c� mailID=123@gmail.com
DELETE FROM Contacts WHERE MailID='123@gmail.com'

--s?a b?n ghi c� mailID=xyz@gmail.com
UPDATE Contacts SET Name=N'Lee Tu?n Minhreal' WHERE MailID='xyz@gmail.com'

--t?o login account ?? test GRANT
CREATE LOGIN example3 WITH PASSWORD='123456'

-- t?o user t? login account v?a t?o 
CREATE USER example3 FROM LOGIN example3

--h?y b? t?t c? c�c quy?n c?a user example3 tr�n b?ng COntacts
REVOKE ALL ON Contacts FROM example3
-- g�n quy?n SELECT cho example3 tr�n b?ng Contacts
GRANT SELECT ON Contacts TO example3

