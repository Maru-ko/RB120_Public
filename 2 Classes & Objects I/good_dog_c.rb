class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end