#Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

require_relative 'lib/expression.rb'
4.times do
  e = Expression.create(['x'])
  puts e
  puts Expression.score({inputs: {x: 2}, expected_output: 0}, e)
  puts ''
end

