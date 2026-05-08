Relatório de Responsividade — Lacrei Saúde

Ferramenta: Chrome DevTools — Device Toolbar
Ambiente: Staging — https://paciente-staging.lacreisaude.com.br

Data: 07/05/2026

## Cenários Testados

| Dispositivo / Resolução | Categoria | Resultado |
|------------------------|-----------|-----------|
| iPhone SE — 375px | Mobile | APROVADO |
| iPhone Pro Max — 430px | Mobile | APROVADO |
| Desktop — acima de 1024px | Desktop | APROVADO |

## Cenários de Validação — Mobile (até 600px)

| ID | Cenário | Status | Observação |
|----|---------|--------|-----------|
| RESP-001 | Layout adaptado corretamente | APROVADO | Sem quebra visual |
| RESP-002 | Botões e links funcionam corretamente | APROVADO | Navegação funcional |
| RESP-003 | Formulários funcionam corretamente | APROVADO | Campos utilizáveis |
| RESP-004 | Scroll vertical funciona corretamente | APROVADO | Sem problemas identificados |
| RESP-005 | Textos permanecem legíveis | AVISO | Fonte pequena em alguns elementos no iPhone Pro Max |

## Cenários de Validação — Desktop (>1024px)

| ID | Cenário | Status | Observação |
|----|---------|--------|-----------|
| RESP-006 | Layout ocupa corretamente o espaço disponível | APROVADO | Estrutura mantida corretamente |
| RESP-007 | Navegação e funcionalidades operam normalmente | APROVADO | Botões, links e formulários funcionais |
| RESP-008 | Usabilidade em telas amplas | APROVADO | Boa experiência visual |
| RESP-009 | Teste de redimensionamento de tela (stress visual) | APROVADO | Layout permaneceu estável ao reduzir e ampliar a janela |

## Bugs de Responsividade Encontrados

| ID | Descrição | Impacto |
|----|-----------|--------|
| RESP-BUG-001 | Fonte pequena em alguns elementos no iPhone Pro Max | Baixo |