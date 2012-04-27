Feature: Developer can name a route
  As a pirate
  I want to name a route
  So that I return a path and booty

    Scenario Outline: Name a single route to X
    Given arrg ruby file containing:

      """
      router = BlindLeader::Routing::Route.instance
      router.draw({
        name:  <name>         ,
        url:   '<url>'        ,
        verb:  <verb_handler> ,
        view:  <view_handler>
      })
      """

    When I run this file
    Then I should see the following routes
      | name    | url   | verb_handler   | view_handler   |
      | <name>  | <url> | <verb_handler> | <view_handler> |

    Examples:
      | name        | url             | verb_handler | view_handler |
      | :superheros | /superheros     | SuperHeros   | BatView      |
      | :the_one    | /superhero/:id  | SuperHero    | SpiderView   |

    Scenario: Naming a multiple routes to X
    Given arrg ruby file containing:

      """
      router = BlindLeader::Routing::Route.instance
      router.draw({
        name:  :superheros   ,
        url:   '/superheros' ,
        verb:  SuperHeros    ,
        view:  BatView
      })

      router = BL::R::Route.instance
      router.draw({
        name:  :the_one         ,
        url:   '/superhero/:id' ,
        verb:  SuperHero        ,
        view:  SpiderView
      })
      """

    When I run this file
    Then I should see all of the following routes
      | name       | url            | verb         | view         |
      | superheros | /superheros    | SuperHeros   | BatView      |
      | the_one    | /superhero/:id | SuperHero    | SpiderView   |
