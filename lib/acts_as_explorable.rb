require 'active_record'
require 'active_support/inflector'
require 'acts_as_explorable/ext/string'
require 'acts_as_explorable/explorable'
require 'acts_as_explorable/search'
require 'acts_as_explorable/element'

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
    attr_accessor :types, :type_filters

    def initialize
      @types = [:in, :state, :sort]
      @type_filters = {
        in: [:title, :name, :body],
        state: [:open, :closed],
        sort: [:number, :state, :title, :name, :created_at]
      }
    end
  end

  setup
end

ActiveSupport.on_load(:active_record) do
  extend ActsAsExplorable::Explorable
  # include ActsAsTaggableOn::Tagger
end
# ActiveSupport.on_load(:action_view) do
#   include ActsAsTaggableOn::TagsHelper
# end
