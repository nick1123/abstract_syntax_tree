require 'digest/sha1'

require_relative 'expression/base.rb'
require_relative 'expression/conditional.rb'
require_relative 'expression/unary.rb'
require_relative 'expression/binary.rb'
require_relative 'expression/ternary.rb'
require_relative 'expression/terminal.rb'

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

  def self.mutate(expression)
    e = expression.expressions.sample
    e.build_elements
  end

  def self.clone(expression)
    Marshal.load(Marshal.dump(expression))
  end

  def self.signature(expression)
    Digest::SHA1.hexdigest(expression.to_s)
  end

  def self.short_signature(expression)
    signature(expression)[0..5]
  end

  # Example
  #   inputs_and_expected_output_hash = {inputs: {x: 2, y: 3}, expected_output: 99}
  def self.score(inputs_and_expected_output_hash, expression)
    expression_string = expression.to_s
    inputs_and_expected_output_hash[:inputs].each do |variable, value|
      expression_string.gsub!(variable.to_s, value.to_s)
    end


    the_score = nil
    eval("the_score = #{expression_string}")
    the_score *= the_score
    return the_score
  end
end

