class Routing
  DuplicateRoute = Class.new Exception
  VERBS = %w( GET POST PUT DELETE )

  VERBS.each do |verb|
    var_name = "@#{verb.downcase}".to_sym

    define_method "#{verb.downcase}_routes".to_sym do
      verb_routes = instance_variable_get var_name 

      verb_routes.nil? ? {} : { verb.upcase.to_sym => verb_routes }
    end
    
    define_method "#{verb.downcase}".to_sym do |route,&block|
      verb_routes = instance_variable_get var_name 
      verb_routes = instance_variable_set var_name, {} if verb_routes.nil?
      raise DuplicateRoute.new route if verb_routes[route]
      verb_routes[route] = block
    end
  end

  def routes
    get_routes.merge(post_routes).merge(put_routes).merge(delete_routes)
  end

end
