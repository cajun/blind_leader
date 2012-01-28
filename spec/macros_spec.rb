require 'helper'

describe 'Macros' do
    describe 'Methods' do  
      subject do
        routing = Object.new
        routing.extend BlindLeader::Routing::Macros
      end

      it 'has "resource"' do
        subject.must_respond_to :resource
      end

    end

    describe 'Resource' do
      
      subject do
        routing  = BlindLeader::Routing.new
        routing.extend BlindLeader::Routing::Macros
      end
      
      before do
        @response = lambda {"I HAVE THE POWER!!!!!!"}
      end

      it 'should be able to GET, POST, PUT, and DELETE as a REST resource' do
        subject.resource '/he-man', &@response

        subject.routes.must_equal({
          :GET    => {
            '/he-man'     => @response,
            '/he-man/:id' => @response
          },
          :POST   => {'/he-man'     => @response},
          :PUT    => {'/he-man/:id' => @response},
          :DELETE => {'/he-man/:id' => @response}
        })
      end


    end
end
