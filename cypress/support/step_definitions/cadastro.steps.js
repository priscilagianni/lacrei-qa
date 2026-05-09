import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Given('que estou na pagina de cadastro', () => {
  cy.visit('/saude/paciente/cadastrar/');
  cy.get('input[name="firstName"]', { timeout: 10000 }).should('be.visible');
});

When('preencho o campo de email com {string}', (valor) => {
  // Preenche todos os campos obrigatórios para habilitar o botão
  const timestamp = Date.now();
  cy.get('input[name="firstName"]').clear().type('Maria Teste');
  cy.get('input[name="lastName"]').clear().type('Automatizado');
  cy.get('input[name="email"]').clear().type(valor);
  cy.get('input[name="email2"]').clear().type(valor);
  cy.get('input[name="password1"]').clear().type('Teste@1234');
  cy.get('input[name="password2"]').clear().type('Teste@1234');
  cy.get('input[name="acceptedPrivacyDocument"]').check({ force: true });
  cy.get('input[name="is18YearsOldOrMore"]').check({ force: true });
});

When('nao preencho nenhum campo', () => {
  // Não faz nada — verifica estado inicial
});

When('preencho o formulario completo com dados validos', () => {
  const timestamp = Date.now();
  const email = `priscila.teste+${timestamp}@gmail.com`;

  cy.get('input[name="firstName"]').clear().type('Maria Teste');
  cy.get('input[name="lastName"]').clear().type('Automatizado');
  cy.get('input[name="email"]').clear().type(email);
  cy.get('input[name="email2"]').clear().type(email);
  cy.get('input[name="password1"]').clear().type('Lacrei@2024');
  cy.get('input[name="password2"]').clear().type('Lacrei@2024');
});

When('aceito os termos de uso e privacidade', () => {
  cy.get('input[name="acceptedPrivacyDocument"]').check({ force: true });
  cy.get('input[name="is18YearsOldOrMore"]').check({ force: true });
});

When('clico no botao cadastrar', () => {
  cy.get('button[type="submit"]').click({ force: true });
});

Then('devo ver mensagem de erro de formato de email', () => {
  cy.contains('Por favor, utilize um formato de e-mail válido').should('be.visible');
});

Then('o botao de cadastro deve estar desabilitado', () => {
  cy.get('button[type="submit"]').should('be.disabled');
});

Then('devo ser redirecionada apos o cadastro', () => {
  cy.url({ timeout: 20000 }).should('include', '/verificando');
});