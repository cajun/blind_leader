require 'helper'

describe BlindLeader::HashRoute do
  let(:url) { '/superheros/are/cool' }

  let(:super_route) do
    {
      name:          :superheros   ,
      url:           url,
      verb_handler:  SuperHeros    ,
      view_handler:  BatView
    }
  end


  it 'can accept routes as keys' do
    expect do
    end.should_not raise_error
  end

  context 'with assigned key' do
    before(:each) { subject[url] = super_route }

    it 'should create hashes by splitting /' do
      subject['superheros'].should be super_route
    end
  end

end
