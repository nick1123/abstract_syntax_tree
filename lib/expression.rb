class Expression
  def self.create(variable_terminals=['x'], depth=0)
    r = rand
    if r < 0.33
      ::Expression::Unary.new(variable_terminals, depth)
    elsif r < 0.67
      ::Expression::Binary.new(variable_terminals, depth)
    else
      ::Expression::Ternary.new(variable_terminals, depth)
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
    value = (rand > 0.5 ? variable_terminals.sample : create_float.to_s)
    return ::Expression::Terminal.new(value)
  end

  def self.create_float
    n = (10 * rand).round(1)
    n *= -1 if rand > 0.5
    return n
  end

end

