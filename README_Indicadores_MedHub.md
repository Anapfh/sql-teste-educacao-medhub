# Documentação Rápida dos Indicadores – Painel MedHub Educação

---

## Indicadores Principais

### 1. Total Inscrições  
- **Descrição:** Soma total de inscrições registradas no período analisado.  
- **Fonte:** Coluna `inscricoes_mes` da tabela `dashboard_kpis`.

### 2. Inscrições Mês Atual  
- **Descrição:** Total de inscrições no mês corrente (filtrado dinamicamente).  
- **Medida:** `Inscrições Mês Atual` (soma filtrada pelo mês mais recente).

### 3. Inscrições Mês Anterior  
- **Descrição:** Total de inscrições no mês anterior ao mês corrente.  
- **Medida:** `Inscrições Mês Anterior` (soma filtrada pelo mês anterior).

### 4. Taxa de Conclusão (%)  
- **Descrição:** Porcentagem de inscritos que concluíram os cursos no período.  
- **Medida:** `Taxa de Conclusão (%)` calculada pela razão `conclusoes_mes / inscricoes_mes`.

### 5. Conclusões Mensais  
- **Descrição:** Total de conclusões de curso no mês selecionado.  
- **Medida:** `Conclusões Mensais`.

### 6. Horas Assistidas  
- **Descrição:** Total de horas assistidas no mês selecionado.  
- **Medida:** `Horas Assistidas`.

### 7. Horas Assistidas Mês Atual  
- **Descrição:** Soma das horas assistidas no mês mais recente.  
- **Medida:** `Horas Assistidas Mês Atual`.

### 8. Alunos Ativos 30d  
- **Descrição:** Quantidade de alunos ativos nos últimos 30 dias, referente ao mês analisado.  
- **Medida:** `Alunos Ativos 30d`.

### 9. Alunos Ativos 30d Mês Atual e Anterior  
- **Descrição:** Alunos ativos nos meses atual e anterior, para comparação.  
- **Medidas:** `Alunos Ativos 30d Mês Atual` e `Alunos Ativos 30d Mês Anterior`.

### 10. Variação Percentual (%)  
- **Descrição:** Variação percentual entre mês atual e mês anterior para cada indicador.  
- **Medidas:**  
  - `Variação % Total Inscrições`  
  - `Variação % Conclusões Mensais`  
  - `Variação % Horas Assistidas`  
  - `Variação % Alunos Ativos 30d`.

---

## Observações

- As medidas temporais foram criadas utilizando DAX no Power BI, com suporte do Tabular Editor para facilitar comparações entre períodos.  
- O painel apresenta uma visão estratégica e dinâmica, permitindo analisar o comportamento dos KPIs principais e sua evolução ao longo do tempo.
