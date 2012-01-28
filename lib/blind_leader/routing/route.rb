module BlindLeader
  class Routing::Route < Proc
    attr_reader :klass, :get

    def initialize(route=nil, action=nil, &block)
      @klass = block.call
      @get = { route => action } if route && action
    end

    def post
    end

    def put
    end

    def delete
    end

  end
end


