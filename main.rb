Dir[File.dirname(__FILE__) + '/lib/*/*.rb'].each {|file| require file }

class Expression
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
      op = Expression.create(variable_terminals, depth + 1)
    end

    return op
  end

end

class TernaryExpression < Expression
  def initialize(variable_terminals, depth)
    super
    @operand_2 = get_operand(variable_terminals, depth)
    @conditional = ConditionalExpression.new(variable_terminals, depth)
  end

  def get_operator
  end

  def to_s
    "( " + @conditional.to_s + " ? " + @operand_1.to_s + " : " +  @operand_2.to_s + " )"
  end
end

class BinaryExpression < Expression
  def initialize(variable_terminals, depth)
    super
    @operand_2 = get_operand(variable_terminals, depth)
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

class UnaryExpression < Expression
  def get_operator
    '-'
  end

  def to_s
    "( " + @operator.to_s + " " + @operand_1.to_s + " )"
  end
end

10.times do
  e = Expression.create
  puts e.to_s
end

