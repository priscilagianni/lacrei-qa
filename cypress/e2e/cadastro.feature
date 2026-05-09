Feature: Cadastro

Scenario: Cadastro válido
  Given que estou na pagina de cadastro
  When preencho o formulario completo com dados validos
  And aceito os termos de uso e privacidade
  And clico no botao cadastrar
  Then devo ser redirecionada apos o cadastro

Scenario: Cadastro com e-mail inválido
  Given que estou na pagina de cadastro
  When preencho o campo de email com "emailinvalido"
  And clico no botao cadastrar
  Then o botao de cadastro deve estar desabilitado

Scenario: Campos obrigatórios em branco
  Given que estou na pagina de cadastro
  When nao preencho nenhum campo
  Then o botao de cadastro deve estar desabilitado