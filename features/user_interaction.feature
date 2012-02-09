Feature: Develeper can name a route
  As a pirate
  I want to name a route
  So that I return a path and booty

    Scenario: Name a route to X
    Given arrg ruby file containing:

      """
      Route {
        name:          :superheros   ,
        url:           '/superheros' ,
        verb_handler:  SuperHeros    ,
        view_handler:  BatView
      }

      Route {
        name:          :the_one         ,
        url:           '/superhero/:id' ,
        verb_handler:  SuperHero        ,
        view_handler:  SpiderView
      }
      """
      
    When I run this file
    Then "R#routes" will have the following routes
      | name       | url            | data klass | view klass |
      | superheros | /superheros    | SuperHeros | BatView    |
      | the_one    | /superhero/:id | SuperHero  | SpiderView |
