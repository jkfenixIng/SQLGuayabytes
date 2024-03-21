-- -----------------------------------------------------
-- Trigger para agregar configuracion a usuario nuevo
-- -----------------------------------------------------
CREATE TRIGGER trg_AfterInsertUser
ON Users
AFTER INSERT
AS
BEGIN
    DECLARE @UserId INT;
    DECLARE @Music TINYINT = 1; -- Valor predeterminado: true
    DECLARE @Sounds TINYINT = 1; -- Valor predeterminado: true

    SELECT @UserId = IdUser FROM inserted;

    INSERT INTO Configuration (Music, Sounds, UserId)
    VALUES (@Music, @Sounds, @UserId);
END;