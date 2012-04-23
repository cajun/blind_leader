module BlindLeader::Routing
  module_function

  # Listing of all the routes defined via the user
  #
  # @returns [Hash]
  def routes
    route.routes + redirect.routes
  end

  # List of the Normal routes
  #
  # @returns [Route]
  def route
    Route.instance
  end


  # List of the Redirect routes
  #
  # @returns [Redirect]
  def redirect
    Redirect.instance
  end


  # Delete all of the routes and redirects
  def clean_routes!
    route.clean_routes!
    redirect.clean_routes!
  end


  # Fetch the route for the given verb
  #
  # @returns [http verb]
  def verb_module env
    # return verb module for the route
  end


  # Fetch the route for the given view
  #
  # @returns [view]
  def view_module route
    # return view module for the route
  end

end

BlindLeader::R = BlindLeader::Routing
