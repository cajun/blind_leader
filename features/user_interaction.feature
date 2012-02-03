Feature: Develeper can name a route
  As a codeer
  I want to name a route
  So that I return a path

    Scenario: Name a route
    Given I a file named "w00ts_are_bad_a$$.rb" with:

      Route :name, /superheros, SuperHeros, {json: lambda {|x|x.to_json}, html: lambda{|x| x.to_html}}
      Route :name, /superhero/:id, SuperHero, :json, :htmp, :pdf
      
      {
        path, manager, responder
      }

      <html>
        <a href= <%= @routes[:name].path(id: model.id) /%> />
      </html>

      (class|module) SuperHeros
        def get
          @heros = SuperHeros.all
        end
      end

      (class|module) SuperHero
        def get id
          @heros = SuperHeros.find id
        end
      end

    When I add a route
    Then I should have an array returned
