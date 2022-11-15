Create Database TempoDB

use TempoDB

Create Table Brands
(
	Id int identity primary key,
	Name nvarchar(100) not null,
)

Create Table Notebooks 
(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Price money,
	BrandId int references Brands(Id)
)

Create Table Phones
(
    Id int identity primary key,
	Name nvarchar(100) not null,
	Price money,
	BrandId int references Brands(Id)

)

Insert Into Brands
Values
('ACER'),
('DELL'),
('APPLE')

Insert Into Notebooks
Values
('Predator',1000),
('HV-300',2000),
('DD14',2500),
('SAMSUNG',900)

Insert Into Phones
Values
('Samsung',1000),
('Huawei',2000),
('Iphone',2500)


Select Notebooks.Name,Brands.Name 'BrandsName' from Brands,Notebooks

Select Phones.Name,Brands.Name 'BrandsName' from Brands,Phones

Select Name FROM Notebooks where Notebooks.Name LIKE '%S'

Select * from Notebooks where Price Between 2000 and 5000  or Price > 5000

Select * from Phones where Price Between 1000 and 1500  or Price > 1500

Select Brands.Name,COUNT(*)
from Brands
INNER JOIN Notebooks ON Notebooks.BrandId = Brands.Id Group by Brands.Name

Select Brands.Name,COUNT(*)
from Brands
INNER JOIN Phones ON Phones.BrandId = Brands.Id  Group by Brands.Name

Select name,BrandId From Phones
Union
Select name,BrandId From Notebooks

Select Phones.Id,Phones.Name,Phones.Price From Phones
Union All
Select Notebooks.Id,Notebooks.Name,Notebooks.Price From Notebooks

Select Phones.Id,Phones.Name,Phones.Price as 'BrandName' From Phones
Union All
Select Notebooks.Id,Notebooks.Name,Notebooks.Price as 'BrandName' From Notebooks








