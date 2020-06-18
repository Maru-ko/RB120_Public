class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin

include the 'Comparable' mixin, and define the method `<=>`.
0 will be returned if both objects are equal
1 if the receiving object is greater than the other object.
-1 if the receiving object is less than the other object.

=end