Feature: Photos API

  Scenario: Getting photos from specific album

    Given I request jsonplaceholder /photos
    Then I expect response to have only photos from album 1
