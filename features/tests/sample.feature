Feature: Sample

  @hello
  Scenario: Sample Scenario 1

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  @important @skip
  Scenario: Sample Scenario 2

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  
