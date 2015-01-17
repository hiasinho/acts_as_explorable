module ActsAsExplorable
  ##
  # Returns a new TagList using the given tag string.
  #
  # @example
  #   tag_list = ActsAsTaggableOn::GenericParser.new.parse("One , Two, Three")
  #   tag_list # ["One", "Two", "Three"]
  class Parser

    def self.transform(query_string, *keys)
      instance = self.new(query_string)
      instance.parse
    end

    def initialize(query_string, *keys)
      @query_string = query_string
      @keys = keys
    end

    def parse
      col = { props: [], values: [], params: {} }

      @query_string.split(/\s+/).each { |q| q =~ /\w+:[\w,-]+/ ? col[:props] << q : col[:values] << q }

      col[:props].each do |p|
        key, params = p.split(':').first.to_sym, p.split(':').last.split(',')
        next if !@keys.flatten.include?(key) && !@keys.empty?
        col[:params][key] ||= []
        col[:params][key] = col[:params][key] | params.map(&:downcase)
      end

      col.except(:props)
    end
  end
end