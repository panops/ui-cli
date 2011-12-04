require 'bundler'
require 'bundler/setup'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

def configure_spec_task klass, task
  task.pattern = "#{File.dirname(__FILE__)}/spec/#{klass}/**/*_spec.rb"
  task.rspec_opts = ['--color']
end

RSpec::Core::RakeTask.new :'spec:integration' do |t|
  configure_spec_task 'integration', t
end

RSpec::Core::RakeTask.new :'spec:integration:doc' do |t|
  configure_spec_task 'integration', t
  t.rspec_opts += ['--format', 'documentation']
end

RSpec::Core::RakeTask.new :'spec:unit' do |t|
  configure_spec_task 'unit', t
end

RSpec::Core::RakeTask.new :'spec:unit:doc' do |t|
  configure_spec_task 'unit', t
  t.rspec_opts += ['--format', 'documentation']
end

task :spec => [:'spec:unit', :'spec:integration']

task :doc => [:'doc:yard']

namespace :doc do
  require 'yard'
  require 'yard-state_machine'
  YARD::Rake::YardocTask.new do |task|
    task.files = ['lib/**/*.rb', '-', 'LICENSE']
    task.options = [
      '--protected',
      '--output-dir', 'doc/yard',
      '--markup', 'markdown'
    ]
  end
end

task :default => [:spec, :doc]

