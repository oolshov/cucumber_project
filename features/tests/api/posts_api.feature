Feature: Posts API

# Scenario 1
  @api
  Scenario: Getting all posts posted by user with id 1

    Given I request jsonplaceholder /posts?userId=1
    Then I expect response to have id 7
    And Post with id 7 has title magnam facilis autem

# Scenario 2

  @post_api
  Scenario: Creating/updating/deleting new post

    Given I send post request jsonplaceholder /posts
    Then I expect to get 201 Created status
    Then I request jsonplaceholder /posts?id=101
    Then I send put request jsonplaceholder /posts?id=101
 #   Then I would like to delete this post
