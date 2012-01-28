module BlindLeader
  class Routing::Route < Proc
    attr_reader :klass, :get, :route, :action

    def initialize(route=nil, action=nil, &block)
      @block  = block
      @klass  = block.call
      @route  = route
      @action = action
      @get    = { route => action } if route && action
    end

    def post
    end

    def put
    end

    def delete
    end

    def call
      @action.call @klass
    end

  end
end


