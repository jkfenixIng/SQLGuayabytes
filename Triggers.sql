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
-- -----------------------------------------------------
-- Trigger para cuando se activa un item del 
-- inventario del usuario desactiva los demas de ña misma categpria
-- -----------------------------------------------------
CREATE TRIGGER trg_UserInventory_ActiveUpdate
ON UserInventory
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(Active)
    BEGIN
        UPDATE ui
        SET ui.Active = 0
        FROM UserInventory ui
        INNER JOIN inserted i ON ui.IdItem = i.IdItem
        INNER JOIN Items itm ON ui.IdItem = itm.IdItem
        WHERE ui.UserId = i.UserId
        AND ui.IdItem <> i.IdItem
        AND itm.IdCategory = (
            SELECT IdCategory
            FROM Items
            WHERE IdItem = i.IdItem
        );
    END;
END;
-- -----------------------------------------------------
-- Trigger que asigna la imagen de avatar por defecto al crearse el usuario
-- -----------------------------------------------------
CREATE TRIGGER trg_AfterInsertUser
ON Users
AFTER INSERT
AS
BEGIN
    DECLARE @UserId INT;

    SELECT @UserId = IdUser FROM inserted;

    -- Insertar un nuevo registro en UserInventory para el nuevo usuario con IdItem igual a 1
    INSERT INTO UserInventory (IdUser, IdItem, Active)
    VALUES (@UserId, 1, 1); -- El valor de Active se establece en 1 (activo)
END;