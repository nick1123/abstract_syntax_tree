class Expression
  class Base
    attr_reader :depth, :parent_expression

    def initialize(variable_terminals, depth, parent_expression)
      @variable_terminals = variable_terminals
      @depth = depth
      @parent_expression = parent_expression
      build_elements
    end
  end
end

