# The route will manage the connection of a url,
# common name to call that url, an object to
# handle the verb, and an object to handle the
# view. Because the app only has a single set of
# routes it will be a singleton object until that
# needs to change.
#
# The route has a name.  This name will be the name
# that is used throughout the application.
#
#        name:  :the_one         ,
#        url:   '/superhero/:id' ,
#        verb:  SuperHero        ,
#        view:  SpiderView
class BlindLeader::Routing::Route
  include Singleton

  attr_reader :routes

  def draw opts
    @routes ||=[]
    @routes << opts
    update_lookup opts
    opts
  end


  def clean_routes!
    @routes = []
  end

  # Take in the URL and add it to a quick lookup hash
  #
  # @returns [Hash]
  def update_lookup opts
    @lookup ||={}
    parts = opts[:url].split /\//

    parts.inject(@lookup) do |hash,part|
      hash[part] ||= {}
      hash[part] = opts if parts.last == part
      hash[part]
    end

    @lookup
  end

  def lookup url
    parts = url.split /\//

  end

end
