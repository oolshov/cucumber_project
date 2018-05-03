Feature: Sample

  @feature @hello
  Scenario: Sample Scenario 1

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  @feature @important @skip
  Scenario: Sample Scenario 2

  Given I launch "http://www.google.com"
    And I fill-in search with "My First Cucumber Script"
  Then I should see "Your First Cucumber Script"

  @feature @failed
  Scenario: Sample scenario 3
  Given I launch "http://www.google.com"
  And I fill-in search with "guru99 cucumber"
  And I click on the first link in the results set
  Then I should see "Cucumber Testing Tutorials for Beginners"
