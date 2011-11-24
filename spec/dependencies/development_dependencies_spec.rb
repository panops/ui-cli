require 'spec_helper'

describe 'Development dependency' do
  
  context 'rake' do
    
    it 'is installed' do
      Bundler.rubygems.find_name('rake').should_not be_empty
    end
    
  end
  
  context 'mocha' do
    
    it 'is installed' do
      Bundler.rubygems.find_name('mocha').should_not be_empty
    end
    
    it 'is used by RSpec as the mocking framework' do
      RSpec.configuration.mock_framework.framework_name.should eql(:mocha)
    end
    
  end
  
  context 'rspec' do
    
    it 'is installed' do
      Bundler.rubygems.find_name('rspec').should_not be_empty
    end
    
  end
  
  context 'yard' do
    
    it 'is installed' do
      Bundler.rubygems.find_name('yard').should_not be_empty
    end
    
    context 'markdown processing dependency rdiscount' do
      
      it 'is required by bundler' do
        Bundler.rubygems.find_name('rdiscount').should_not be_empty
      end
      
    end
    
  end
  
end
