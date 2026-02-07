# 🚗 Sistema de Banco de Dados — Oficina Mecânica

Este repositório contém a modelagem, implementação e consultas SQL de um banco de dados para o gerenciamento de uma oficina mecânica.

---

## 📌 Objetivo do Projeto

Desenvolver um banco de dados relacional para controlar:

- Clientes  
- Veículos  
- Mecânicos  
- Ordens de serviço  
- Serviços  
- Peças  
- Relacionamentos entre entidades  

Atendendo aos requisitos do desafio proposto na disciplina de Banco de Dados.

---

## 🗂️ Estrutura do Repositório

| Arquivo | Descrição |
|---------|-----------|
| `oficina_database.sql` | Criação do banco e das tabelas |
| `oficina_values.sql` | Inserção de dados para testes |
| `oficina_query.sql` | Consultas SQL avançadas |

---

## 🧩 Modelo Lógico

O projeto foi desenvolvido com base no modelo relacional, contemplando:

- Relacionamentos 1:N e N:N  
- Chaves primárias e estrangeiras  
- Restrições de integridade  
- Uso de ENUM, DEFAULT e CHECK  

Principais relacionamentos:

- Cliente → Veículo  
- Veículo → Ordem de Serviço  
- Ordem → Serviço  
- Ordem → Peça  
- Ordem → Mecânico  

---

## 📊 Funcionalidades

O sistema permite:

✔ Cadastro de clientes, veículos e mecânicos  
✔ Registro de ordens de serviço  
✔ Controle de serviços e peças  
✔ Acompanhamento do status das ordens  
✔ Análises por meio de consultas SQL  

---

## 🔍 Consultas Implementadas

As queries contemplam:

- SELECT (consultas básicas)
- WHERE (filtros)
- ORDER BY (ordenação)
- JOIN (junções)
- HAVING (filtros em grupos)
- Funções agregadas (COUNT, SUM, AVG)
- Atributos derivados

Exemplos de análises:

- Total de serviços por ordem  
- Mecânicos mais ativos  
- Ordens com maior custo  
- Consumo de peças  
- Faturamento por período  

---

## ▶️ Como Executar

1. Abra seu gerenciador MySQL (Workbench, DBeaver, etc)
2. Execute na ordem:

```sql
oficina_database.sql
oficina_values.sql
oficina_query.sql
