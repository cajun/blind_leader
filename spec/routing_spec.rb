require 'helper'

describe 'Routing' do
  
    describe 'Methods' do
      subject { BlindLeader::Routing.new }

      it 'has "get_routes"' do
        subject.must_respond_to :get_routes
      end

      it 'has "post_routes"' do
        subject.must_respond_to :post_routes
      end

      it 'has "put_routes"' do
        subject.must_respond_to :put_routes
      end

      it 'has "delete_routes"' do
        subject.must_respond_to :delete_routes
      end

      it 'has "get"' do
        subject.must_respond_to :get
      end

      it 'has "post"' do
        subject.must_respond_to :post
      end
      
      it 'has "put"' do
        subject.must_respond_to :put
      end

      it 'has "delete"' do
        subject.must_respond_to :delete
      end

      it 'has "routes"' do
        subject.must_respond_to :routes
      end

    end
    
    describe "Basic::Routing" do
      subject {BlindLeader::Routing.new}
      before do
        @response = lambda {"Hello World!"}
      end
      
      it 'works with a Route object' do
        subject.get '/', &@response
        route = subject.routes[:GET]['/']
        assert_instance_of BlindLeader::Routing::Route, route
      end

      it 'declares a SINGLE GET route' do
        subject.get '/', &@response
        subject.routes.must_equal ({ :GET => {'/' => @response } })
      end

      it 'declares a SINGLE POST route' do
        subject.post '/', &@response
        subject.routes.must_equal ({ :POST => {'/' => @response } })
      end

      it 'declares a SINGLE PUT route' do
        subject.put '/', &@response
        subject.routes.must_equal ({ :PUT => {'/' => @response } })
      end

      it 'declares a SINGLE DELETE route' do
        subject.delete '/', &@response
        subject.routes.must_equal ({ :DELETE => {'/' => @response } })
      end

      it 'declares a MULTIPLE routes' do
        subject.get '/', &@response
        subject.get '/supermane', &@response

        subject.routes.must_equal({
          :GET => {
            '/'          => @response,
            '/supermane' => @response
          }
        })
      end
      
      it 'should not have duplates GET routes' do
        assert_raises BlindLeader::Routing::DuplicateRoute do
          subject.get '/supermane' do
            @response
          end
          subject.get '/supermane' do
            @response
          end
        end  
      end

      it 'should not have duplates POST routes' do
        assert_raises BlindLeader::Routing::DuplicateRoute do
          subject.post '/batman' do
            @response
          end
          subject.post '/batman' do
            @response
          end
        end  
      end


      it 'should not have duplates PUT routes' do
        assert_raises BlindLeader::Routing::DuplicateRoute do
          subject.put '/spiderman' do
            @response
          end
          subject.put '/spiderman' do
            @response
          end
        end  
      end

      it 'should not have duplates DELETE routes' do
        assert_raises BlindLeader::Routing::DuplicateRoute do
          subject.delete '/nightcrawler' do
            @response
          end
          subject.delete '/nightcrawler' do
            @response
          end
        end  
      end

      it 'should be able to POST and GET on the same route' do
        subject.post '/supermane' , &@response
        subject.get  '/supermane' , &@response
        
        subject.routes.must_equal({
          :GET  => {'/supermane' => @response},
          :POST => {'/supermane' => @response}
        })
      end

      it 'should be able to POST, PUT, and GET on the same route' do
        subject.post '/batman' , &@response
        subject.get  '/batman' , &@response
        subject.put  '/batman' , &@response
        
        subject.routes.must_equal({
          :GET  => {'/batman' => @response},
          :POST => {'/batman' => @response},
          :PUT  => {'/batman' => @response}
        })
      end

      it 'should be able to POST, PUT, DELETE, and GET on the same route' do
        subject.post    '/batman' , &@response
        subject.get     '/batman' , &@response
        subject.put     '/batman' , &@response
        subject.delete  '/batman' , &@response
        
        subject.routes.must_equal({
          :GET    => {'/batman' => @response},
          :POST   => {'/batman' => @response},
          :PUT    => {'/batman' => @response},
          :DELETE => {'/batman' => @response}
        })
      end

    end
    
end
