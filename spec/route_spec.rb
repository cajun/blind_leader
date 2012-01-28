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
      end

      ##Not sure if this is what you had in mind for klass
      it 'klass should be a string' do
        route = subject.new { "i am a string" }
        route.klass.must_equal String
      end

      it 'klass should be a fixnum' do
        route = subject.new { 42 }
        route.klass.must_equal Fixnum
      end

    end


end
