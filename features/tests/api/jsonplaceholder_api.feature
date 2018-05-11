Feature: Api Sample Request

  @feature @api
  Scenario: Sample Api Request

    Given I request jsonplaceholder /users
    Then I expect response to have text Romaguera-Crona
