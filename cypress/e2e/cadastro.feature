Set-Content -Path "cypress\e2e\cadastro.feature" -Encoding UTF8 -Value @"
Feature: Cadastro de pessoa usuária (automatizado)
  Como uma pessoa usuária nova
  Quero me cadastrar na plataforma Lacrei Saúde
  Para acessar os serviços de saúde disponíveis

  Scenario: Cadastro com dados válidos
    Given que estou na página de cadastro
    When preencho o campo "nome" com "Maria Teste"
    And preencho o campo "email" com "maria.teste.lacrei@mailinator.com"
    And preencho o campo "senha" com "Teste@1234"
    And preencho o campo "confirmar senha" com "Teste@1234"
    And aceito os termos de uso
    And clico em "Cadastrar"
    Then devo ver a página de pós-cadastro

  Scenario: Cadastro com e-mail em formato inválido
    Given que estou na página de cadastro
    When preencho o campo "email" com "emailinvalido"
    And clico em "Cadastrar"
    Then devo ver mensagem de erro de formato de e-mail

  Scenario: Cadastro com campos obrigatórios em branco
    Given que estou na página de cadastro
    When deixo todos os campos em branco
    Then o botão "Cadastrar" deve estar desabilitado.