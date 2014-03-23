class Expression
  class Base
    def initialize(variable_terminals, depth)
      @variable_terminals = variable_terminals
      @depth = depth
      build_elements
    end
  end
end

