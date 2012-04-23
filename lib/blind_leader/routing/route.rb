# The route will manage the connection of a url,
# common name to call that url, an object to
# handle the verb, and an object to handle the
# view. Because the app only has a single set of
# routes it will be a singleton object until that
# needs to change.
class BlindLeader::Routing::Route
  include Singleton

  attr_reader :routes

  def draw opts
    @routes ||=[]
    @routes << opts
    opts
  end

  def clean_routes!
    @routes = []
  end

end
