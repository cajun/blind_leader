module BlindLeader
  class Routing::Route < Proc
    attr_reader :klass, :route, :responce
    attr_reader :get, :put, :post, :delete

    def initialize(verb = :get, route = nil, responce = nil, &block)
      @block     = block
      @klass     = block.call
      @route     = route
      @responce  = responce

      instance_variable_set "@#{verb}".to_sym, { route => responce } if route && responce
    end

    def call
      @responce.call @klass
    end

  end
end


