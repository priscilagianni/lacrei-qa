// Comandos customizados do Cypress — Lacrei Saúde QA

/**
 * Realiza login na plataforma de staging.
 * Uso: cy.login('email@teste.com', 'Senha@123')
 */
Cypress.Commands.add('login', (email, senha) => {
  cy.visit('/login');
  cy.get('input[type="email"], [name="email"]').first().clear().type(email);
  cy.get('input[type="password"], [name="password"]').first().clear().type(senha);
  cy.contains('button', 'Entrar').click();
  cy.url().should('not.include', '/login');
});

/**
 * Navega para a página de cadastro.
 * Uso: cy.irParaCadastro()
 */
Cypress.Commands.add('irParaCadastro', () => {
  cy.visit('/cadastro');
});
