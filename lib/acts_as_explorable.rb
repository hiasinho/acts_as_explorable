require 'active_record'
require 'active_support/inflector'
require 'acts_as_explorable/version'
require 'acts_as_explorable/ext/string'
require 'acts_as_explorable/element'
require 'acts_as_explorable/explorable'
require 'acts_as_explorable/search'


#
# ActsAsExplorable Plugin
#
# For usage details, please see {file:docs/yard/README.md#usage the Readme File}
#
# @author Mathias Schneider
#
module ActsAsExplorable
  def self.extended(base)
    base.extend Search
  end

  def self.setup
    @configuration ||= Configuration.new
    yield @configuration if block_given?
  end

  def self.method_missing(method_name, *args, &block)
    if @configuration.respond_to?(method_name)
      @configuration.send(method_name, *args, &block)
    else
      super
    end
  end

  def self.respond_to?(method_name, _include_private = false)
    @configuration.respond_to? method_name
  end

  class Configuration
    attr_accessor :filters

    def initialize
      @filters = {}
    end
  end

  setup
end

ActiveSupport.on_load(:active_record) do
  extend ActsAsExplorable::Explorable
end
