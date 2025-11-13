-- ==========================================================================================
-- | Author: Sistema SGH
-- | Name: permissions_roles
-- | Description: Tabla de relación many-to-many entre roles y permisos
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

CREATE TABLE permissions_roles (
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_permissions_roles_role (role_id),
    INDEX idx_permissions_roles_permission (permission_id)
) COMMENT = 'Tabla de relación roles-permisos del sistema SGH';