module BlindLeader
  class Routing::Route < Proc
    attr_reader :klass, :route, :responce

    def initialize(verb = :get, route = nil, responce                     = nil, &block)
      @block     = block
      @klass     = block.call
      @route     = route
      @responce  = responce
      @action    = { route => responce } if route && responce
    end

    def get
     @action 
    end

    def post
     @action 
    end

    def put
    end

    def delete
    end

    def call
      @responce.call @klass
    end

  end
end


