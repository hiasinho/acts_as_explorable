module ActsAsExplorable
  module Explorable

    def self.extended(base)
      base.class_eval do
        def self.explorable?
          false
        end
      end
    end

    # Configure ActsAsExplorable's behavior in a model.
    #
    # The plugin can be customized using parameters or through a `block`.
    #
    #     class Person < ActiveRecord::Base
    #       extend ActsAsExplorable
    #       explorable types: { only: [:in, :sort] },
    #                  filters: {
    #                    in: [:first_name, :last_name, :city],
    #                    sort: [:first_name, :last_name, :city, :created_at]
    #                  }
    #     end
    #
    # Using a block:
    #
    #     class Person < ActiveRecord::Base
    #       extend ActsAsExplorable
    #       explorable do |config|
    #         config.types = [:in, :sort]
    #         config.filters = {
    #           in: [:first_name, :last_name, :city],
    #           sort: [:first_name, :last_name, :city, :created_at]
    #         }
    #       end
    #     end
    #
    # @yield Provides access to the model class's config, which
    #   allows to customize types and filters
    #
    # @yieldparam config The model class's {ActsAsExplorable::Configuration config}.
    def explorable(types: {only: [], except: []}, filters: {}, &block)

      class_eval do
        def self.explorable?
          true
        end
      end

      if block_given?
        ActsAsExplorable.setup { |config| yield config }
      else
        explorable_types types
        explorable_filters filters
      end
    end

    # Configure ActsAsExplorable's permitted types in a model.
    #
    #     class Person < ActiveRecord::Base
    #       extend ActsAsExplorable
    #       explorable_types only: [:in, :sort]
    #     end
    #
    # @option options [Array] :only ([]) Define permitted types
    # @option options [Array] :except ([]) Exclude types
    # @return [Array] Permitted types
    #
    def explorable_types(only: [], except: [])
      if only.present?
        ActsAsExplorable.types = only
      elsif except.present?
        ActsAsExplorable.types.reject! { |t| except.include?(t) }
      end
      ActsAsExplorable.types
    end

    # Configure ActsAsExplorable's permitted filters per type in a model.
    #
    #     class Person < ActiveRecord::Base
    #       extend ActsAsExplorable
    #       explorable_filters in: [:first_name, :last_name, :city],
    #                          sort: [:first_name, :last_name, :city, :created_at]
    #     end
    #
    # @param [Hash] filters Filters for types
    # @return [Array] Permitted filters
    #
    def explorable_filters(filters = {})
      ActsAsExplorable.type_filters = filters if filters.present?
      ActsAsExplorable.type_filters
    end
  end
end
