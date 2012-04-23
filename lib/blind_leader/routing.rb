module BlindLeader::Routing
  module_function

  def routes
    route.routes + redirect.routes
  end

  def route
    Route.instance
  end

  def redirect
    Redirect.instance
  end

  def clean_routes!
    route.clean_routes!
    redirect.clean_routes!
  end

  def verb_module route
    # return verb module for the route
  end

  def view_module route
    # return view module for the route
  end
end

BlindLeader::R = BlindLeader::Routing
