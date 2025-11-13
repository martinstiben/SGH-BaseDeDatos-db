-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: teacher_subjects
-- | Description: Tabla de relación many-to-many entre profesores y asignaturas
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

CREATE TABLE teacher_subjects (
    teacher_subject_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacherId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subjectId) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY uk_teacher_subject (teacher_id, subject_id),
    INDEX idx_teacher_subjects_teacher (teacher_id),
    INDEX idx_teacher_subjects_subject (subject_id)
) COMMENT = 'Tabla de relación profesores-asignaturas del sistema SGH';