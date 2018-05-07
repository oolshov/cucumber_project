Feature: Api Sample Request

  @feature
  Scenario: Sample Api Request

  Given I request jsonplaceholder with "/users"
  Then I expect response to have text "Romaguera-Crona"
