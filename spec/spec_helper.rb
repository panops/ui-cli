require 'bundler'
require 'bundler/setup'

require 'rspec'

require 'panops/user_interfaces/cli'

RSpec.configure do |c|
  c.mock_framework = :mocha
end
