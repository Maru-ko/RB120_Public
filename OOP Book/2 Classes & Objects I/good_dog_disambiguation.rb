class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name, @height, @weight = n, h, w
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, h, w)
    self.name, self.height, self.weight = n, h, w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def some_method
    self.info
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info("Spartakus", '24 inches', '45 lbs')
puts sparky.info
sparky.weight = '11 lbs'
puts sparky.info
puts sparky.some_method