#Rectangles & Squares


class Rectangle
  def initialize(height, width)
    @height, @width = height, width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(argument)
    super(argument, argument)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"