#Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

require_relative 'lib/expression.rb'
require_relative 'lib/input_data.rb'

puts "***************"
puts ::InputData.always_0
puts "***************"

4.times do
  e = Expression.create(['x'])
  puts e
  puts Expression.score(::InputData.always_0, e)
  puts ''
end

