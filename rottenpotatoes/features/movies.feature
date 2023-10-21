Feature: Create movie
  As a user
  I want to create a new movie record

  Background:
    Given I am on the new movie page

  Scenario: User creates a new movie
    When I fill in "Title" with "New Movie"
    And I fill in "Director" with "John Doe"
    And I select "PG" from "movie_rating"
    And I select "2022" from "movie_release_date_1i"
    And I select "January" from "movie_release_date_2i"
    And I select "1" from "movie_release_date_3i" 
    And I press "Save Changes"
    Then I should be on the movies page
    And I should see "New Movie was successfully created."
    And I should see "New Movie"
  
