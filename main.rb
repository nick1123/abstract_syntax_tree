#Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

require_relative 'lib/expression.rb'
require_relative 'lib/expression/base.rb'
require_relative 'lib/expression/conditional.rb'
require_relative 'lib/expression/unary.rb'
require_relative 'lib/expression/binary.rb'
require_relative 'lib/expression/ternary.rb'
require_relative 'lib/expression/terminal.rb'

10.times do
  e = Expression.create
  puts e.to_s
end

#e = Expression.create
#puts e
##puts e.expressions
#e.mutate
#puts e
