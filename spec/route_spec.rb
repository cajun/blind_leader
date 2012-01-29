require 'helper'

describe 'Route' do
  
    describe 'Methods' do
      subject { BlindLeader::Routing::Route.new {|| 'lego' }  }

      it 'has "klass"' do
        subject.must_respond_to subject, :klass
      end

      it 'has "get"' do
        subject.must_respond_to subject, :get
      end

      it 'has "post"' do
        subject.must_respond_to subject, :post
      end

      it 'has "put"' do
        subject.must_respond_to subject, :put
      end

      it 'has "delete"' do
        subject.must_respond_to subject, :delete
      end

    end
    
    
    describe 'Basic::Route' do
      subject { BlindLeader::Routing::Route }

      before do
        @response    = lambda {"w00ts are king"}
        @double_down = lambda { |s| s*2 }
      end

      it 'klass should be a string' do
        route = subject.new( :get, '/', @response ) { "i am a string" }
        route.klass.must_be_instance_of String
      end

      it 'klass should be a fixnum' do
        route = subject.new( :get, '/', @response ) { 42 }
        route.klass.must_be_instance_of Fixnum
      end

      it 'can store a route' do
        route = subject.new( :get, '/', @response) { 'blargs' }
        route.get.must_equal ({'/' => @response })
      end
      
      it 'can evaluate a route' do
        route = subject.new( :get, '/', @double_down) { 'wooden' }
        route.call.must_equal 'woodenwooden'
      end

      it 'can store a POST route' do
        route = subject.new( :post, '/hahahaha', @response) { 'blargs' }
        route.post.must_equal ({'/hahahaha' => @response })
      end
      
      it 'can store a PUT route' do
        route = subject.new( :put, '/down', @response) { 'blargs' }
        route.put.must_equal ({'/down' => @response })
      end

      it 'can store a DELETE route' do
        route = subject.new( :delete, '/', @response) { 'blargs' }
        route.delete.must_equal ({'/' => @response })
      end


    end

end



