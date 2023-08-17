create database Assign05Db
use Assign05Db
create schema bank 
create table bank.Customers
(CId int primary key Identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null,
Contact int not null,
CPwd as right(CName, 2) + convert(nvarchar(10), CId) +''+left(Contact, 2) persisted 
);
insert into bank.Customers values(1000,'Raj','Sravs@123gmail.com',96878576)
insert into bank.Customers values(1001,'Deep','venky@gmail.com',967854032)
insert into bank.Customers values(1002,'Amit','swapna@gmail.com',70320962)
insert into bank.Customers values(1003,'Vinay','Swathi@gmail.com',95462342)
insert into bank.Customers values(1004,'Venu','venu@gmail.com',9876234)
insert into bank.Customers values(1005,'Vivek','Vivek@gmail.com',94566234)
select  * from bank.Customers

CREATE TABLE bank.Maillnfo (
    MailTo VARCHAR(100),
    MailDate DATE,
    MailMessage VARCHAR(200)
);


CREATE TRIGGER trgMailToCust
ON bank.Customer
AFTER INSERT
AS
BEGIN
    INSERT INTO bank.Maillnfo (MailTo, MailDate, MailMessage)
    SELECT i.CEmail, GETDATE(), 
	'Your net banking password is: ' + i.CPwd + '.
	It is valid up to 2 days only. Update it.'
    FROM inserted i;
END;
select * from bank.Maillnfo


