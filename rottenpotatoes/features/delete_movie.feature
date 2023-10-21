Feature: Delete a movie
  As a user
  I want to delete a movie record
  Scenario: User deletes a movie from the details page
    Given the following movies exist:
      | title        | rating | director     | release_date |
      | Test Movie 1 | PG     | Director One | 2022-01-01   |
      | Test Movie 2 | R      | Director Two | 2022-01-02   |
    And I am on the details page for movie titled "Test Movie 1"
    When I click "Delete"
    Then I should not see "Test Movie 1" in the movies list