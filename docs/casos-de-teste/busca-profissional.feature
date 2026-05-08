# language: pt

Feature: Busca de profissional de saúde
  Como uma pessoa usuária autenticada
  Quero buscar profissionais de saúde na plataforma
  Para encontrar atendimento adequado às minhas necessidades

  Background:
    Given que estou autenticada na plataforma Lacrei Saúde
    And estou na página de busca de profissionais

  Scenario: Busca por especialidade
    When seleciono a especialidade "Psicologia"
    And clico em "Pesquisar"
    Then devo ver uma lista de profissionais da especialidade selecionada
    And cada resultado deve exibir nome, especialidade e informações de contato

  Scenario: Busca sem informar especialidade ou filtros
    Given que estou na tela de busca de profissionais
    When clico em "Pesquisar" sem preencher nenhum campo
    Then devo ver uma lista de todos os profissionais disponíveis
    And cada resultado deve exibir nome, especialidade e informações de contato

  Scenario: Busca sem resultados encontrados
    Given que estou na tela de busca de profissionais
    When seleciono a especialidade "Fisioterapia"
    And clico em "Pesquisar"
    Then devo ver a mensagem "Não encontramos profissionais para sua busca"
    And devo ver sugestões para ampliar a busca

  Scenario: Busca por termo sem resultados
    Given que estou na tela de busca de profissionais
    When preencho o campo de busca com "Recife-PE"
    And clico em "Pesquisar"
    Then devo ver a mensagem "Não encontramos o que você procura."
    And nenhum resultado de profissional deve ser exibido

  Scenario: Visualizar perfil de profissional
    When vejo um profissional na lista de resultados
    And clico no nome ou perfil do profissional
    Then devo ser redirecionada para a página de detalhes do profissional
    And devo visualizar informações como nome, dados do profissional e opção de agendar consulta

  Scenario: Agendar consulta a partir do perfil do profissional
    Given que estou na página de detalhes de um profissional
    When clico em "Agendar consulta"
    Then devo ser direcionada para o formulário de agendamento
    And devo visualizar os campos necessários para agendar a consulta

  Scenario: Realizar agendamento com sucesso
    Given que estou na página de detalhes do profissional
    When clico em "Agendar consulta"
    And informo meu número de celular válido
    And recebo e insiro o código SMS corretamente
    And confirmo o agendamento
    Then devo ver a confirmação de agendamento realizado com sucesso

  Scenario: Enviar código de verificação por SMS
    Given que estou na tela de agendamento
    When informo meu número de celular válido
    And clico em "Enviar código"
    Then devo receber um código por SMS

  Scenario: Código SMS inválido
    Given que recebi um código por SMS
    When insiro um código incorreto
    And clico em "Confirmar"
    Then devo ver uma mensagem de erro informando que o código é inválido
    And não devo avançar no agendamento

  Scenario: Número de celular inválido
    Given que estou na tela de agendamento
    When informo um número de celular inválido
    And clico em "Enviar código"
    Then devo ver uma mensagem de erro

  Scenario: Número de celular em branco
    Given que estou na tela de agendamento de consulta
    When deixo o campo de celular em branco
    And clico em "Enviar código"
    Then devo ver a mensagem "Este campo é obrigatório."
    And o código não deve ser enviado
