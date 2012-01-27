require File.expand_path( File.dirname(__FILE__)) + '/helper'

class Routing::Route
end

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

      it 'has "delete_routes"' do
        Routing.new.must_respond_to :delete_routes
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

      it 'has "delete"' do
        Routing.new.must_respond_to :delete
      end

      it 'has "routes"' do
        Routing.new.must_respond_to :routes
      end

    end
    
    describe "basic routing" do
      before do
        @routing = Routing.new
        @response = lambda {"Hello World!"}
      end
      
      it 'works with a Route object' do
        @routing.get '/', &@response
        route = @routing.routes[:GET]['/']
        assert_instance_of Routing::Route, route
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

      it 'declares a SINGLE DELETE route' do
        @routing.delete '/', &@response
        @routing.routes.must_equal ({ :DELETE => {'/' => @response } })
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

      it 'should not have duplates DELETE routes' do
        assert_raises Routing::DuplicateRoute do
          @routing.delete '/nightcrawler' do
            @response
          end
          @routing.delete '/nightcrawler' do
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

      it 'should be able to POST, PUT, DELETE, and GET on the same route' do
        @routing.post    '/batman' , &@response
        @routing.get     '/batman' , &@response
        @routing.put     '/batman' , &@response
        @routing.delete  '/batman' , &@response
        
        @routing.routes.must_equal({
          :GET    => {'/batman' => @response},
          :POST   => {'/batman' => @response},
          :PUT    => {'/batman' => @response},
          :DELETE => {'/batman' => @response}
        })
      end

    end
    
end
