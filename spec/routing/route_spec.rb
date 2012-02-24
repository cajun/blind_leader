require 'helper'

SuperHeros = Class.new
BatView    = Class.new

describe BlindLeader::Routing::Route do
  subject { BL::R::Route.instance }

  let(:super_route) do
    {
      name:          :superheros   ,
      url:           '/superheros' ,
      verb_handler:  SuperHeros    ,
      view_handler:  BatView
    }
  end


  it { should respond_to :draw }
  it { subject.draw(super_route).should be super_route }
end

