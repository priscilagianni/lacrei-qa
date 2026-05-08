Relatório de Desempenho — Lacrei Saúde

Ferramenta: Lighthouse (Chrome DevTools)
Ambiente: Staging — https://paciente-staging.lacreisaude.com.br

Data: 07/05/2026

## Objetivo do Teste

Validar o desempenho das operações críticas da plataforma e analisar a experiência de carregamento sob cenário de uso simultâneo.

Cenário avaliado:

- Carregamento da página de Cadastro
- Carregamento da página de Busca de Profissional
- Simulação de carga com até 30 usuários simultâneos (via script k6 documentado)

## Resultados — Operações Críticas

| Página | Performance Score | FCP | LCP | Status |
|--------|------------------|-----|-----|--------|
| Cadastro | 39 | 2,6s | 8,8s | REPROVADO |
| Busca de Profissional | 41 | 2,6s | 10,1s | REPROVADO |

## Análise dos Resultados

### Principais problemas identificados:

- **LCP acima do esperado em ambas as páginas**
  - Impacta diretamente o carregamento do conteúdo principal
- **FCP acima da meta definida**
  - Atraso na primeira renderização visível
- **Performance Score abaixo do aceitável (< 70)**
  - Indica baixa eficiência geral de carregamento

## Critérios de referência do projeto

| Métrica | Valor |
|---------|-------|
| Performance Score | ≥ 70 |
| FCP | < 1,8s |
| LCP | < 2,5s |
| Tempo de resposta em operações críticas | < 500ms |

**Ambos os fluxos avaliados estão fora do padrão esperado**

## Estabilidade sob Carga (30 usuários simultâneos)

O teste de carga foi planejado utilizando o script k6 disponível em:

docs/desempenho/load-test.js

Execução não realizada em ambiente controlado devido à necessidade de infraestrutura dedicada.

## Métricas esperadas

| Métrica | Meta |
|---------|------|
| Tempo médio de resposta (Cadastro) | < 500ms |
| Tempo médio de resposta (Busca) | < 500ms |
| Taxa de erro | 0% |