# InnoSistemas

API REST para gestión de proyectos académicos.

## Requisitos

- Java 17+
- Maven (o usa el wrapper incluido)
- PostgreSQL

## Ejecutar el Proyecto

### 1. (Opcional) Levantar PostgreSQL con Docker

```powershell
docker run --name postgres-innosistemas `
  -e POSTGRES_PASSWORD=mysecretpassword `
  -e POSTGRES_DB=innosistemas `
  -p 5432:5432 `
  -d postgres:15
```

### 2. (Opcional) Configurar variables de entorno

Si usas PostgreSQL local:

```powershell
$env:SPRING_DATASOURCE_URL="jdbc:postgresql://localhost:5432/innosistemas"
$env:SPRING_DATASOURCE_USERNAME="postgres"
$env:SPRING_DATASOURCE_PASSWORD="mysecretpassword"
```

Si no, la app usa la BD remota ya configurada en `application.properties`.

### 3. Instalar dependencias y compilar

```powershell
.\mvnw.cmd clean install
```

### 4. Aplicar migraciones

```powershell
.\mvnw.cmd flyway:migrate
```

### 5. Ejecutar la aplicación

```powershell
.\mvnw.cmd spring-boot:run
```

La aplicación estará en: **http://localhost:8080**

## API Endpoints

### Projects
- `GET /api/projects` - Listar todos
- `GET /api/projects/{id}` - Obtener por ID
- `POST /api/projects` - Crear proyecto
- `DELETE /api/projects/{id}` - Eliminar
- `GET /api/projects/student/{studentId}` - Proyectos de un estudiante
- `GET /api/projects/student/{studentId}/count` - Contar proyectos

### Teams
- `GET /api/teams` - Listar todos
- `GET /api/teams/{id}` - Obtener por ID
- `POST /api/teams` - Crear equipo
- `DELETE /api/teams/{id}` - Eliminar
- `GET /api/teams/project/{projectId}` - Equipos de un proyecto
- `GET /api/teams/student/{studentId}` - Equipos de un estudiante

**Ubicación de migraciones:** `src/main/resources/db/migration/`

**Nota:** No ejecutes `flyway:migrate` en producción sin respaldo.