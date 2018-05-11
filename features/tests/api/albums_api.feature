Feature: Albums API

  @api
  Scenario: Listing albums

    Given I request jsonplaceholder /albums
    Then I expect response to have userId 5
    And I expect response message OK

