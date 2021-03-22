create database s2                                 /*  Project =====> Characteristics Of Employees */ 
use s2

create table country (Country_ID int primary key identity(1,1), Country_Name varchar(50))
SP_SelecAllFromCountry
                                                                                     
insert into country values ('Germany'), ('Italy'), ('Uk'), ('Japan'), ('Canada'), ('Spain'), ('Finland'), ('France'), ('Usa'), ('China')

create table province (Province_ID int primary key identity(1,1), Porovince_Name varchar(50), CountryName_ int foreign key references country(Country_ID))
SP_SelecAllFromProvince
                                                                                                                                              
insert into province values ('Lombardy',2),('Tokyo',4),('Shanghai',10),('Bavaria',1),('Catalonia',6),('North West England',3), ('Auvergne-Rhone-Alpes',8),('California',9),('Brtish Coumbia',5), ('Uusimaa',7)


create table city (City_ID int primary key identity(1,1), City_Name varchar(50), ProvinceName_ int foreign key references province(Province_ID))  
SP_SelecAllFromCity
                                                                                                                                   
insert into city values ('Milan',1), ('Tokyo',2), ('Shanghai',3), ('Munich',4), ('Barcelona',5), ('Newcastle',6), ('Lyon',7), ('Los Angeles',8), ('Vancouver',9), ('Helsinki',10)

Create table MaleEmployees (Employee_ID int primary key identity(1,1), Employee_Name varchar(50), Employee_Department varchar(50), Employee_Country int foreign key references country(Country_ID), Employee_Province int foreign key references province(Province_ID), Employee_City int foreign key references city(City_ID)) 
SP_SelecAllFromMaleEmployees 

insert into MaleEmployees values ('John','IT',9,8,8),
('Max','IT',7,10,10),
('Justin','Marketing',2,1,1),   
('Henry','Finance',1,4,4),       
('Oliver','Agriculture',5,9,9), 
('William','Transport',3,6,6),  
('Noah','Mining',4,2,2),        
('Liam','Petroleum',9,8,8),
('Logan','Transport',6,5,5),      
('Luca','Marketing',7,10,10),     
('Kevin','IT',2,1,1),     
('Daniel','IT',9,8,8),
('Benjamin','Finance',10,3,3),      
('Fred','Petroleum',9,8,8), 
('Marco','Finance',8,7,7),    
('Erik','Mining',9,8,8),
('Robert','IT',9,8,8),
('Jacob','Retail',3,6,6),
('Dan','Mining',9,8,8),
('Andy','Food',1,4,4),
('Peter','Insurance',2,1,1)


Create table FemaleEmployees (Employee_ID int primary key identity(1,1), Employee_Name varchar(50), Employee_Department varchar(50), Employee_Country int foreign key references country(Country_ID), Employee_Province int foreign key references province(Province_ID), Employee_City int foreign key references city(City_ID))

create proc SP_SelecAllFromFemaleEmployees             --sp
as
select * from FemaleEmployees

SP_SelecAllFromFemaleEmployees                  
create proc SP_InsertIntoFemaleEmployees              --sp
(
@Employee_Name varchar(50),
@Employee_Department varchar(50),
@Employee_Country int,
@Employee_Province int, 
@Employee_City int
)
AS
begin
insert into FemaleEmployees values (@Employee_Name, @Employee_Department, @Employee_Country, @Employee_Province, @Employee_City)
end

SP_InsertIntoFemaleEmployees 'Malmi','Food',5 ,9 ,9

SP_InnerjoinMaleEmployees                              --sp


create proc SP_InnerjoinFemaleEmployees                --sp
as 
begin
select FemaleEmployees.Employee_ID, FemaleEmployees.Employee_Name, FemaleEmployees.Employee_Department, country.Country_Name, province.Porovince_Name , city.City_Name
from FemaleEmployees
inner join country 
on FemaleEmployees.Employee_Country = Country.Country_ID
inner join province
on FemaleEmployees.Employee_Province = Province.Province_ID
inner join city
on FemaleEmployees.Employee_City = City.City_ID
end 



create index IX_FemaleEmployees                                  --index       
on FemaleEmployees (Employee_Name, Employee_Department)








