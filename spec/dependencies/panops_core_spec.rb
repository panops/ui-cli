require 'spec_helper'

describe 'PanOps Core Dependency' do
  
  it 'is required by bundler' do
    Bundler.rubygems.find_name('panops-core').should_not be_empty
  end
  
end
