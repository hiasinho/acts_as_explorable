module ActsAsExplorable::Element
  class State < Base
    def after_init
      @query_type = :where
    end

    def render
      @query_parts << table[type].in(@parameters)
      @full_query = @query_parts.first
    end
  end
end
