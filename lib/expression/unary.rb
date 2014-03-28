class Expression
  class Unary < ::Expression::Base
    def build_elements
      @operator = get_operator
      @operand  = ::Expression.create_operand(@variable_terminals, @depth, self)
    end

    def get_operator
      '-'
    end

    def expressions
      [self, @operand.expressions].flatten
    end

    def to_s
      "( " + @operator.to_s + " " + @operand.to_s + " )"
    end
  end
end


