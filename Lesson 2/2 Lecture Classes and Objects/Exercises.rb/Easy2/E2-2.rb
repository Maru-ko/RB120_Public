module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive


=begin
Methods in mixin modules should be defined without usin `self` to the definition.
The including class will only be able to access the method by calling `Drivable.drive`
Furthermore the method will not be available at all as an instance method to objects.
=end