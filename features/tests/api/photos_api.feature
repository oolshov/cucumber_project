Feature: Photos API
  @api
  Scenario: Listing photos

    Given I request jsonplaceholder /photos?albumId=1
    Then I expect get only photos from album 1
