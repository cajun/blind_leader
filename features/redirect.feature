@wip
Feature: Develeper can create an alias
  As a pirate
  I want to have some aliases
  So that I return a path (and booty) and get another path

    Scenario Outline: Name a path to X I should get Y
    Given arrg ruby file containing:

      """
      router = BlindLeader::Routing::Redirect.instance
      router.draw({
        name:  <name>,
        from:  '<from>',
        to:    '<to>'
      })
      """

    When I run this file
    Then I should see the following routes
      | name    | from   | to   |
      | <name>  | <from> | <to> |

    Examples:
      | name        | from           | to              |
      | :superheros | /superheros    | /justice_league |
      | :superhero  | /superhero/:id | /batman?OID=:id |


    Scenario: Name a path to X I should get Y
    Given arrg ruby file containing:

      """
      router = BlindLeader::Routing::Redirect.instance
      router.draw({
        name:  :superheros,
        from:  '/superheros',
        to:    '/justice_league'
      })

      router = BL::R::Redirect.instance
      router.draw({
        name:  :superhero,
        from:  '/superhero/:id',
        to:    '/batman?OID=:id'
      })

      """
    When I run this file
    Then I should see the following routes
      | name       | from           | to              |
      | superheros | /superheros    | /justice_league |
      | superhero  | /superhero/:id | /batman?OID=:id |
