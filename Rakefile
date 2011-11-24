require 'bundler'
require 'bundler/setup'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

def configure_spec_task task
  task.pattern = "#{File.dirname(__FILE__)}/spec/**/*_spec.rb"
  task.rspec_opts = ['--color']
end

RSpec::Core::RakeTask.new do |t|
  configure_spec_task t
end

RSpec::Core::RakeTask.new :'spec:doc' do |t|
  configure_spec_task t
  t.rspec_opts += ['--format', 'documentation']
end

task :doc => [:'doc:yard']

namespace :doc do
  require 'yard'
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

