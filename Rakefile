require 'bundler'
require 'bundler/setup'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.pattern = "#{File.dirname(__FILE__)}/spec/**/*_spec.rb"
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

