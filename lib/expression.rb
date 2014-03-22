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

  def self.create_operand(variable_terminals, depth)
    if rand > (1/(2**depth) + 0.05)
      op = create_terminal(variable_terminals)
    else
      op = ::Expression.create(variable_terminals, depth + 1)
    end

    return op
  end

  def self.create_terminal(variable_terminals)
    rand > 0.5 ? variable_terminals.sample : create_float
  end

  def self.create_float
    n = (10 * rand).round(1)
    n *= -1 if rand > 0.5
    return n
  end

end

