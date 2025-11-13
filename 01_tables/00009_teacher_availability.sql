-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: teacher_availability
-- | Description: Tabla para almacenar disponibilidad de profesores
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

CREATE TABLE TeacherAvailability (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    day VARCHAR(255) NOT NULL,
    amStart TIME,
    amEnd TIME,
    pmStart TIME,
    pmEnd TIME,
    end_time TIME,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacherId) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY uk_teacher_availability (teacher_id, day),
    INDEX idx_teacher_availability_day (day)
) COMMENT = 'Tabla para disponibilidad de profesores del sistema SGH';