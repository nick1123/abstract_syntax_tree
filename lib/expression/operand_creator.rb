class Expression
  class OperandCreator
    def self.create(variable_terminals, depth)
      if rand > (1/(2**depth) + 0.05)
        op = Terminal.new(variable_terminals)
      else
        op = Expression::Base.create(variable_terminals, depth + 1)
      end

      return op
    end
  end
end

