-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: schedule
-- | Description: Tabla para almacenar horarios de clases
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

CREATE TABLE schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseId INT NOT NULL,
    teacherId INT NOT NULL,
    subjectId INT NOT NULL,
    day VARCHAR(255),
    startTime TIME,
    endTime TIME,
    scheduleName VARCHAR(255),
    FOREIGN KEY (courseId) REFERENCES courses(courseId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (teacherId) REFERENCES teachers(teacherId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subjectId) REFERENCES subjects(subjectId) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_schedule_course (courseId),
    INDEX idx_schedule_teacher (teacherId),
    INDEX idx_schedule_subject (subjectId),
    INDEX idx_schedule_day (day),
    INDEX idx_schedule_time (startTime, endTime)
) COMMENT = 'Tabla para horarios de clases del sistema SGH';