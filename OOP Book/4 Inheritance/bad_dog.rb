class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(name, age)
    super(name)
    @age = age
  end
end

bear = BadDog.new("bear", 2)
p bear

