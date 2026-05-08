# language: pt

Feature: Recuperação de senha
  Como uma pessoa usuária cadastrada
  Quero recuperar minha senha
  Para acessar a plataforma caso tenha esquecido minhas credenciais

  Background:
    Given que estou na página de login da Lacrei Saúde

  Scenario: Solicitar recuperação de senha com e-mail válido
    When clico em "Esqueci minha senha"
    And preencho o campo de e-mail com "jonino8133@anawebs.com"
    And clico em "Enviar"
    Then devo ver uma mensagem de confirmação informando que o e-mail foi enviado
    And devo receber um e-mail com o link de redefinição de senha

  Scenario: Solicitar recuperação com e-mail não cadastrado
    When clico em "Esqueci minha senha"
    And preencho o campo de e-mail com "naocadastrado@teste.com"
    And clico em "Enviar"
    Then devo ver a mensagem "Os dados enviados são inválidos."

  Scenario: Solicitar recuperação com campo de e-mail vazio
    When clico em "Esqueci minha senha"
    And deixo o campo de e-mail em branco
    And clico em "Enviar"
    Then devo ver a mensagem "Este campo é obrigatório."

  Scenario: Solicitar recuperação com e-mail em formato inválido
    When clico em "Esqueci minha senha"
    And preencho o campo de e-mail com "emailsemformato"
    And clico em "Enviar"
    Then devo ver a mensagem "Por favor, utilize um formato de e-mail válido. Por exemplo: email@dominio.com.br."

  Scenario: Redefinir senha com link válido
    Given que recebi o link de redefinição de senha por e-mail
    When acesso o link recebido
    And preencho o campo "Nova senha" com "NovaSenha@456"
    And preencho o campo "Confirmar nova senha" com "NovaSenha@456"
    And clico em "Redefinir senha"
    Then minha senha deve ser atualizada com sucesso
    And devo ser redirecionada para a página de login
    And devo conseguir fazer login com a nova senha

  Scenario: Redefinir senha com senhas diferentes
    Given que acessei o link de redefinição de senha
    When preencho "Nova senha" com "NovaSenha@456"
    And preencho "Confirmar nova senha" com "SenhaDiferente@789"
    And clico em "Redefinir senha"
    Then devo ver a mensagem "Senhas incompatíveis, tente novamente."
    And a senha não deve ser alterada

  Scenario: Tentar usar link de recuperação expirado
    Given que recebi um link de redefinição de senha há mais de 24 horas
    When acesso o link expirado
    Then devo ver uma mensagem informando que o link expirou
    And devo ser orientada a solicitar um novo link de recuperação
