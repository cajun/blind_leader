# The Runner class will take in the request and
# extend a new verb/view class with the module
# requested from the routing object. Once that
# is done the verb handle will be called with
# it's results being passed into the view class
# method. The view class is expected to return
# the body of the the response
class BlindLeader::Runner

  # Make the running Rack compatiable
  #
  # @returns [Array]
  def call env
    data   = verb_klass.call env
    body   = view_klass.call env, data
    [ 200, {'Content-Type' => 'text/html'}, [ env['REQUEST_METHOD'] ]]
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
  # @returns [BlindLeader::Handler::Verb]
  def verb_klass
    klass = BlindLeader::Handler::Verb.new
    klass.extend routes.verb_module @env
    klass
  end


  # View klass for this route
  #
  # @returns [BlindLeader::Handler::View]
  def view_klass
    klass = BlindLeader::Handler::View.new
    klass.extend routes.view_module @env
    klass
  end

end

