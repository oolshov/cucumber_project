Feature: Posts API

# Scenario 1
  @api
  Scenario: Listing posts

    Given I request jsonplaceholder /posts
    Then I expect response to have id 7

# Scenario 2
  @post_api
  Scenario: Create new post

    Given I send POST request /posts to jsonplaceholder with params:
    |   title   |    body    |user_id|
    | fake post | fake post  |   1   |

    Then I expect to get 201 Created status


    Scenario: Update post
    Given I send PUT request to jsonplaceholder /posts?id=101
    Then I expect to get 404 Not Found status

