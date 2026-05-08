Relatório de Acessibilidade — Lacrei Saúde

Ferramentas: Lighthouse + Chrome DevTools + NVDA
Ambiente: Staging — https://paciente-staging.lacreisaude.com.br

Data: 07/05/2026

## Resultados por Página

| Página | Score Lighthouse | Observações |
|--------|-----------------|-----------|
| Login | 96 | Acessibilidade dentro do padrão recomendado |
| Cadastro | 90 | No limite mínimo recomendado (WCAG AA) |
| Busca de Profissional | 96 | Acessibilidade dentro do padrão recomendado |
| Pós-cadastro | — | Não testado |

## Navegação via Teclado

| Item verificado | Status | Observação |
|-----------------|--------|-----------|
| Tab navega por todos os elementos interativos | APROVADO | Navegação completa validada |
| Foco visível em todos os elementos | APROVADO | Contorno de foco visível durante toda a navegação |
| Shift + Tab retorna corretamente | APROVADO | Navegação reversa funcional |
| Enter ativa botões e links | APROVADO | Interações executadas corretamente |
| Navegação sem uso do mouse | APROVADO | Fluxo completo percorrido via teclado |
| Ordem de foco lógica e sequencial | APROVADO | Sequência de navegação segue o fluxo esperado |

## Leitor de Tela (NVDA)

NVDA (NonVisual Desktop Access)

| Item verificado | Status | Observação |
|-----------------|--------|-----------|
| Página é anunciada corretamente pelo leitor | APROVADO | NVDA realizou leitura completa da página |
| Botões possuem nomes acessíveis | APROVADO | Botão "Entrar" identificado corretamente |
| Campos de formulário são anunciados corretamente | APROVADO | Inputs identificados corretamente pelo leitor |
| Ordem de leitura é lógica | APROVADO | Navegação compreensível durante a leitura |

## Melhorias Propostas

| # | Sugestão |
|---|----------|
| 1 | Validar acessibilidade das páginas ainda não testadas |
| 2 | Expandir testes com leitor de tela em fluxos completos |
| 3 | Validar mensagens de erro e feedback visual |