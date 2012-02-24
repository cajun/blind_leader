require 'helper'


describe BlindLeader::Routing do
  before(:each) do
    subject.clean_routes!
  end

  it { should respond_to :routes }
  it { should respond_to :clean_routes! }
  it { should respond_to :route }
  it { should respond_to :redirect }
  
  context 'routes' do
    let(:super_route) do
      {
        name:          :superheros   ,
        url:           '/superheros' ,
        verb_handler:  SuperHeros    ,
        view_handler:  BatView
      }
    end

    before(:each) do
      route = BL::R::Route.instance
      route.draw super_route
    end

    its(:routes) { should eq [super_route] }
  end

  context 'redirects' do
    let(:super_redirect) do
      {
        name:  :superheros,
        from:  '/superheros',
        to:    '/justice_league'
      }
    end

    before(:each) do
      route = BL::R::Redirect.instance
      route.draw super_redirect
    end

    its(:routes) { should eq [super_redirect] }
  end
end
