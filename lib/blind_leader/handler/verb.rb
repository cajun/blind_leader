module BlindLeader::Handler
  # The Verb will be called depending on the verb
  # used in the request.  If the Verb is not overridden
  # it will raise a NotImplemented exception
  class Verb

    NotImplemented = Class.new Exception

    def call env
      # call the requested verb here
    end

    # A catch all if a requested method was passed in
    # and on was not implemented.
    def method_missing method, *args
      raise NotImplemented.new "HTTP verb: '#{method}' not Implemented"
    end

  end
end
