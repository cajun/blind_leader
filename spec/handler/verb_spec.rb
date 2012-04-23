require 'helper'

describe BlindLeader::Handler::Verb do

  context 'without overrideing the method' do

    it '"get" should complain' do
      expect { subject.get }.should raise_error BL::H::Verb::NotImplemented
    end

    it '"post" should complain' do
      expect { subject.post }.should raise_error BL::H::Verb::NotImplemented
    end

    it '"put" should complain' do
      expect { subject.put }.should raise_error BL::H::Verb::NotImplemented
    end

    it '"delete" should complain' do
      expect { subject.delete }.should raise_error BL::H::Verb::NotImplemented
    end

  end

end
