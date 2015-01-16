begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.options << '--output-dir' << './doc'
  t.options << '--no-private'
  t.options << '--protected'
  t.options << '--readme' << 'README.md'
  t.options << '--hide-tag' << 'return'
  t.options << '--hide-tag' << 'param'
end

require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

desc 'Default: run specs.'
task :default => :spec

desc "Run watchr"
task :watchr do
  sh %{bundle exec watchr .watchr}
end

Bundler::GemHelper.install_tasks