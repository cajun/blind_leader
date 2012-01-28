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
    
    
end
