module BlindLeader
  class Routing::Route < Proc
    attr_reader :klass

    def initialize &block
      @klass = block.call
    end


    def get
    end

    def post
    end

    def put
    end

    def delete
    end

  end
end


