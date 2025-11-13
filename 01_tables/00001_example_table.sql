-- ==========================================================================================
-- | Author: Tu Nombre                                                                          |
-- | Name: example_table                                                                        |
-- | Description: Tabla de ejemplo para demostrar la estructura de Liquibase                   |
-- |                                                                                        |
-- | Create date: 2025-11-12                                                                   |
-- | Ticket: TICKET-001                                                                        |
-- ==========================================================================================

-- | Change History:                                                                        |
-- ==========================================================================================
-- | Date        | Ticket      | Author            | Description                          |
-- ==========================================================================================
-- | 2025-11-12  | TICKET-001  | Tu Nombre         | Creación inicial                     |
-- ==========================================================================================

CREATE TABLE IF NOT EXISTS example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Tabla de ejemplo para usuarios del sistema SGH';