/* ==============================================================
   Q01 – TOP 5 cursos com mais inscrições **ativas**
   Retorne: id_curso · nome · total_inscritos
=================================================================*/
-- SUA QUERY AQUI

SELECT
    c.id_curso,
    c.nome,
    COUNT(i.id_inscricao) AS total_inscritos
FROM
    cursos c
JOIN
    inscricoes i ON c.id_curso = i.id_curso
WHERE
    i.status = 'ativo'
GROUP BY
    c.id_curso, c.nome
ORDER BY
    total_inscritos DESC
LIMIT 5;


/* ==============================================================
   Q02 – Taxa de conclusão por curso
   Para cada curso, calcule:
     • total_inscritos
     • total_concluidos   (status = 'concluída')
     • taxa_conclusao (%) = concluídos / inscritos * 100
   Ordene descendentemente pela taxa de conclusão.
=================================================================*/
-- SUA QUERY AQUI

SELECT
    c.id_curso,
    c.nome,
    COUNT(i.id_inscricao) AS total_inscritos,
    SUM(CASE WHEN i.status = 'concluido' THEN 1 ELSE 0 END) AS total_concluidos,
    ROUND(
      100.0 * SUM(CASE WHEN i.status = 'concluido' THEN 1 ELSE 0 END) / 
      COUNT(i.id_inscricao), 
    2) AS taxa_conclusao
FROM
    cursos c
JOIN
    inscricoes i ON c.id_curso = i.id_curso
GROUP BY
    c.id_curso, c.nome
ORDER BY
    taxa_conclusao DESC;

/* ==============================================================
   Q03 – Tempo médio (dias) para concluir cada **nível** de curso
   Definições:
     • Início = data_insc   (tabela inscricoes)
     • Fim    = maior data em progresso onde porcentagem = 100
   Calcule a média de dias entre início e fim,
   agrupando por cursos.nivel (ex.: Básico, Avançado).
=================================================================*/
-- SUA QUERY AQUI
SELECT
  c.nivel,
  ROUND(AVG(julianday(p.data_ultima_atividade) - julianday(i.data_inscricao)), 1) AS tempo_medio_dias
FROM
  inscricoes i
  JOIN cursos c ON i.id_curso = c.id_curso
  JOIN progresso p ON i.id_aluno = p.id_aluno AND p.percentual = 100
WHERE
  i.status = 'concluido'
GROUP BY
  c.nivel
ORDER BY
  tempo_medio_dias DESC;


/* Olhei os dados e vi que ninguém chegou a 100% de progresso em nenhum módulo, conforme evidências nas imagens Q3_tela.png e Q3_tela_01.png.*/
/* Por isso, a consulta não retorna resultado para o cálculo do tempo médio de conclusão.*/

/* ==============================================================
   Q04 – TOP 10 módulos com maior **taxa de abandono**
   - Considere abandono quando porcentagem < 20 %
   - Inclua apenas módulos com pelo menos 20 alunos
   Retorne: id_modulo · titulo · abandono_pct
   Ordene do maior para o menor.
=================================================================*/
-- SUA QUERY AQUI

SELECT
  m.id_modulo,
  m.titulo,
  ROUND(100.0 * SUM(CASE WHEN p.percentual < 20 THEN 1 ELSE 0 END) / COUNT(*), 2) AS abandono_pct,
  COUNT(*) AS total_alunos
FROM
  modulos m
JOIN
  progresso p ON m.id_modulo = p.id_modulo
GROUP BY
  m.id_modulo, m.titulo
HAVING
  COUNT(*) >= 20
ORDER BY
  abandono_pct DESC
LIMIT 10;

/*Nenhum módulo nesta base de dados possui pelo menos 20 alunos, conforme evidência na imagem Q4_tela.*/
/* a consulta retorna vazia*/

/* ==============================================================
   Q05 – Crescimento de inscrições (janela móvel de 3 meses)
   1. Para cada mês calendário (YYYY-MM), conte inscrições.
   2. Calcule a soma móvel de 3 meses (mês atual + 2 anteriores) → rolling_3m.
   3. Calcule a variação % em relação à janela anterior.
   Retorne: ano_mes · inscricoes_mes · rolling_3m · variacao_pct
=================================================================*/
-- SUA QUERY AQUI

1.
SELECT 
  strftime('%Y-%m', data_inscricao) AS ano_mes,
  COUNT(*) AS inscricoes_mes
FROM inscricoes
GROUP BY ano_mes
ORDER BY ano_mes;

------------------------------------------

2.
SELECT 
  a.ano_mes,
  a.inscricoes_mes,
  IFNULL(a.inscricoes_mes, 0) 
    + IFNULL(b.inscricoes_mes, 0) 
    + IFNULL(c.inscricoes_mes, 0) AS rolling_3m
FROM 
  (
    SELECT strftime('%Y-%m', data_inscricao) AS ano_mes, COUNT(*) AS inscricoes_mes
    FROM inscricoes
    GROUP BY ano_mes
  ) a
  LEFT JOIN (
    SELECT strftime('%Y-%m', data_inscricao) AS ano_mes, COUNT(*) AS inscricoes_mes
    FROM inscricoes
    GROUP BY ano_mes
  ) b ON b.ano_mes = strftime('%Y-%m', date(a.ano_mes || '-01', '-1 month'))
  LEFT JOIN (
    SELECT strftime('%Y-%m', data_inscricao) AS ano_mes, COUNT(*) AS inscricoes_mes
    FROM inscricoes
    GROUP BY ano_mes
  ) c ON c.ano_mes = strftime('%Y-%m', date(a.ano_mes || '-01', '-2 month'))
ORDER BY a.ano_mes;
-------------------------------------------------------------------------------
