require 'spec_helper'
describe 'namespacing' do
  context 'with default values for all parameters' do
    it { should contain_class('namespacing') }
  end
end
