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
      @operand_1 = ::Expression.create_operand(variable_terminals, depth)
    end

  end
end

