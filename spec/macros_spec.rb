require File.expand_path( File.dirname(__FILE__)) + '/helper'

module Routing::Macros
  
        #@routing.resource '/he-man', &@response
  def resource route, &block
    self.post(route, &block)
    self.get((route + "/:id"), &block)
    self.put((route + "/:id"), &block)
    self.delete((route + "/:id"), &block)
  end

end

describe Routing::Macros do
    describe 'methods' do  
      before do
        @routing = Object.new
        @routing.extend Routing::Macros
      end

      it 'has "resource"' do
        @routing.must_respond_to :resource
      end

    end

    describe 'resource' do

      before do
        @routing  = Routing.new
        @routing.extend Routing::Macros
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

      ## I think this would be better
      it 'should not truncate the first get' do
        @routing.resource '/he-man', &@response

        @routing.routes.must_equal({
          :GET    => {
            '/he-man' => @response,
            '/he-man/:id' => @response
          },
          :POST   => {'/he-man'     => @response},
          :PUT    => {'/he-man/:id' => @response},
          :DELETE => {'/he-man/:id' => @response}
        })
      end


    end
end
