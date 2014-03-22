class Expression
  class Base
    def self.create(variable_terminals=['x'], depth=0)
      r = rand
      if r < 0.33
        BinaryExpression.new(variable_terminals, depth)
      elsif r < 0.67
        BinaryExpression.new(variable_terminals, depth)
      else
        TernaryExpression.new(variable_terminals, depth)
      end
    end

    def initialize(variable_terminals, depth)
      @operator  = get_operator
      @operand_1 = get_operand(variable_terminals, depth)
    end

    def get_operand(variable_terminals, depth)
      if rand > (1/(2**depth) + 0.05)
        op = Terminal.new(variable_terminals)
      else
        op = Expression::Base.create(variable_terminals, depth + 1)
      end

      return op
    end
  end
end

