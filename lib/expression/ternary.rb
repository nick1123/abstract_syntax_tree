class Expression
  class Ternary
    def initialize(variable_terminals, depth)
      @conditional = ::Expression::Conditional.new(variable_terminals, depth)
      @operand_1   = ::Expression.create_operand(variable_terminals, depth)
      @operand_2   = ::Expression.create_operand(variable_terminals, depth)
    end

    def expressions
      [self, @operand_1.expressions, @operand_2.expressions].flatten
    end

    def to_s
      "( " + @conditional.to_s + " ? " + @operand_1.to_s + " : " +  @operand_2.to_s + " )"
    end
  end
end


