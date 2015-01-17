require 'acts_as_explorable/element/base'
require 'acts_as_explorable/element/in'
require 'acts_as_explorable/element/sort'
require 'acts_as_explorable/element/dynamic_filter'
require 'acts_as_explorable/element/state'

module ActsAsExplorable
  module Element
    attr_accessor :query_type, :model, :parameters, :query_string, :query_parts,
                  :full_query

    def self.build(type, query, model)
      klass = Module.nesting.last.const_get('Element').const_get(type.to_s.camelize)
      instance = klass.new(query, model, type)
      rescue NameError
        instance = DynamicFilter.new(query, model, type)
      return instance
    end

    def initialize(query, model, element_type = nil)
      query = query.to_acts_as_explorable(ActsAsExplorable.filters.keys)

      @type = element_type if element_type
      @model = model
      @query_string = query[:values]
      @query_parts = []
      filter_parameters(query[:params])
      after_init

      render if @parameters.present?
    end

    def after_init; end

    def execute(query_object)
      query_object.send(@query_type, @full_query)
    end

    protected

    def filter_parameters(params)
      return unless params[type]
      @parameters = params[type].select do |f|
        filters.find do |e|
          /#{e.to_sym}(?:-\w+)?/ =~ f
        end
      end
    end

    def table
      @model.arel_table
    end

    def render
      fail "`#render` needs to be implemented for #{self.class.name}"
    end

    def type
      @type.to_sym || self.class.name.demodulize.underscore.to_sym
    end

    def filters
      ActsAsExplorable.filters[type]
    end
  end
end
