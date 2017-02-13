require 'spec_helper'
describe 'a' do

  context 'with defaults for all parameters' do
    it { should contain_class('a') }
  end
end
