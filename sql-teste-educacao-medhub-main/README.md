# Desafio SQL + Power BI · MedHub Educação

Olá! Obrigada pelo seu interesse em participar deste desafio :) 

Você encontrará aqui um pequeno _data warehouse_ fictício com dados de uma empresa de educação médica e um conjunto de perguntas para demonstrar suas habilidades em SQL e visualização de dados.

> **O que esperamos**  
> 1. **Consultas SQL** para responder às 5 questões listadas.  
> 2. **Um painel simples** (3+ visuais) desenvolvido em Power BI, usando o arquivo `dashboard_kpis.csv`.


## Por onde começar

1. **Fork** este repositório e clone no seu computador.  
2. Importe os cinco CSVs principais no SGBD de sua preferência (Postgres, SQL Server, MySQL, SQLite…).  
3. Copie cada bloco de `questions/all_questions.sql` para um novo arquivo com o mesmo nome dentro de **`answers/`** e escreva a sua query.  
4. Abra `dashboard_kpis.csv` no Power BI e monte um painel com **pelo menos três visuais**, obrigatoriamente:  
   - Inscrições por mês  
   - Taxa de conclusão por mês  
   - Um KPI livre (horas assistidas ou alunos ativos 30 d)  
5. **Entregue o painel** (escolha 1 opção):  
   **A.** Salve o `.pbix` em **`dashboard/`** e faça commit.  
   **B.** Publique on-line, cole o link no Pull Request **e** anexe um print (`.png/.jpg`).  
6. Faça **commit + push** de tudo e abra um **Pull Request**


### Sobre os principais CSVs:

- Desafio SQL
  
| Arquivo | Principais colunas |
|---------|-------------------|
| **alunos.csv** | id_aluno, nome, email, data_cadastro |
| **cursos.csv** | id_curso, nome, nível, carga_horaria, obrigatorio |
| **inscricoes.csv** | id_inscricao, id_aluno, id_curso, data_insc, status |
| **modulos.csv** | id_modulo, id_curso, titulo, ordem, duracao_min |
| **progresso.csv** | id_progresso, id_aluno, id_modulo, porcentagem, ultima_atividade |

- Desafio Power BI
  
| Arquivo | Principais colunas |
|---------|-------------------|
| **dashboard_kpis.csv** | ano_mes, inscrições, conclusões, horas assistidas, alunos ativos 30 d |

Boa sorte e qualquer dúvida, abra uma **Issue** ou mencione **@MoniqueSquadraDigital** no seu Pull Request. 
Obrigada :)
