source 'https://rubygems.org'

# Declare your gem's dependencies in acts_as_explorable.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

# rails_version = ENV['RAILS_VERSION'] || 'default'

# rails = case rails_version
# when 'master'
#   { :github => 'rails/rails'}
# when 'default'
#   '~> 4.1.0'
# else
#   "~> #{rails_version}"
# end

# gem 'rails', rails

group :doc do
  gem 'yard'
end

group :local_development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'appraisal'
  gem 'rake'
  gem 'byebug', platform: :mri_21
end