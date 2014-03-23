#Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

require_relative 'lib/expression.rb'
require_relative 'lib/input_data.rb'

input_data_first = ::InputData.always_0[4]
puts "***************"
puts input_data_first
puts "***************"

4.times do
  e = Expression.create(['x'])
  puts e
  puts Expression.score(input_data_first, e)
  puts ''
end

