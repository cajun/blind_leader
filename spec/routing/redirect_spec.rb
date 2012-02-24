require 'helper'

describe BlindLeader::Routing::Redirect do
  subject { BL::R::Redirect.instance }

  let(:super_redirect) do
    {
      name:  :superheros,
      from:  '/superheros',
      to:    '/justice_league'
    }
  end


  it { should respond_to :draw }
  it { subject.draw(super_redirect).should be super_redirect }
end

