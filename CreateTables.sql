--Create DATABASE Guayabytes
--USE Guayabytes
-- -----------------------------------------------------
-- Table Users
-- -----------------------------------------------------
CREATE TABLE Users (
    IdUser INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(200) NULL,
    NickName NVARCHAR(200) NULL,
    Email NVARCHAR(200) NULL,
    Password NVARCHAR(200) NULL,
    Cash INT NULL,
    PRIMARY KEY (IdUser)
);

-- -----------------------------------------------------
-- Table GameTypes
-- -----------------------------------------------------
CREATE TABLE GameTypes (
    IdGameType INT NOT NULL IDENTITY(1,1),
    GameType NVARCHAR(100) NULL,
    NumberOfDices INT NULL,
    StartingAmount INT NULL,
    AmountPlayers INT NULL,
    MinimumBet INT NULL,
    PRIMARY KEY (IdGameType)
);

-- -----------------------------------------------------
-- Table Games
-- -----------------------------------------------------
CREATE TABLE Games (
    IdGame INT NOT NULL IDENTITY(1,1),
    IdGameType INT NULL,
    PRIMARY KEY (IdGame),
    CONSTRAINT fk_Plays_GameTypes FOREIGN KEY (IdGameType)
    REFERENCES GameTypes (IdGameType)
);

-- -----------------------------------------------------
-- Table historyGames
-- -----------------------------------------------------
CREATE TABLE historyGames (
    IdhistoryGame INT NOT NULL IDENTITY(1,1),
    IdUser INT NULL,
    IdGame INT NULL,
    IsWinner TINYINT NULL,
    PRIMARY KEY (IdhistoryGame),
    CONSTRAINT IdUser FOREIGN KEY (IdUser)
    REFERENCES Users (IdUser),
    CONSTRAINT IdGame FOREIGN KEY (IdGame)
    REFERENCES Games (IdGame)
);

-- -----------------------------------------------------
-- Table ItemsCategories
-- -----------------------------------------------------
CREATE TABLE ItemsCategories (
    IdItemsCategories INT NOT NULL IDENTITY(1,1),
    Cartegory NVARCHAR(100) NULL,
    PRIMARY KEY (IdItemsCategories)
);

-- -----------------------------------------------------
-- Table Items
-- -----------------------------------------------------
CREATE TABLE Items (
    IdItem INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(100) NULL,
    Image VARBINARY(MAX) NULL, 
    Price INT NULL,
    IdCategory INT NULL,
    PRIMARY KEY (IdItem),
    CONSTRAINT IdCategory FOREIGN KEY (IdCategory)
    REFERENCES ItemsCategories (IdItemsCategories)
);

-- ----------------------------------------------------- 
-- Table UserInventory
-- -----------------------------------------------------
CREATE TABLE UserInventory (
    IdUserInventory INT NOT NULL IDENTITY(1,1),
    IdUser INT NULL, 
    IdItem INT NULL,
	Active TINYINT NULL,
    PRIMARY KEY (IdUserInventory),
    CONSTRAINT FK_UserInventory_Users FOREIGN KEY (IdUser)
    REFERENCES Users (IdUser),
    CONSTRAINT FK_UserInventory_Items FOREIGN KEY (IdItem)
    REFERENCES Items (IdItem)
);

-- -----------------------------------------------------
-- Table Configuration
-- -----------------------------------------------------
CREATE TABLE Configuration (
    IdConfiguration INT NOT NULL IDENTITY(1,1),
    Music TINYINT NULL,
    Sounds TINYINT NULL,
    UserId INT NULL, 
    PRIMARY KEY (IdConfiguration),
    CONSTRAINT FK_Configuration_Users FOREIGN KEY (UserId) 
    REFERENCES Users (IdUser)
);
-- -----------------------------------------------------
-- Table Configuracion Global
-- -----------------------------------------------------
CREATE TABLE ConfigGlobal (
    IdConfigGlobal INT NOT NULL IDENTITY(1,1),
    Config NVARCHAR(100) NOT NULL, 
	Value NVARCHAR(100) NOT NULL
);
-- -----------------------------------------------------
-- Table Acciones 
-- -----------------------------------------------------
CREATE TABLE Acciones (
    Id INT PRIMARY KEY IDENTITY,
    Accion NVARCHAR(50) NOT NULL
);
-- -----------------------------------------------------
-- Table Logs
-- -----------------------------------------------------
CREATE TABLE Logs (
    Id INT PRIMARY KEY IDENTITY,
    IdAccion INT NOT NULL,
    Descripcion NVARCHAR(MAX) NOT NULL,
    DateLog DATETIME NOT NULL,
    FOREIGN KEY (IdAccion) REFERENCES ACCIONES(Id)
);
