-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: courses
-- | Description: Tabla para almacenar cursos en el sistema de horarios
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

CREATE TABLE courses (
    courseId INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(2) NOT NULL UNIQUE,
    teacher_subject_id INT,
    grade_director_id INT,
    FOREIGN KEY (teacher_subject_id) REFERENCES teacher_subjects(teacher_subject_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (grade_director_id) REFERENCES teachers(teacherId) ON DELETE SET NULL ON UPDATE CASCADE,
    INDEX idx_courses_name (courseName)
) COMMENT = 'Tabla para cursos del sistema SGH';