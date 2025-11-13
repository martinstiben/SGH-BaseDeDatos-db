-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: schedule_history
-- | Description: Tabla para almacenar historial de generación de horarios
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

CREATE TABLE schedule_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    executedBy VARCHAR(255),
    executedAt DATETIME(6),
    status VARCHAR(255),
    totalGenerated INT NOT NULL,
    message VARCHAR(1000),
    periodStart DATE,
    periodEnd DATE,
    dryRun BOOLEAN NOT NULL,
    force_flag BOOLEAN NOT NULL,
    params VARCHAR(500),
    INDEX idx_schedule_history_executedBy (executedBy),
    INDEX idx_schedule_history_status (status),
    INDEX idx_schedule_history_executedAt (executedAt),
    INDEX idx_schedule_history_period (periodStart, periodEnd)
) COMMENT = 'Tabla para historial de generación de horarios del sistema SGH';