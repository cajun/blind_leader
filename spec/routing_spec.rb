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

      it 'has "put_routes"' do
        Routing.new.must_respond_to :put_routes
      end

      it 'has "get"' do
        Routing.new.must_respond_to :get
      end

      it 'has "post"' do
        Routing.new.must_respond_to :post
      end
      
      it 'has "put"' do
        Routing.new.must_respond_to :put
      end

      it 'has "routes"' do
        Routing.new.must_respond_to :routes
      end

      it 'has "resource"' do
        Routing.new.must_respond_to :resource
      end

    end
    
    describe "routes" do
      before do
        @routing = Routing.new
        @response = lambda {"Hello World!"}
      end

      it 'declares a SINGLE GET route' do
        @routing.get '/', &@response
        @routing.routes.must_equal ({ :GET => {'/' => @response } })
      end

      it 'declares a SINGLE POST route' do
        @routing.post '/', &@response
        @routing.routes.must_equal ({ :POST => {'/' => @response } })
      end

      it 'declares a SINGLE PUT route' do
        @routing.put '/', &@response
        @routing.routes.must_equal ({ :PUT => {'/' => @response } })
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
      
      it 'should not have duplates GET routes' do
        assert_raises Routing::DuplicateRoute do
          @routing.get '/supermane' do
            @response
          end
          @routing.get '/supermane' do
            @response
          end
        end  
      end

      it 'should not have duplates POST routes' do
        assert_raises Routing::DuplicateRoute do
          @routing.post '/batman' do
            @response
          end
          @routing.post '/batman' do
            @response
          end
        end  
      end


      it 'should not have duplates PUT routes' do
        assert_raises Routing::DuplicateRoute do
          @routing.put '/spiderman' do
            @response
          end
          @routing.put '/spiderman' do
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

      it 'should be able to POST, PUT, and GET on the same route' do
        @routing.post '/batman' , &@response
        @routing.get  '/batman' , &@response
        @routing.put  '/batman' , &@response
        
        @routing.routes.must_equal({
          :GET  => {'/batman' => @response},
          :POST => {'/batman' => @response},
          :PUT  => {'/batman' => @response}
        })
      end

    end
    
    describe 'resource' do

      before do
        @routing = Routing.new
        @response = lambda {"I HAVE THE POWER!!!!!!"}
      end

      it 'should be able to GET, POST, PUT, and DELETE as a REST resource' do
        @routing.resource '/he-man', &@response

        @routing.routes.must_equal({
          :GET    => {'/he-man'     => @response},
          :POST   => {'/he-man'     => @response},
          :GET    => {'/he-man/:id' => @response},
          :PUT    => {'/he-man/:id' => @response},
          :DELETE => {'/he-man/:id' => @response}
        })
      end
    end
end
