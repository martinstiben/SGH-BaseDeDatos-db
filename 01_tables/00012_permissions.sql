-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: permissions
-- | Description: Tabla para almacenar permisos del sistema
-- |
-- | Create date: 2025-11-13
-- | Ticket: DDL-001
-- ==========================================================================================

-- | Change History:
-- ==========================================================================================
-- | Date        | Ticket      | Author            | Description
-- ==========================================================================================
-- | 2025-11-13  | DDL-001     | Sistema SGH       | Creación inicial
-- ==========================================================================================

CREATE TABLE permissions (
    permission_id INT AUTO_INCREMENT PRIMARY KEY,
    permission_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
) COMMENT = 'Tabla para permisos del sistema SGH';