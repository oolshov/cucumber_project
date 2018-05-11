Feature: Comments API

  @api
  Scenario: Listing comments

    Given I request jsonplaceholder /comments
    Then I expect response to have postId 25
    And I expect to get 200 OK status
