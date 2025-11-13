# SGH - Base de Datos con Liquibase

Este repositorio contiene la configuración de base de datos para el proyecto **SGH (Sistema de Gestión Hospitalaria)** utilizando Liquibase para el control de versiones de esquema de base de datos MySQL.

## 📋 Tabla de Contenidos

- [Acerca de Liquibase](#acerca-de-liquibase)
- [Estructura del Repositorio](#estructura-del-repositorio)
- [Primeros Pasos](#primeros-pasos)
- [Guías de Cambios](#guías-de-cambios)
- [Proceso de Despliegue](#proceso-de-despliegue)
- [Pipeline CI/CD](#pipeline-cicd)
- [Variables de Entorno](#variables-de-entorno)
- [Mejores Prácticas](#mejores-prácticas)
- [Estrategia de Rollback](#estrategia-de-rollback)
- [Comandos Comunes](#comandos-comunes)

## Acerca de Liquibase

Liquibase es una herramienta de código abierto para el control de versiones de esquemas de base de datos que permite:

- Rastrear, versionar y desplegar cambios en la base de datos
- Automatizar actualizaciones de base de datos en diferentes entornos
- Revertir cambios cuando sea necesario
- Generar documentación de base de datos
- Mantener historial de cambios de base de datos

## Estructura del Repositorio

```
SGH-BaseDeDatos-db/
├── 01_tables/                              # 📊 Tablas (CREATE/ALTER TABLE)
│   ├── .gitkeep
│   ├── 00000_changelog.yaml                # Changelog para tablas
│   ├── 00001_example_table.sql             # Ejemplo de tabla
│   └── ...
├── 02_procedures/                          # 🔧 Procedimientos almacenados
│   ├── .gitkeep
│   ├── 00000_changelog.yaml
│   └── ...
├── 03_materialized_views/                  # 📈 Vistas materializadas
├── 04_functions/                           # ⚙️ Funciones
├── 05_views/                               # 👁️ Vistas
├── 06_triggers/                            # ⚡ Triggers
├── 07_indexes/                             # 🚀 Índices
├── 08_types/                               # 🏷️ Tipos personalizados
├── 09_inserts/                             # 📥 Inserciones de datos
├── 10_updates/                             # 🔄 Actualizaciones de datos
├── 11_rollbacks/                           # 🔙 Scripts de rollback
├── liquibase.properties                    # Configuración de Liquibase
├── changelog.yaml                          # Changelog maestro
├── docker-compose.yml                      # Configuración Docker MySQL
├── .gitlab-ci.yml                          # Pipeline CI/CD
└── README.md                               # Este archivo
```

## Primeros Pasos

### Prerrequisitos

1. **Liquibase CLI**: Instalar Liquibase
   ```bash
   # Windows (Chocolatey)
   choco install liquibase

   # Linux
   wget https://github.com/liquibase/liquibase/releases/download/v4.28.0/liquibase-4.28.0.tar.gz
   tar -xzf liquibase-4.28.0.tar.gz
   ```

2. **MySQL Connector/J**: Colocar el JAR del driver JDBC
   ```bash
   # Colocar mysql-connector-j-9.5.0.jar en la raíz del proyecto
   # Descargar desde: https://dev.mysql.com/downloads/connector/j/
   ```

3. **MySQL**: Base de datos MySQL corriendo (ya configurada en tu proyecto)

### Configuración

1. **Actualizar `liquibase.properties`**:
   ```properties
   liquibase.command.url=jdbc:mysql://localhost:3306/horarios
   liquibase.command.username=root
   liquibase.command.password=tu_password
   ```

2. **Para desarrollo local con Docker** (opcional):
   ```bash
   docker-compose up -d
   ```

## Guías de Cambios

### Convención de Nombres

Los archivos siguen el patrón:
```
{numero_secuencia}_{descripcion}.sql
```

Ejemplos:
- `00001_create_users_table.sql`
- `00002_add_email_column.sql`

### Plantilla de Changeset

Agregar esta estructura al archivo `00000_changelog.yaml` correspondiente:

```yaml
- changeSet:
    id: a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d
    author: tu.email@company.com
    context: sgh
    labels: TICKET-001
    comment: Descripción breve del cambio
    changes:
      - tagDatabase:
          tag: v1.0.0
      - sqlFile:
          path: 01_tables\00001_example.sql
          endDelimiter: \n;
          stripComments: false
    rollback:
      - sqlFile:
          path: 11_rollbacks\01_tables\00001_example_rollback.sql
```

### Plantilla SQL

```sql
--==========================================================================================
--| Author: Tu Nombre                                                                          |
--| Name: nombre_objeto                                                                        |
--| Description: Descripción del script                                                       |
--|                                                                                        |
--| Create date: YYYY-MM-DD                                                                   |
--| Ticket: TICKET-001                                                                        |
--==========================================================================================

-- Tu código SQL aquí
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```

## Proceso de Despliegue

### Desarrollo Local

1. **Validar cambios**:
   ```bash
   liquibase validate
   ```

2. **Ver cambios pendientes**:
   ```bash
   liquibase status
   ```

3. **Aplicar cambios**:
   ```bash
   liquibase update
   ```

4. **Rollback si es necesario**:
   ```bash
   liquibase rollback-count 1
   ```

### Estrategia de Ramas

- **`develop`**: Entorno de desarrollo (despliegue automático)
- **`qa`**: Entorno de QA (despliegue manual)
- **`staging`**: Pre-producción (despliegue manual)
- **`main`**: Producción (despliegue manual con aprobación)

## Pipeline CI/CD

El archivo `.gitlab-ci.yml` define tres etapas:

### 1. job_validate
Valida la sintaxis del changelog.

### 2. job_status
Lista los changesets no desplegados.

### 3. job_update
Aplica todos los changesets pendientes.

**Nota**: Los despliegues en `staging` y `main` requieren aprobación manual.

## Variables de Entorno

Configurar estas variables en GitLab CI/CD:

### Desarrollo
- `DB_HOST_DEV=localhost`
- `DB_NAME_DEV=horarios`
- `DB_USER_DEV=root`
- `DB_PASSWORD_DEV=tu_password`

### QA, Staging, Producción
- `DB_HOST_QA`, `DB_HOST_STAGING`, `DB_HOST_PROD`
- `DB_NAME_QA=horarios_qa`, etc.
- `DB_USER_*`, `DB_PASSWORD_*`

## Mejores Prácticas

### ✅ Hacer
- Crear nuevos changesets para todos los cambios
- Probar localmente antes de hacer push
- Incluir scripts de rollback para cambios destructivos
- Usar comentarios descriptivos
- Seguir convenciones de nomenclatura
- Documentar lógica compleja

### ❌ No Hacer
- Modificar changesets ya ejecutados
- Hacer commit de credenciales
- Omitir pruebas antes de push
- Combinar cambios no relacionados
- Usar DROP sin backups
- Olvidar scripts de rollback

## Estrategia de Rollback

### Crear Scripts de Rollback

Para cada changeset destructivo, crear script de rollback:

```sql
-- 11_rollbacks/01_tables/00001_create_table_rollback.sql
DROP TABLE IF EXISTS example_table;
```

### Ejecutar Rollbacks

```bash
# Rollback último changeset
liquibase rollback-count 1

# Rollback a tag específico
liquibase rollback-to-tag v1.0.0

# Rollback a fecha específica
liquibase rollback-to-date "2024-01-01"
```

## Comandos Comunes

```bash
# Validar sintaxis
liquibase validate

# Ver cambios pendientes
liquibase status

# Aplicar todos los cambios
liquibase update

# Vista previa de SQL
liquibase update-sql

# Rollback N changesets
liquibase rollback-count N

# Rollback a tag
liquibase rollback-to-tag <tag>

# Generar documentación
liquibase db-doc ./docs

# Limpiar checksums (usar con cuidado)
liquibase clear-checksums

# Liberar bloqueo de base de datos
liquibase release-locks
```

## Solución de Problemas

### Checksum Validation Failed
```bash
liquibase clear-checksums
liquibase update
```

### Base de Datos Bloqueada
```bash
liquibase release-locks
```

### Problemas de Conexión
Verificar configuración en `liquibase.properties` y que la base de datos esté ejecutándose.

## Recursos Adicionales

- [Documentación de Liquibase](https://docs.liquibase.com/)
- [Documentación de MySQL](https://dev.mysql.com/doc/)
- [Mejores Prácticas de Liquibase](https://docs.liquibase.com/concepts/bestpractices.html)

---

**Proyecto**: SGH - Sistema de Gestión Hospitalaria
**Base de Datos**: MySQL 8.0
**Herramienta**: Liquibase 4.28

¡Feliz migrando! 🚀