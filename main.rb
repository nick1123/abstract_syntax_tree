class Expression
  def initialize(depth=0)
    @operator  = get_operator
    @operand_1 = get_operand(depth)
    @operand_2 = get_operand(depth)
  end

  def get_operator
    ['+', '-', '*', '/'].sample
  end

  def get_operand(depth)
    if rand > (1/(2**depth))
      op = get_terminal
    else
      op = Expression.new(depth + 1)
    end

    return op
  end

  def get_terminal
    if rand > 0.5
      t = 'x'
    else
      t = (10 * rand).round(1)
      if rand > 0.5
        t = -1 * t
      end
    end

    return t
  end

  def to_s
    "( " + @operand_1.to_s + " " + @operator.to_s + " " +  @operand_2.to_s + " )"
  end
end

10.times do
  e = Expression.new
  puts e.to_s
end

