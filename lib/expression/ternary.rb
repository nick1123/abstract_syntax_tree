class Expression
  class Ternary < ::Expression::Base
    def build_elements
      @conditional = ::Expression::Conditional.new(@variable_terminals, @depth, self)
      @operand_1   = ::Expression.create_operand(@variable_terminals, @depth, self)
      @operand_2   = ::Expression.create_operand(@variable_terminals, @depth, self)
    end

    def expressions
      [self, @conditional.expressions, @operand_1.expressions, @operand_2.expressions].flatten
    end

    def to_s
      "( " + @conditional.to_s + " ? " + @operand_1.to_s + " : " +  @operand_2.to_s + " )"
    end
  end
end


