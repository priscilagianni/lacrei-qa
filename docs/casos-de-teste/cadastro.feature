# language: pt

Feature: Cadastro de pessoa usuária
  Como uma pessoa usuária nova
  Quero me cadastrar na plataforma Lacrei Saúde
  Para acessar os serviços de saúde disponíveis

  Background:
    Given que estou na página de login da Lacrei Saúde
    And não possuo uma conta cadastrada

  Scenario: Cadastro com dados válidos
    When acesso a opção "Criar conta"
    And preencho o campo "Nome completo" com "Jonino Silva"
    And preencho o campo "E-mail" com "jonino8133@anawebs.com"
    And preencho o campo "Senha" com "Teste1234@"
    And preencho o campo "Confirmar senha" com "Teste1234@"
    And aceito os termos de uso e política de privacidade
    And clico em "Cadastrar"
    Then devo ver uma mensagem de confirmação de cadastro
    And devo ser redirecionada para a página de pós-cadastro

  Scenario: Cadastro com e-mail já existente
    When acesso a opção "Criar conta"
    And preencho o campo "E-mail" com um e-mail já cadastrado
    And preencho os demais campos corretamente
    And clico em "Cadastrar"
    Then devo ver a mensagem "Já existe um usuário cadastrado com este endereço de e-mail."
    And devo permanecer na página de cadastro

  Scenario: Cadastro com senha fraca
    When acesso a opção "Criar conta"
    And preencho o campo "Senha" com "123456"
    And clico em "Cadastrar"
    Then devo ver a mensagem de requisitos de senha:
      """
      A senha deve conter, no mínimo:
      8 caracteres ou mais
      1 letra maiúscula ou mais
      1 letra minúscula ou mais
      1 número ou mais
      1 caractere especial ou mais (ex: #!*-_&)
      """
    And o cadastro não deve ser concluído

  Scenario: Cadastro com campos obrigatórios em branco
    When acesso a opção "Criar conta"
    And deixo os campos obrigatórios em branco
    Then o botão "Cadastrar" deve permanecer desabilitado
    And o cadastro não deve ser concluído

  Scenario: Cadastro com e-mail em formato inválido
    When acesso a opção "Criar conta"
    And preencho o campo "E-mail" com "emailinvalido"
    And clico em "Cadastrar"
    Then devo ver a mensagem "Por favor, utilize um formato de e-mail válido. Por exemplo: email@dominio.com.br."

  Scenario: Pós-cadastro — completar perfil
    Given que acabei de realizar o cadastro com sucesso
    When estou na página de pós-cadastro
    And preencho as informações complementares do perfil
    And clico em "Salvar"
    Then meu perfil deve ser salvo com sucesso
    And devo ser redirecionada para a busca de profissional

  Scenario: Pós-cadastro — buscar profissional após cadastro
    Given que completei meu perfil no pós-cadastro
    When sou redirecionada para a busca de profissional
    Then devo ver a interface de busca de profissionais de saúde
    And devo conseguir visualizar profissionais disponíveis
