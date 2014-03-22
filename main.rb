Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }

10.times do
  e = Expression.create
  puts e.to_s
end

