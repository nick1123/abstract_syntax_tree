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


e1 = Expression.create(['x'])
puts e1
s1 = Expression.score(::InputData.always_0, e1)
puts s1
puts ""

e2 = Expression.create(['x'])
puts e2
s2 = Expression.score(::InputData.always_0, e2)
puts s2
puts ""

winner = Expression.get_tournament_winner(e1, s1, e2, s2)
puts winner
