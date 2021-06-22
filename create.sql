CREATE DATABASE [ZooApp]

GO

USE ZooApp

GO

CREATE TABLE [dbo].[Zoo]
(
	ZooId int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ZooId PRIMARY KEY,
	[Location] nvarchar(255) NOT NULL
)

GO
CREATE TABLE [dbo].[Enclosure]
(
EnclosureId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Enclosure_Id PRIMARY KEY,
	ZooId int NOT NULL CONSTRAINT FK_Enclosure_Zoo_id FOREIGN KEY 
		REFERENCES [dbo].[Zoo] ([ZooId]) ON DELETE CASCADE ON UPDATE CASCADE,
	EnclosureName nvarchar(50) NOT NULL,
	SquareFeet int NOT NULL
)

GO

CREATE TABLE [dbo].[Employee]
(
	EmployeeId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Employee_Id PRIMARY KEY,
	ZooId int NOT NULL CONSTRAINT FK_Employee_Zoo_id FOREIGN KEY
		REFERENCES [dbo].[Zoo] ([ZooId]) ON DELETE CASCADE ON UPDATE CASCADE,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	EmployeeType varchar (12) NOT NULL CHECK (EmployeeType IN ('ZooKeeper', 'Veterinarian'))
)

GO

CREATE TABLE [dbo].[Animal]
(
	AnimalId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Animal_Id PRIMARY KEY,
	EnclosureId int NOT NULL CONSTRAINT FK_Animal_Enclosure_Id FOREIGN KEY
		REFERENCES [dbo].[Enclosure] (EnclosureId) ON DELETE CASCADE ON UPDATE CASCADE,
	RequiredSpace int NOT NULL,
	AnimalType varchar(10) CHECK (AnimalType IN ('Lion', 'Elephant', 'Bison', 'Penguin', 'Parrot', 'Turtle', 'Snake')),
	IsSick bit NOT NULL 
)

GO

CREATE TABLE [dbo].[AvailableFood]
(
	FoodId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Available_food_id PRIMARY KEY,
	VeterinarianId int NOT NULL CONSTRAINT FK_Zookeeper_available_food FOREIGN KEY
		REFERENCES [dbo].[Employee] (EmployeeId) ON DELETE CASCADE ON UPDATE CASCADE,
	FoodType varchar(10) NULL CHECK (FoodType IN ('Meat', 'Grass', 'Vegetable'))
)

GO

CREATE TABLE [dbo].[FavoriteFood] 
(
   FoodId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Favorite_food_id PRIMARY KEY,
   AnimalId int NOT NULL CONSTRAINT FK_Animal_favotite_food FOREIGN KEY
		REFERENCES [dbo].[Animal] (AnimalId) ON DELETE CASCADE ON UPDATE CASCADE,
   FoodType varchar (10) NOT NULL CHECK (FoodType IN ('Meat', 'Grass', 'Vegetable'))
)

GO

CREATE TABLE [dbo].[AvailableMedicine] 
(
MedicineId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Available_medicine_id PRIMARY KEY,
	EmployeeId int NOT NULL CONSTRAINT FK_Veterinarian_available_medicine FOREIGN KEY
		REFERENCES [dbo].[Employee] (EmployeeId) ON DELETE CASCADE ON UPDATE CASCADE,
	MedicineType varchar (20) NULL CHECK (MedicineType IN ('Antibiotics', 'AntiDepression', 'AntiInflammatory'))
)

GO

CREATE TABLE [dbo].[NeededMedicine] 
(
MedicineId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Needed_medicine_id PRIMARY KEY,
	AnimalId int NOT NULL CONSTRAINT FK_Animal_needed_medicine FOREIGN KEY
		REFERENCES [dbo].[Animal] (AnimalId) ON DELETE CASCADE ON UPDATE CASCADE,
	MedicineType varchar (20) NULL CHECK (MedicineType IN ('Antibiotics', 'AntiDepression', 'AntiInflammatory'))
)

GO

CREATE TABLE [dbo].[FriendlyAnimal] 
(
FriendlyAnimalId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Friendly_animal_id PRIMARY KEY,
	AnimalId int NOT NULL CONSTRAINT FK_Animal_friendly_with FOREIGN KEY
		REFERENCES [dbo].[Animal] (AnimalId) ON DELETE CASCADE ON UPDATE CASCADE,
	Animal varchar (10) NULL CHECK (Animal IN ('Lion', 'Elephant', 'Bison', 'Penguin', 'Parrot', 'Turtle', 'Snake'))
)

GO

CREATE TABLE [dbo].[AnimalExpirience] 
(
	AnimalExpirienceId int IDENTITY (1,1) NOT NULL CONSTRAINT PK_Animal_expirience_id PRIMARY KEY,
	AnimalId int NOT NULL CONSTRAINT FK_Veterinarian_expirience FOREIGN KEY
		REFERENCES [dbo].[Employee] (EmployeeId) ON DELETE CASCADE ON UPDATE CASCADE,
	Animal varchar (10) NULL CHECK (Animal IN ('Lion', 'Elephant', 'Bison', 'Penguin', 'Parrot', 'Turtle', 'Snake'))
)

GO
