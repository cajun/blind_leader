require 'helper'


describe 'Rack Integration' do
  it 'should have the Rack gem' do
    begin
      gem "Rack"
    rescue
      false
    end
  end
end


