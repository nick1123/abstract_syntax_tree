class Expression
  class Unary
    def initialize(variable_terminals, depth)
      @operator = get_operator
      @operand  = ::Expression.create_operand(variable_terminals, depth)
    end

    def get_operator
      '-'
    end

    def child_expressions
      results = []
      results << @operand unless @operand.is_a?(::String)
      return results
    end

    def to_s
      "( " + @operator.to_s + " " + @operand.to_s + " )"
    end
  end
end


