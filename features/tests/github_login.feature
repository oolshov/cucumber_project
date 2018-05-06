Feature: Github Login
@github
Scenario Outline: Login to Github with different accounts
  Given I launch "https://github.com/login"
  When I enter <username> and <password>
  And Click on Sign in button
  Then I should see "Incorrect username or password." warning message

  Examples:
    | username |   password   |
    | okaruk     |   8ZfkqwWW>xMH  |


