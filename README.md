# 🧪 QA — Lacrei Saúde | Desafio Técnico

Repositório de documentação e automação de testes para a plataforma **Lacrei Saúde** (ambiente de staging), cobrindo testes funcionais, acessibilidade, desempenho, responsividade e automação com CI/CD.

> **Ambiente de staging:** https://paciente-staging.lacreisaude.com.br

---

## 📁 Estrutura do Repositório

```
lacrei-qa/
├── .github/
│   └── workflows/
│       └── cypress.yml                        # Pipeline CI/CD (GitHub Actions)
├── cypress/
│   ├── e2e/
│   │   └── cadastro.feature                   # Cenário automatizado (Gherkin)
│   ├── support/
│   │   ├── commands.js                        # Comandos customizados do Cypress
│   │   └── step_definitions/
│   │       └── cadastro.steps.js              # Step definitions do cadastro
│   └── fixtures/
│       └── usuario.json                       # Dados de teste
├── docs/
│   ├── casos-de-teste/
│   │   ├── cadastro.feature                   # Cenários Gherkin — Cadastro
│   │   ├── busca-profissional.feature         # Cenários Gherkin — Busca
│   │   └── recuperacao-senha.feature          # Cenários Gherkin — Recuperação de senha
│   ├── bugs/
│   │   └── registro-de-bugs.md               # Registro de bugs encontrados
│   ├── acessibilidade/
│   │   └── relatorio-acessibilidade.md       # Relatório de acessibilidade
│   ├── desempenho/
│   │   ├── relatorio-desempenho.md           # Relatório de performance
│   │   └── load-test.js                      # Script k6 (30 usuários simultâneos)
│   └── responsividade/
│       └── relatorio-responsividade.md       # Relatório de responsividade
├── .env.example                               # Modelo de variáveis de ambiente
├── .gitignore
├── cypress.config.js
├── package.json
└── README.md
```

---

## ⚙️ Como Configurar o Ambiente de Testes

### Pré-requisitos

- [Node.js](https://nodejs.org/) >= 18.x
- npm >= 9.x
- Git
- Google Chrome (para rodar o Cypress localmente)

### Instalação

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/lacrei-qa.git
cd lacrei-qa

# 2. Instale as dependências
npm install

# 3. Configure as variáveis de ambiente
cp .env.example .env
# Edite o arquivo .env com seus dados de teste
```

---

## ▶️ Como Executar os Testes

### Testes Manuais

Os casos de teste manuais estão na pasta `/docs/casos-de-teste/` em formato Gherkin.
Execute-os seguindo os cenários descritos e preencha as tabelas de status nos relatórios correspondentes.

### Testes Automatizados — Cypress + Cucumber

```bash
# Abre a interface gráfica do Cypress (recomendado para desenvolvimento)
npm run cypress:open

# Executa todos os testes em modo headless
npm run cypress:run

# Executa apenas o fluxo de cadastro
npm run cypress:run:cadastro

# Executa em modo headless no Chrome
npm run cypress:run:headless
```

### Teste de Desempenho — Lighthouse

```bash
# Instalar o Lighthouse globalmente
npm install -g lighthouse

# Análise de performance e acessibilidade — página de login (mobile)
lighthouse https://paciente-staging.lacreisaude.com.br/login \
  --output html \
  --output-path ./docs/desempenho/lighthouse-login.html \
  --preset mobile
```

### Teste de Carga — k6 (30 usuários simultâneos)

```bash
# Instalar o k6 (macOS)
brew install k6

# Executar o script de carga
k6 run docs/desempenho/load-test.js
```

---

## 🗂️ Organização da Documentação

| Pasta / Arquivo | Conteúdo |
|---|---|
| `docs/casos-de-teste/` | Casos de teste em Gherkin para os 3 fluxos principais |
| `docs/bugs/` | Registro de bugs e melhorias encontrados durante os testes |
| `docs/acessibilidade/` | Relatório de acessibilidade com checklists e resultados do Lighthouse |
| `docs/desempenho/` | Relatório de performance, resultados do Lighthouse e script k6 |
| `docs/responsividade/` | Relatório de responsividade para mobile e desktop |
| `cypress/e2e/` | Cenários automatizados em Gherkin (Cucumber) |
| `cypress/support/step_definitions/` | Implementação dos steps do Cypress |
| `.github/workflows/` | Pipeline CI/CD configurado para rodar a cada commit e PR |

---

## 🔐 Checklist de Segurança

- [x] Nenhuma credencial real foi commitada no repositório
- [x] Variáveis sensíveis estão isoladas no arquivo `.env` (incluído no `.gitignore`)
- [x] Os testes são executados exclusivamente no ambiente de **staging**
- [x] Os dados de teste são fictícios e não comprometem informações reais
- [x] Links e tokens de recuperação de senha foram testados apenas com contas de teste
- [x] Nenhum dado pessoal de usuários reais foi coletado ou armazenado

---

## 🔄 Processo de Rollback dos Testes Automatizados

Caso um teste automatizado gere efeitos colaterais no ambiente de staging (por exemplo, criação de contas indesejadas), siga os passos abaixo:

**1. Identificar o problema**
Verifique o log de execução no GitHub Actions para localizar o teste problemático.

**2. Reverter o commit**
```bash
git revert <hash-do-commit>
git push origin main
```

**3. Desabilitar o step temporariamente no workflow**
```yaml
# Comentar o step problemático em .github/workflows/cypress.yml
# - name: 🧪 Executar testes Cypress (cadastro)
#   uses: cypress-io/github-action@v6
```

**4. Limpar os dados gerados pelo teste**
Acesse o painel de administração do staging e remova as contas ou registros criados automaticamente.

**5. Corrigir e reabrir o PR**
Após a correção local e validação manual, abra um novo PR com o fix.

---

## 📊 Relatórios de CI/CD

Os relatórios de execução (screenshots e vídeos) são gerados automaticamente pelo pipeline e armazenados como **artefatos do GitHub Actions** por 7 dias.

Para acessar: `Actions → [nome da execução] → Artifacts → cypress-results`

---

## 📋 Fluxos Testados

| Fluxo | Cenários | Arquivo |
|---|---|---|
| Cadastro de pessoa usuária | 7 cenários | `docs/casos-de-teste/cadastro.feature` |
| Busca de profissional de saúde | 11 cenários | `docs/casos-de-teste/busca-profissional.feature` |
| Recuperação de senha | 7 cenários | `docs/casos-de-teste/recuperacao-senha.feature` |
| Cadastro (automatizado) | 3 cenários | `cypress/e2e/cadastro.feature` |

---

## 🧰 Ferramentas Utilizadas

| Ferramenta | Finalidade |
|---|---|
| Gherkin / Cucumber | Casos de teste em linguagem natural |
| Cypress 13 | Automação de testes E2E |
| GitHub Actions | Pipeline CI/CD |
| Lighthouse CLI | Testes de performance e acessibilidade |
| k6 | Teste de carga (30 usuários simultâneos) |
| Chrome DevTools | Responsividade e inspeção |
| NVDA / VoiceOver | Testes com leitores de tela |
| Notion | Documentação complementar e registro de bugs |

---

## 📌 Referências

- [Documentação do Cypress](https://docs.cypress.io)
- [Badeball Cypress Cucumber Preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor)
- [Lighthouse CLI](https://github.com/GoogleChrome/lighthouse)
- [k6 — Documentação oficial](https://k6.io/docs/)
- [WCAG 2.1 — Critérios de acessibilidade](https://www.w3.org/TR/WCAG21/)
