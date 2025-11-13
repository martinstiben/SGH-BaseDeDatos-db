--==========================================================================================
--| Author: Tu Nombre                                                                          |
--| Name: example_table_rollback                                                               |
--| Description: Rollback script para eliminar la tabla example_table                         |
--|                                                                                        |
--| Create date: 2025-11-12                                                                   |
--| Ticket: TICKET-001                                                                        |
--==========================================================================================

--| Change History:                                                                        |
--==========================================================================================
--| Date        | Ticket      | Author            | Description                          |
--==========================================================================================
--| 2025-11-12  | TICKET-001  | Tu Nombre         | Creación inicial del rollback        |
--==========================================================================================

-- Eliminar la tabla example_table si existe
DROP TABLE IF EXISTS example_table;