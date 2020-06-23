module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

module Maths
  def plus(x)
    self + x
  end

  def minus(y)
    self - y
  end

  def time(z)
    self * z
  end
end

class Integer
  include Maths
end

p 5.plus(4)
p 6.minus(1)
p 7.time(11)
sparky = GoodDog.new #<- instance of a good dog class
#we created an instance of our GoodDog class and stored it in var 'sparky'
#we now have an object
sparky.speak('Arf!')
bob = HumanBeing.new
bob.speak('Hello!')
puts
puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
puts "---Integer ancestors---"
puts Integer.ancestors
