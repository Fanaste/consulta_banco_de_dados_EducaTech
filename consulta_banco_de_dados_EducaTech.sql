-- Consulta no banco de dados da escola EducaTech

-- Consulta 1) Retornar a média de Notas dos Alunos em história:
SELECT AVG(nota) as "Média de história" FROM Notas
WHERE Id_disciplina = 2;

-- Como descobrir o ID da disciplina na tabela notas?
SELECT * FROM Disciplinas;
-- Descobri que o ID_disciplina de história é igual a 2.

-- Consulta 2) Retornar as informações dos alunos cujo Nome começa com 'A':
SELECT * FROM Alunos
WHERE Nome_aluno LIKE 'A%';

-- Consulta 3) Buscar apenas os alunos que fazem aniversário em fevereiro:
SELECT * FROM Alunos; --Ao obsevar os dados concluí:

SELECT * FROM Alunos
WHERE STRFTIME ('%m', data_nascimento) = '02';

-- Consulta 4) Realizar uma consulta que calcula a idade dos alunos:
 SELECT nome_aluno,
      data_nascimento,
      (strftime('%Y', 'now') - strftime('%Y', data_nascimento)) - 
      (strftime('%m-%d', 'now') < strftime('%m-%d', data_nascimento)) AS idade
FROM Alunos;

-- Consulta 5) Agrupar as notas por aluno e mostrar a média individual:
-- Observar os dados que estão presentes em Notas
SELECT * FROM Notas;
-- resolvendo a consulta
SELECT ID_Aluno,
       COUNT(*) AS Total_Avaliacoes,
       ROUND(AVG(Nota), 2) AS Media_Nota
FROM Notas
GROUP BY ID_Aluno;

-- Consulta 6) Retornar se o aluno está ou não aprovado. Aluno é considerado aprovado se a sua média foi igual ou maior que 6:
SELECT id_aluno, AVG(nota) as 'media_do_aluno',
CASE
WHEN AVG(nota) >= 6 THEN 'Aprovado!'
ELSE 'Reprovado'
END AS resultado
FROM Notas
GROUP BY ID_aluno;

-- Consulta 7) Selecionar professores que não têm e-mail cadastrado:
SELECT * FROM Professores
WHERE email IS NULL;

-- Verificar se realmente a tabela contém professores com os e-mail preenchidos
SELECT * FROM Professores;

-- Consulta 8) Listar os nomes de todas as disciplinas em ordem alfabética:
SELECT nome_disciplina FROM Disciplinas
ORDER BY nome_disciplina ASC;

-- Consulta 9) Listar os 5 primeiros alunos cadastrados em ordem alfabética:
SELECT nome_aluno FROM Alunos
ORDER BY nome_aluno
LIMIT 5;

-- Consulta 10) Exibir os nomes das turmas com letras maiúsculas:
SELECT UPPER (nome_turma) AS nome_maiusculo FROM turmas;

-- Consulta 11) Listar alunos com nomes que contenham a letra "e":
SELECT nome_aluno FROM Alunos
WHERE nome_aluno LIKE '%e%';

-- Consulta 12) Mostrar a quantidade total de disciplinas cadastradas:
SELECT COUNT(nome_disciplina) as total_disciplinas FROM Disciplinas;

-- Consulta 13) Listar todos os alunos que não estão na turma de ID 1:
--Conferi se realmente os alunos estão associados a turmas
SELECT * FROM Turma_Alunos;
--listando os alunos de acordo com as turmas que eu verifiquei na consulta, exceto turma 1
SELECT id_aluno FROM Turma_Alunos
WHERE id_turma IN (2, 3, 4, 5);

-- Consulta 14) Agrupar as notas por aluno e mostrar a média individual:
-- Observar os dados que estão presentes em Notas
SELECT * FROM Notas;
-- resolvendo a consulta
SELECT ID_Aluno,
       COUNT(*) AS Total_Avaliacoes,
       ROUND(AVG(Nota), 2) AS Media_Nota
FROM Notas
GROUP BY ID_Aluno;

-- Consulta 15) Mostrar apenas os alunos cuja média de notas seja maior que 7:
-- Preciso pegar as médias das avaliações por aluno para fazer essa filtragem 
SELECT ID_Aluno,
       ROUND(AVG(Nota), 2) AS Media_Nota
FROM Notas
GROUP BY ID_Aluno
Having Media_nota > 7;

-- Consulta 16) Concatenar nome e email dos alunos:
SELECT 'Aluno: ' || nome_aluno ||', E-mail: ' || email  as contato
FROM Alunos;