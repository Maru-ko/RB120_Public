class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

=begin

First we search for the color method/getter method in the Cat class.
since we don't find that instance variable or getter method here, we then lookup
the Animal class, it is here we find it an execute the code.
if it wasn't found in the animal class, we would lookup the chain into a module 
then in the Object class, Kernel Module, then BasicObject.
If we do not find them here, then we would throw an error.
  

=end