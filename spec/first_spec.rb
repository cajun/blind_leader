require File.expand_path( File.dirname(__FILE__)) + '/../lib/routing'
require 'minitest/autorun'
require 'minitest/spec'


describe Routing do
  
    describe 'methods' do

      it 'has "get_routes"' do
        Routing.new.must_respond_to :get_routes
      end

      it 'has "post_routes"' do
        Routing.new.must_respond_to :post_routes
      end

      it 'has "get"' do
        Routing.new.must_respond_to :get
      end

      it 'has "post"' do
        Routing.new.must_respond_to :post
      end

      it 'has "routes"' do
        Routing.new.must_respond_to :routes
      end

    end
    
    describe "routes" do
      before do
        @routing = Routing.new
        @response = lambda {"Hello World!"}
      end

      it 'declares a SINGLE route' do
        @routing.get '/', &@response
        @routing.routes.must_equal ({ :GET => {'/' => @response } })
      end

      it 'declares a MULTIPLE routes' do
        @routing.get '/', &@response
        @routing.get '/supermane', &@response

        @routing.routes.must_equal({
          :GET => {
            '/'          => @response,
            '/supermane' => @response
          }
        })
      end
      
      it 'should not have duplates' do
        assert_raises Routing::DuplicateRoute do
          @routing.get '/supermane' do
            @response
          end
          @routing.get '/supermane' do
            @response
          end
        end  
      end

      it 'should be able to POST and GET on the same route' do
        @routing.post '/supermane' , &@response
        @routing.get  '/supermane' , &@response
        
        @routing.routes.must_equal({
          :GET  => {'/supermane' => @response},
          :POST => {'/supermane' => @response}
        })
      end

    end

end
