require File.expand_path('./lib/panops/user_interfaces/cli/version')

# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name = 'panops-ui-cli'
  gem.version = PanOps::UserInterfaces::CLI::Version.to_standard_version_s

  gem.authors = ["PanOps Platform Contributors"]
  gem.email = ["engineering@panops.org"]

  gem.summary = %q{This gem contains components related to the PanOps Command Line Interface UI.}
  gem.description = %q{This gem contains components related to the PanOps Command Line Interface UI. For example: the panops user interface binary.}

  gem.homepage = 'http://www.panops.org/'

  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename f }
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split "\n"
  gem.files = `git ls-files`.split "\n"

  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.9.3'
  gem.required_rubygems_version = Gem::Requirement.new '>= 1.3.6'

  gem.add_development_dependency 'rake', '~> 0.9.2'
  gem.add_development_dependency 'mocha', '~> 0.10.0'
  gem.add_development_dependency 'rspec', '~> 2.7.0'
  gem.add_development_dependency 'yard', '~> 0.7'
  gem.add_development_dependency 'rdiscount', '~> 1.6.8'

  gem.add_dependency 'panops-core', '~> 0.0.1alpha1'
  gem.add_dependency 'state_machine', '~> 1.1.0'
end
