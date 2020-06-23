class GoooDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoooDog.new("Sparky")
puts sparky.get_name
puts sparky.speak
sparky.set_name = "Spartacus"
puts sparky.speak
puts sparky.get_name