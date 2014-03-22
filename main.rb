Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

class Expression
  class Unary
    def initialize(variable_terminals, depth)
      @operator  = get_operator
      @operand = ::Expression.create_operand(variable_terminals, depth)
    end

    def get_operator
      '-'
    end

    def to_s
      "( " + @operator.to_s + " " + @operand.to_s + " )"
    end
  end
end

10.times do
  e = Expression.create
  puts e.to_s
end

