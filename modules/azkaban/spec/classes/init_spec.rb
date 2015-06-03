require 'spec_helper'
describe 'azkaban' do

  context 'with defaults for all parameters' do
    it { should contain_class('azkaban') }
  end
end
