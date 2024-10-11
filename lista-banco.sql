-- 1 

CREATE VIEW alunos_cursos AS
SELECT a.nome AS aluno, d.nome AS disciplina, c.nome AS curso
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id
JOIN curso c ON d.id_curso = c.id;

-- 2

CREATE VIEW total_alunos_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total_alunos
FROM disciplina d
LEFT JOIN matricula m ON d.id = m.id_disciplina
GROUP BY d.nome;

-- 3

CREATE VIEW alunos_status_matricula AS
SELECT a.nome AS aluno, d.nome AS disciplina, m.status
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id;

-- 4 

CREATE VIEW Professores_Turmas AS
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM professores p
JOIN turmas t ON p.id = t.professor_id
JOIN disciplinas d ON t.disciplina_id = d.id;


-- 5 

CREATE VIEW alunos_maiores_20 AS
SELECT nome, data_nascimento
FROM aluno
WHERE DATEDIFF(CURDATE(), data_nascimento) / 365 > 20;


-- 6 

CREATE VIEW carga_horaria_cursos AS
SELECT c.nome AS curso, COUNT(d.id) AS total_disciplinas, SUM(d.carga_horaria) AS carga_horaria_total
FROM curso c
JOIN disciplina d ON c.id = d.id_curso
GROUP BY c.nome;


-- 7 

CREATE VIEW professores_especialidades AS
SELECT nome, especialidade
FROM professor;


-- 8 

CREATE VIEW alunos_multidisciplina AS
SELECT a.nome AS aluno, COUNT(m.id_disciplina) AS total_disciplinas
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
GROUP BY a.nome
HAVING total_disciplinas > 1;


-- 9 

CREATE VIEW alunos_disciplinas_concluidas AS
SELECT a.nome AS aluno, COUNT(m.id_disciplina) AS disciplinas_concluidas
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
WHERE m.status = 'Concluído'
GROUP BY a.nome;


-- 10 

CREATE VIEW turmas_semestre AS
SELECT t.id, d.nome AS disciplina, t.horario
FROM turma t
JOIN disciplina d ON t.id_disciplina = d.id
WHERE t.semestre = '2024.1';

-- 11 

CREATE VIEW alunos_matriculas_trancadas AS
SELECT a.nome AS aluno
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
WHERE m.status = 'Trancado';

-- 12 

CREATE VIEW disciplinas_sem_alunos AS
SELECT d.nome AS disciplina
FROM disciplina d
LEFT JOIN matricula m ON d.id = m.id_disciplina
WHERE m.id_disciplina IS NULL;


-- 13 

CREATE VIEW total_alunos_status AS
SELECT m.status, COUNT(m.id_aluno) AS total_alunos
FROM matricula m
GROUP BY m.status;


-- 14

CREATE VIEW total_professores_especialidade AS
SELECT especialidade, COUNT(*) AS total_professores
FROM professor
GROUP BY especialidade;


-- 15

CREATE VIEW alunos_idade AS
SELECT nome, YEAR(CURDATE()) - YEAR(data_nascimento) AS idade
FROM aluno;


-- 16 

CREATE VIEW alunos_ultimas_matriculas AS
SELECT a.nome AS aluno, MAX(m.data_matricula) AS ultima_matricula
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
GROUP BY a.nome;


-- 17

CREATE VIEW disciplinas_curso_especifico AS
SELECT d.nome AS disciplina
FROM disciplina d
JOIN curso c ON d.id_curso = c.id
WHERE c.nome = 'Engenharia de Software';


-- 18 

CREATE VIEW professores_sem_turmas AS
SELECT p.nome AS professor
FROM professor p
LEFT JOIN turma t ON p.id = t.id_professor
WHERE t.id_professor IS NULL;


-- 19

CREATE VIEW alunos_cpf_email AS
SELECT nome, cpf, email
FROM aluno;

-- 20 

CREATE VIEW total_disciplinas_por_professor AS
SELECT p.nome AS professor, COUNT(t.id_disciplina) AS total_disciplinas
FROM professor p
JOIN turma t ON p.id = t.id_professor
GROUP BY p.nome;
