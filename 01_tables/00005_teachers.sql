-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: teachers
-- | Description: Tabla para almacenar profesores en el sistema de horarios
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

CREATE TABLE teachers (
    teacherId INT AUTO_INCREMENT PRIMARY KEY,
    teacherName VARCHAR(100) NOT NULL,
    photoData LONGBLOB,
    photoContentType VARCHAR(100),
    photoFileName VARCHAR(255),
    INDEX idx_teachers_name (teacherName)
) COMMENT = 'Tabla para profesores del sistema SGH';