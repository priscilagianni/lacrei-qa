QA — Lacrei Saúde | Desafio Técnico

Repositório de documentação e automação de testes para a plataforma Lacrei Saúde (ambiente de staging), cobrindo testes funcionais, acessibilidade, desempenho, responsividade e automação com CI/CD.

Ambiente de staging: https://paciente-staging.lacreisaude.com.br

## Arquitetura de documentação (importante)

Este projeto segue uma divisão profissional de QA entre três camadas:

### GitHub Wiki (documentação técnica oficial)

Utilizada como base principal de documentação estruturada.

O padrão interno para identificação de casos de teste é **CT**, não TC.

Contém:

- Casos de teste em Gherkin
- Estratégia de testes
- Relatórios técnicos (performance, acessibilidade, etc.)
- Padrões de automação

### GitHub Issues (gestão de bugs)

Utilizadas para:

- Registro de bugs encontrados durante testes
- Issues de performance e UX
- Acompanhamento de correções
- Evidências técnicas (prints, vídeos, logs)

### Notion (gestão de QA e acompanhamento)

Utilizado como ferramenta complementar para organização visual e acompanhamento de testes.

Contém:

- Registro estruturado de bugs e melhorias
- Classificação por tipo (Bug / Performance / UX / Melhoria)
- Severidade (Baixa / Média / Alta / Crítica)
- Evidências (prints e vídeos)
- Status de execução (Aberto / Em análise / Resolvido)
- Visão geral do progresso de testes

## Estrutura do Repositório

```
lacrei-qa/
├── .github/
│   └── workflows/
│       └── cypress.yml
├── cypress/
│   ├── e2e/
│   │   └── cadastro.feature
│   ├── fixtures/
│   │   └── usuario.json
│   └── support/
│       ├── commands.js
│       └── step_definitions/
│           └── cadastro.steps.js
├── docs/
│   ├── acessibilidade/
│   │   └── relatorio-acessibilidade.md
│   ├── casos-de-teste/
│   │   ├── busca-profissional.feature
│   │   ├── cadastro.feature
│   │   └── recuperacao-senha.feature
│   ├── desempenho/
│   │   ├── load-test.js
│   │   └── relatorio-desempenho.md
│   └── responsividade/
│       └── relatorio-responsividade.md
├── .env.example
├── .gitignore
├── cypress.config.js
├── package.json
├── package-lock.json
└── README.md
```

## Como Configurar o Ambiente de Testes

A documentação completa de configuração está no [GitHub Wiki](https://github.com/priscilagianni/lacrei-qa/wiki), incluindo páginas como:
- Home
- Sobre o Projeto
- Navegação do Wiki
- Fluxos Testados
- Ferramentas Utilizadas
- Casos de teste
- Casos de teste detalhados
- Resultados dos Testes

## Como Executar os Testes

O guia de execução também está disponível no [GitHub Wiki](https://github.com/priscilagianni/lacrei-qa/wiki).

## Organização da Documentação

| Local | Finalidade |
|-------|-----------|
| [GitHub Wiki](https://github.com/priscilagianni/lacrei-qa/wiki) | Documentação técnica oficial do projeto, incluindo casos de teste |
| [GitHub Issues](https://github.com/priscilagianni/lacrei-qa/issues) | Registro e acompanhamento de bugs |
| [Notion](https://www.notion.so/Lacrei-Sa-de-QA-35afa24bd77b80128fc8f76fd51a7967?source=copy_link) | Gestão visual de QA (bugs, status e evidências) |
| /docs | Relatórios técnicos versionados no repositório |

## Boas Práticas Aplicadas

- Separação clara entre documentação, bugs e gestão de QA
- Uso de Wiki como fonte oficial de documentação técnica
- Issues para rastreabilidade de defeitos
- Notion como apoio visual de organização QA
- CI/CD automatizado com Cypress + GitHub Actions

## Ferramentas Utilizadas

| Ferramenta | Finalidade |
|-----------|-----------|
| Gherkin / Cucumber | Casos de teste |
| Cypress | Automação E2E |
| GitHub Actions | CI/CD |
| Lighthouse | Performance e acessibilidade |
| k6 | Teste de carga |
| Notion | Gestão de QA |
| GitHub Wiki | Documentação técnica |
| GitHub Issues | Rastreamento de bugs |