import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

// ─── Navegação ────────────────────────────────────────────────────────────────

Given('que estou na página de cadastro', () => {
  cy.visit('/cadastro');
  cy.get('body').should('be.visible');
});

// ─── Ações ────────────────────────────────────────────────────────────────────

When('preencho o campo {string} com {string}', (campo, valor) => {
  // Tenta localizar por data-testid, name ou placeholder (nessa ordem)
  cy.get(
    `[data-testid="${campo}"], [name="${campo}"], input[placeholder*="${campo}" i]`
  )
    .first()
    .clear()
    .type(valor);
});

When('aceito os termos de uso', () => {
  cy.get('input[type="checkbox"]').first().check({ force: true });
});

When('clico em {string}', (texto) => {
  cy.contains('button', texto).click();
});

When('deixo todos os campos em branco', () => {
  // Não preenche nada — apenas garante que os campos estão vazios
  cy.get('input').each(($input) => {
    cy.wrap($input).clear();
  });
});

// ─── Asserções ────────────────────────────────────────────────────────────────

Then('devo ver a página de pós-cadastro', () => {
  // Ajustar a URL ou seletor conforme o comportamento real da aplicação
  cy.url().should('include', '/pos-cadastro');
});

Then('devo ver mensagem de erro de formato de e-mail', () => {
  cy.contains('Por favor, utilize um formato de e-mail válido').should('be.visible');
});

Then('o botão {string} deve estar desabilitado', (texto) => {
  cy.contains('button', texto).should('be.disabled');
});
