Feature: Sample

  @hello
  Scenario: Sample Scenario

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  @important @skip
  Scenario: Sample Scenario

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  