#Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

require_relative 'lib/expression.rb'
10.times do
  e = Expression.create
  puts e.to_s
  Expression.mutate(e)
  puts e.to_s
  puts ''
end

#e = Expression.create
#puts e
##puts e.expressions
#e.mutate
#puts e
