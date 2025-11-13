-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: people
-- | Description: Tabla para almacenar información de personas en el sistema de horarios
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

CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    photo_file_name VARCHAR(255),
    photo_content_type VARCHAR(100),
    photo_data LONGBLOB,
    INDEX idx_people_email (email)
) COMMENT = 'Tabla para personas del sistema SGH';