class Pet
  def initialize(name, age, fur=nil)
    @name, @age, @fur = name, age, fur
  end
end

class Cat < Pet
#  attr_reader :fur
#  def initialize(a, b, c)
#    super(a, b)
#    @fur = c
#  end

  def to_s
    "My cat #{@name} is #{@age} and has #{@fur} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch