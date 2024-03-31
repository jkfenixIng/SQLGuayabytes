-- =================================================
INSERT INTO [dbo].[ACCIONES]
           ([Accion])
     VALUES ('Agregar'),
			('Eliminar'),
			('Actualizar')

-- =================================================
INSERT INTO ItemsCategories (Cartegory)
VALUES ('Avatar'),
       ('Dado');

-- ===================================================
INSERT INTO [dbo].[GameTypes]
           ([GameType]
           ,[NumberOfDices]
           ,[StartingAmount]
           ,[AmountPlayers]
           ,[MinimumBet])
     VALUES ('Standar 1 Dado',1,20000,4,200),
			  ('Standar 2 Dados',2,20000,4,200),
			  ('Rapida 1 Dado',1,2000,4,200),
			  ('Rapida 2 Dados',2,2000,4,200)
GO
-- ===================================================
INSERT INTO GameModes (GameMode)
VALUES ('Cooperativo');
		