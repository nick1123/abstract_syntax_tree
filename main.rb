Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

class Expression
  class TernaryExpression
    def initialize(variable_terminals, depth)
      @operator  = get_operator
      @operand_1 = ::Expression::OperandCreator.create(variable_terminals, depth)
      @operand_2 = ::Expression::OperandCreator.create(variable_terminals, depth)
      @conditional = ConditionalExpression.new(variable_terminals, depth)
    end

    def get_operator
    end

    def to_s
      "( " + @conditional.to_s + " ? " + @operand_1.to_s + " : " +  @operand_2.to_s + " )"
    end
  end

  class BinaryExpression < Expression::Base
    def initialize(variable_terminals, depth)
      super
      @operand_2 = ::Expression::OperandCreator.create(variable_terminals, depth)
    end

    def get_operator
      ['+', '-', '*', '/', '**'].sample
    end

    def to_s
      "( " + @operand_1.to_s + " " + @operator.to_s + " " +  @operand_2.to_s + " )"
    end
  end

  class ConditionalExpression < BinaryExpression
    def get_operator
      ['<', '<=', '>', '>='].sample
    end
  end

  class UnaryExpression < Expression::Base
    def get_operator
      '-'
    end

    def to_s
      "( " + @operator.to_s + " " + @operand_1.to_s + " )"
    end
  end
end

10.times do
  e = Expression.create
  puts e.to_s
end

