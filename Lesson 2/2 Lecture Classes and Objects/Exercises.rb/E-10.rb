class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    WHEELS
  end
end


class Car < Vehicle
  def wheels
    4
  end

  def wheels
    WHEELS
  end

end

class Motorcycle < Vehicle
  def wheels
    2
  end

end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end

end

cybertruck = Truck.new("Tesla", "Cyber Truck", 6000)
puts cybertruck
p cybertruck
p cybertruck.wheels
