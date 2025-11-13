-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: users
-- | Description: Tabla para almacenar usuarios del sistema de horarios
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

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL UNIQUE,
    role_id INT NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    verification_code VARCHAR(255),
    code_expiration DATETIME(6),
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    account_status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_users_role (role_id),
    INDEX idx_users_account_status (account_status),
    INDEX idx_users_email_verification (verification_code)
) COMMENT = 'Tabla para usuarios del sistema SGH';