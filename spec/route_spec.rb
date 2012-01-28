require 'helper'

describe 'Route' do
  
    describe 'Methods' do
      subject { BlindLeader::Routing::Route.new }

      it 'has "klass"' do
        subject.must_respond_to :klass
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

    end
    
    
end
