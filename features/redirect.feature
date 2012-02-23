Feature: Develeper can create an alias
  As a pirate
  I want to have some aliases
  So that I return a path (and booty) and get another path

    Scenario: Name a path to X I should get Y
    Given arrg ruby file containing:

      """
      Redirect({
        name:  :superheros,
        from:  '/superheros',
        to:    '/justice_league'
      })

      Redirect({
        name:  :superhero,
        from:  '/superhero/:id',
        to:    '/batman?OID=:id'
      })

      """
      
    When I run this file
    Then "R#routes" will have the following routes
      | name       | from           | to              |
      | superheros | /superheros    | /justice_league |
      | superhero  | /superhero/:id | /batman?OID=:id |



