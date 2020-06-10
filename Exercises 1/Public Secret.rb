class Person
  attr_accessor :secret
end

person1 = Person.new
p person1
person1.secret = 'Shh.. this is a secret!'
puts person1.secret