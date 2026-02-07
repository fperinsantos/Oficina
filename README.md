📌 Projeto Banco de Dados – Sistema de Oficina Mecânica

Este repositório apresenta o desenvolvimento de um banco de dados relacional para o gerenciamento de uma oficina mecânica, contemplando clientes, veículos, mecânicos, ordens de serviço, serviços e peças. O projeto foi elaborado a partir da modelagem conceitual em ER, convertida para o modelo lógico e implementada em SQL.

📂 Estrutura do Repositório

O projeto está organizado nos seguintes arquivos:

oficina_database.sql
Script responsável pela criação do banco de dados, tabelas, chaves primárias, estrangeiras e restrições (constraints).

oficina_values.sql
Script para inserção de dados de teste, permitindo a validação e simulação do funcionamento do sistema.

oficina_query.sql
Script contendo consultas SQL avançadas para análise e extração de informações do banco.

🗃️ Modelagem do Banco

O banco de dados foi estruturado com as seguintes entidades principais:

Cliente

Veículo

Mecânico

Ordem de Serviço

Serviço

Peça

Além disso, foram implementadas tabelas associativas para representar relacionamentos muitos-para-muitos entre ordens, serviços, peças e mecânicos.

Foram aplicadas:

Chaves primárias e estrangeiras

Restrições de unicidade

Validações com CHECK

Regras de integridade referencial

🔍 Funcionalidades das Consultas

As queries implementadas contemplam:

Recuperações simples com SELECT

Filtros com WHERE

Cálculos e atributos derivados

Ordenações com ORDER BY

Agrupamentos com GROUP BY e HAVING

Junções entre múltiplas tabelas (JOIN)

Essas consultas permitem responder questões como:

Total gasto por cliente

Serviços mais realizados

Mecânicos com mais ordens

Valor total das ordens

Controle de estoque

Análise por status

▶️ Como Executar o Projeto

Execute o arquivo oficina_database.sql para criar o banco e as tabelas.

Execute o arquivo oficina_values.sql para inserir os dados.

Execute o arquivo oficina_query.sql para testar as consultas.

Os scripts podem ser executados em ambientes compatíveis com MySQL/MariaDB.

🎯 Objetivo do Projeto

Este projeto tem como objetivo aplicar os conceitos de modelagem de dados, normalização, implementação em SQL e construção de consultas avançadas no contexto de um sistema de oficina mecânica, conforme proposto no desafio do módulo de banco de dados.
