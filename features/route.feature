Feature: Develeper can name a route
  As a pirate
  I want to name a route
  So that I return a path and booty

    Scenario Outline: Name a single route to X
    Given arrg ruby file containing:

      """
      Route({
        name:          <:name>         ,
        url:           <:url>          ,
        verb_handler:  <:verb_handler> ,
        view_handler:  <:view_handler>
      })
      """
      
    When I run this file
    Then "R#routes" will have the following routes
      | :name       | :url            | :verb_handler | :view_handler |
      | :superheros | /superheros     | SuperHeros     | BatView      |

    Examples:
      | :name       | :url            | :verb_handler | :view_handler |
      | :superheros | /superheros     | SuperHeros     | BatView      |
      | :the_one    | /superhero/:id  | SuperHero      | SpiderView   |

    Scenario: Naming a multiple routes to X
    Given arrg ruby file containing:

      """
      Route({
        name:          :superheros   ,
        url:           '/superheros' ,
        verb_handler:  SuperHeros    ,
        view_handler:  BatView
      })

      Route({
        name:          :the_one         ,
        url:           '/superhero/:id' ,
        verb_handler:  SuperHero        ,
        view_handler:  SpiderView
      })
      """
      
    When I run this file
    Then "R#routes" will have the following routes
      | name       | url            | verb_handler | view_handler |
      | superheros | /superheros    | SuperHeros   | BatView      |
      | the_one    | /superhero/:id | SuperHero    | SpiderView   |
