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
end

