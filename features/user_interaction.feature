Feature: Develeper can name a route
  As a codeer
  I want to name a route
  So that I return a path

    Scenario: Name a route
    Given I have a Routing Object
    When I add a route
    Then I should have an array returned
