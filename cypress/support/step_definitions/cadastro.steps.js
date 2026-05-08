import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Given('que estou na página de cadastro', () => {
  cy.visit('/saude/paciente/cadastrar/');
  cy.get('body').should('be.visible');
});

When('preencho o campo {string} com {string}', (campo, valor) => {
  const mapa = {
    'nome': '[name="firstName"],[name="name"],[name="fullName"],[placeholder*="nome" i]',
    'email': '[name="email"],[type="email"]:first',
    'confirmar email': '[name="confirmEmail"],[name="emailConfirmation"],[type="email"]:last',
    'senha': '[name="password"],[type="password"]:first',
    'confirmar senha': '[name="confirmPassword"],[name="passwordConfirmation"],[type="password"]:last',
  };
  const seletor = mapa[campo.toLowerCase()] || `[name="${campo}"]`;
  cy.get(seletor).first().clear().type(valor);
});

When('aceito os termos de uso', () => {
  cy.get('input[type="checkbox"]').each(($checkbox) => {
    cy.wrap($checkbox).check({ force: true });
  });
});

When('clico em {string}', (texto) => {
  cy.contains('button', texto).click({ force: true });
});

When('deixo todos os campos em branco', () => {
  cy.get('input[type="text"], input[type="email"], input[type="password"]').each(($input) => {
    cy.wrap($input).clear();
  });
});

Then('devo ver a página de pós-cadastro', () => {
  cy.url().should('include', '/pos-cadastro');
});

Then('devo ver mensagem de erro de formato de e-mail', () => {
  cy.contains('Por favor, utilize um formato de e-mail válido').should('be.visible');
});

Then('o botão {string} deve estar desabilitado', (texto) => {
  cy.contains('button', texto).should('be.disabled');
});