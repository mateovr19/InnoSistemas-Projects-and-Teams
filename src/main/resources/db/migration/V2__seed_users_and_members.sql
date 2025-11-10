-- V2__seed_users_and_members.sql
-- SEED SIMPLE Y DIRECTO: IDs fijos + project_id = 1 (el de V1 siempre es 1)

-- ========================================
-- 1. USUARIOS (prof + 6 estudiantes)
-- ========================================
INSERT INTO users (id, username, full_name, email, active, created_at) VALUES
(10, 'prof_layton', 'Profesor Layton', 'layton@innosistemas.com', true, NOW()),
(20, 'student_alice', 'Alice Johnson', 'alice@student.com', true, NOW()),
(21, 'student_bob', 'Bob Smith', 'bob@student.com', true, NOW()),
(22, 'student_charlie', 'Charlie Davis', 'charlie@student.com', true, NOW()),
(23, 'student_diana', 'Diana Evans', 'diana@student.com', true, NOW()),
(24, 'student_eva', 'Eva Martínez', 'eva@student.com', true, NOW()),
(25, 'student_frank', 'Frank López', 'frank@student.com', true, NOW())
ON CONFLICT (id) DO NOTHING;

-- ========================================
-- 2. EQUIPOS PRINCIPALES (project_id = 1 → el proyecto seed de V1)
-- ========================================
INSERT INTO teams (id, name, project_id) VALUES
(301, 'Equipo Alfa', 1),
(302, 'Equipo Beta', 1),
(303, 'Equipo Gamma', 1),
(304, 'Equipo Delta', 1)
ON CONFLICT (id) DO NOTHING;

-- ========================================
-- 3. MIEMBROS EN EQUIPOS PRINCIPALES
-- ========================================
INSERT INTO team_members (team_id, student_id) VALUES
(301, 20), (301, 21), (301, 22),  -- Alice, Bob, Charlie
(302, 23), (302, 10),            -- Diana + Profe
(303, 24),                       -- Eva
(304, 25)                        -- Frank
ON CONFLICT (team_id, student_id) DO NOTHING;

-- ========================================
-- 4. CURSOS Y PROYECTOS EXTRA
-- ========================================
INSERT INTO courses (id, nombre, description) VALUES
(102, 'Arquitectura de Software', 'Patrones y clean code'),
(103, 'DevOps & Cloud', 'Docker, K8s, CI/CD')
ON CONFLICT (id) DO NOTHING;

INSERT INTO projects (id, name, description, status_id, course_id, created_at) VALUES
(202, 'Feedback 360°', 'Retroalimentación anónima', 2, 102, NOW()),
(203, 'Dashboard Ágil', 'Métricas en tiempo real', 1, 103, NOW())
ON CONFLICT (id) DO NOTHING;

-- ========================================
-- 5. EQUIPOS PARA PROYECTOS EXTRA
-- ========================================
INSERT INTO teams (id, name, project_id) VALUES
(305, 'Equipo Épico', 202),
(306, 'Equipo Legend', 203)
ON CONFLICT (id) DO NOTHING;

INSERT INTO team_members (team_id, student_id) VALUES
(305, 21),  -- Bob en Épico
(306, 10)   -- Profe en Legend
ON CONFLICT (team_id, student_id) DO NOTHING;

-- ========================================
-- MENSAJE FINAL
-- ========================================
SELECT '¡V2 SIMPLE COMPLETADA! 7 usuarios, 6 equipos, 3 proyectos, miembros asignados. Listo para demos.' AS status;