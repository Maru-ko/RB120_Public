module Transportation
  class Vehicle; end
  class Truck < Vehicle; end
  class Car < Vehicle; end
end

t55 = Transportation::Truck.new
p t55.class
p t55