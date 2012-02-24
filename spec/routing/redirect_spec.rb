require 'helper'

describe BlindLeader::Routing::Redirect do
  subject { BL::R::Redirect.instance }
  before(:each) { subject.clean_routes! }

  let(:super_redirect) do
    {
      name:  :superheros,
      from:  '/superheros',
      to:    '/justice_league'
    }
  end

  it { should respond_to :draw }
  it { should respond_to :routes }
  it { should respond_to :clean_routes! }
  it { subject.draw(super_redirect).should be super_redirect }

  context 'working with redirects' do
    before(:each) { subject.draw super_redirect }

    its(:routes) { should eq [super_redirect] }
  end
end

