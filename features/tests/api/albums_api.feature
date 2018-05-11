Feature: Albums API

  @api
  Scenario: Getting all albums

    Given I request jsonplaceholder /albums
    Then I expect response to have userId 5
    And I expect response to have response message OK

