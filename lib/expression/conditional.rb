class Expression
  class Conditional
    def initialize(variable_terminals, depth)
      @operator  = get_operator
      @operand_1 = ::Expression.create_operand(variable_terminals, depth)
      @operand_2 = ::Expression.create_operand(variable_terminals, depth)
    end

    def expressions
      [@operand_1.expressions, @operand_2.expressions].flatten
    end

    def get_operator
      ['<', '<=', '>', '>='].sample
    end

    def to_s
      "( " + @operand_1.to_s + " " + @operator.to_s + " " +  @operand_2.to_s + " )"
    end
  end
end

