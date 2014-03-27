class Expression
  class Method < ::Expression::Base
    def build_elements
      @operator = get_operator
      @operand  = ::Expression.create_operand(@variable_terminals, @depth)
    end

    def get_operator
      ['abs', 'ceil', 'floor', 'round'].sample
    end

    def expressions
      [self, @operand.expressions].flatten
    end

    def to_s
      "( " + @operand.to_s + " )." + @operator
    end
  end
end


