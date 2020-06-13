module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Animal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Person < Animal

  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  
  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal

  private

  def gait
    "runs"
  end
end

class Noble < Animal
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
puts
byron = Noble.new("Byron", "Lord")
byron.walk
puts byron.name
puts byron.title
