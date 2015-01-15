require 'acts_as_explorable/element/base'
require 'acts_as_explorable/element/in'
require 'acts_as_explorable/element/sort'
require 'acts_as_explorable/element/state'

module ActsAsExplorable
  module Element
    attr_accessor :query_type, :model, :parameters, :query_string, :query_parts,
                  :full_query

    def initialize(query, model)
      query = query.to_acts_as_explorable(ActsAsExplorable.types)

      @model = model
      @query_string = query[:values]
      @query_parts = []
      filter_parameters(query[:params])
      after_init

      render if @parameters.present?
    end

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

    def after_init; end

    def execute(query_object)
      query_object.send(@query_type, @full_query)
    end

    protected

    def type
      self.class.name.demodulize.underscore.to_sym
    end

    def filters
      ActsAsExplorable.type_filters[type]
    end
  end
end
