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
end

BlindLeader::R = BlindLeader::Routing

