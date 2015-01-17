module ActsAsExplorable
  module Search
    #
    # Initiates a search with the given query string and returns an
    # <tt>ActiveRecord::Relation</tt> scope object.
    #
    # The query string's *syntax* is described in {file:docs/yard/README.md#syntax the Readme File}
    #
    # The search method can be used just like a scope.
    #
    #   Foo.search("Foo Bar in:name,body sort:created_at-asc").to_sql
    #   # => "SELECT foo.* FROM foo WHERE (foo.body ILIKE '%Foo%' OR foo.body ILIKE '%Bar%') ORDER BY foo.created_at ASC"
    #
    # It is also possible to put it in a scope chain like this:
    #
    #   Foo.published.search("Foo Bar in:name,body sort:created_at-asc")
    #
    # @param [String] query A query string
    # @return [ActiveRecord::Relation] Returns an <tt>ActiveRecord::Relation</tt> scope object
    #
    def search(query)
      parts = ActsAsExplorable.types.map { |t| Element.build(t, query, self) }

      result = all

      parts.compact.each do |part|
        result = part.execute(result)
      end

      result
    end
  end
end
