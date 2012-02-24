require 'helper'


describe BlindLeader::Routing::Route do
  subject { BL::R::Route.instance }
  before(:each) { subject.clean_routes! }

  let(:super_route) do
    {
      name:          :superheros   ,
      url:           '/superheros' ,
      verb_handler:  SuperHeros    ,
      view_handler:  BatView
    }
  end


  it { should respond_to :draw }
  it { should respond_to :routes }
  it { should respond_to :clean_routes! }
  it { subject.draw(super_route).should be super_route }

  context 'working with routes' do
    before(:each) { subject.draw super_route }

    its(:routes) { should eq [super_route] }
  end
end

