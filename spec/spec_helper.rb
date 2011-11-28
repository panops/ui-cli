require 'bundler'
require 'bundler/setup'

require 'rspec'

require 'panops/user_interfaces/cli'
require 'panops/user_interfaces/cli/test_utilities'

RSpec.configure do |c|
  c.mock_framework = :mocha
end
