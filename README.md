# Sistema e-Market - Modelagem e Implementação de Banco de Dados

Este repositório contém os artefatos de modelagem, diagramas e scripts SQL referentes ao desenvolvimento do banco de dados para o projeto corporativo **e-Market**, desenvolvido como parte dos requisitos acadêmicos da faculdade.

O objetivo principal do projeto consiste em projetar e implementar um ecossistema relacional robusto capaz de suportar o fluxo de operações de uma plataforma de comércio eletrônico, garantindo integridade, performance e consistência dos dados.

## Escopo do Projeto

O sistema foi estruturado para gerenciar as principais entidades e fluxos logísticos de um e-commerce, contemplando:
* **Gestão de Clientes e Autenticação:** Armazenamento de dados cadastrais, endereços de entrega e perfis de acesso.
* **Catálogo de Produtos:** Organização hierárquica por categorias, especificações técnicas e controle rigoroso de níveis de estoque.
* **Fluxo de Vendas e Pedidos:** Registro histórico de compras, processamento de itens de pedido, cálculos de totais e status de transações.
* **Logística e Pagamentos:** Vínculo com métodos de pagamento e controle de dados para faturamento.

---

## Metodologia de Desenvolvimento do Banco

A construção do banco de dados seguiu o ciclo de vida clássico de design relacional, dividido nas etapas descritas a seguir:

### 1. Modelagem Conceitual (DER)
Elaboração do **Diagrama Entidade-Relacionamento (DER)** para identificar as entidades do negócio, seus respectivos atributos (chaves e descritivos) e os relacionamentos essenciais.
* **Aplicação de Cardinalidade:** Definição precisa das restrições de participação e mapeamento das regras de negócio (relacionamentos 1:1, 1:N e N:M com criação de tabelas associativas).

### 2. Modelagem Lógica (MER)
Conversão do modelo conceitual para o **Modelo Entidade-Relacionamento (MER)**, adequando as estruturas para o paradigma relacional. 
* Mapeamento de chaves primárias (PK), chaves estrangeiras (FK) e definição dos tipos de dados adequados para cada atributo.

### 3. Processo de Normalização
Para garantir a consistência dos dados e evitar anomalias de inserção, atualização e deleção, a estrutura passou por um processo rigoroso de normalização, aplicando-se as seguintes regras:
* **Primeira Forma Normal (1FN):** Eliminação de atributos multivalorados e compostos, garantindo a atomicidade dos campos.
* **Segunda Forma Normal (2FN):** Verificação e garantia de que todos os atributos não-chave dependam funcionalmente da totalidade da chave primária (remoção de dependências parciais).
* **Terceira Forma Normal (3FN):** Remoção de dependências transitivas, assegurando que os atributos não-chave dependam exclusivamente da chave primária.

---

## Estrutura do Repositório

O projeto está organizado da seguinte forma:

```text
Banco_E_Market/
├── README.md               # Documentação técnica do projeto
├── modelagem/              # Diagramas visuais do banco de dados
│   ├── DER.png             # Diagrama Entidade-Relacionamento (Conceitual)
│   └── MER.png             # Modelo Entidade-Relacionamento (Lógico)
└── scripts/                # Código-fonte SQL
    └── e_market_dump.sql   # Script de criação de tabelas e carga inicial
