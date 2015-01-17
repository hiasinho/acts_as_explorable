class String
  # Converts the String into a Hash for ActsAsExplorable.
  #
  # == Returns:
  # A Hash providing 2 keys:
  # - <tt>:values</tt> holds the search text values
  # - <tt>:params</tt> holds parameters (fields) to search in
  #
  # @example
  #   query = "Foo Bar in:name,body sort:created_at-asc"
  #   query.to_acts_as_explorable
  #   # => {:values=>["Foo", "Bar"], :params=>{:in=>["name", "body"], :sort=>["created_at-asc"]}}
  #
  # @param keys [Array<String, Symbol>, nil] Array of accepted keys
  #
  # @return [Hash] Converted query
  def to_acts_as_explorable(*keys)
    self.blank? ? return : col = { props: [], values: [], params: {} }

    split(/\s+/).each { |q| q =~ /\w+:[\w,-]+/ ? col[:props] << q : col[:values] << q }

    col[:props].each do |p|
      key, params = p.split(':').first.to_sym, p.split(':').last.split(',')
      next if !keys.flatten.include?(key) && !keys.empty?
      col[:params][key] ||= []
      col[:params][key] = col[:params][key] | params.map(&:downcase)
    end

    col.except(:props)
  end
end
