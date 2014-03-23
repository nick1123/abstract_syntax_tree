Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

#10.times do
#  e = Expression.create
#  puts e.to_s
#end

e = Expression.create
puts e
#puts e.expressions
e.mutate
puts e
