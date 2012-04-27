# The Runner class will take in the request and
# extend a new verb/view class with the module
# requested from the routing object. Once that
# is done the verb handle will be called with
# it's results being passed into the view class
# method. The view class is expected to return
# the body of the response
class BlindLeader::Application

  # Make the running Rack compatible
  #
  # @returns [Rack Array]
  def call env
    verb_data = verb_klass(env).send env['REQUEST_METHOD']
    view_hash = view_klass(env).send env['CONTENT_TYPE'], verb_data
    hash      = default_hash.merge view_hash

    [ hash[:status], hash[:headers], hash[:body] ]
  end


  # Default settings for the hash
  # cools stuff
  #
  # @returns [Hash]
  def default_hash
    {
      status:   200,
      headers:  'Content-Type: text/html',
      body:     ['Chunky Bacon']
    }
  end


  # Shortcut access to the routes that have been
  # defined
  #
  # @returns BlindLeader::Routing
  def routes
    BlindLeader::Routing.instance
  end


  # Verb klass for this route
  #
  # @returns [Module Extended Object]
  def verb_klass env
    BasicObject.new.extend routes.verb_module(env)
  end


  # View klass for this route
  #
  # @returns [Module Extended Object]
  def view_klass env
    BasicObject.new.extend routes.view_module(env)
  end

end

