-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: subjects
-- | Description: Tabla para almacenar asignaturas en el sistema de horarios
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

CREATE TABLE subjects (
    subjectId INT AUTO_INCREMENT PRIMARY KEY,
    subjectName VARCHAR(20) NOT NULL UNIQUE,
    INDEX idx_subjects_name (subjectName)
) COMMENT = 'Tabla para asignaturas del sistema SGH';