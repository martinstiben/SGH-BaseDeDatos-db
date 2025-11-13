-- ==========================================================================================
-- | Author: Tu Nombre                                                                          |
-- | Name: p_example_procedure                                                                  |
-- | Description: Procedimiento almacenado de ejemplo para obtener usuarios por ID            |
-- |                                                                                        |
-- | Create date: 2025-11-12                                                                   |
-- | Ticket: TICKET-002                                                                        |
-- ==========================================================================================

-- | Change History:                                                                        |
-- ==========================================================================================
-- | Date        | Ticket      | Author            | Description                          |
-- ==========================================================================================
-- | 2025-11-12  | TICKET-002  | Tu Nombre         | Creación inicial del procedimiento    |
-- ==========================================================================================

CREATE PROCEDURE p_get_user_by_id(IN user_id INT)
BEGIN
    SELECT id, name, email, created_at, updated_at
    FROM example_table
    WHERE id = user_id;
END;