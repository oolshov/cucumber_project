Feature: Posts API

  @api_posts
  Scenario: Getting all available posts

    Given I request jsonplaceholder /posts
    Then I expect response to have id 25
    And Post with id 25 has title rem alias distinctio quo quis
