module Expression
  def self.create(variable_terminals=['x'], depth=0)
    BinaryExpression.new(variable_terminals, depth)
  end
end

class Terminal
  def initialize(variable_terminals)
    if rand > 0.5
      @terminal = variable_terminals.sample
    else
      @terminal = (10 * rand).round(1)
      if rand > 0.5
        @terminal = -1 * @terminal
      end
    end
  end

  def to_s
    @terminal.to_s
  end
end

class BinaryExpression
  def initialize(variable_terminals, depth)
    @operator  = get_operator
    @operand_1 = get_operand(variable_terminals, depth)
    @operand_2 = get_operand(variable_terminals, depth)
  end

  def get_operator
    ['+', '-', '*', '/', '**'].sample
  end

  def get_operand(variable_terminals, depth)
    if rand > (1/(2**depth) + 0.05)
      op = Terminal.new(variable_terminals)
    else
      op = Expression.create(variable_terminals, depth + 1)
    end

    return op
  end

  def get_terminal(variable_terminals)
 end

  def to_s
    "( " + @operand_1.to_s + " " + @operator.to_s + " " +  @operand_2.to_s + " )"
  end
end

10.times do
  e = Expression.create(['x', 'y', 'z'])
  puts e.to_s
end

