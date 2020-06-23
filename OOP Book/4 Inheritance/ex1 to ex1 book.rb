class Vehicle
  @@number_of_vehicles = 0
  def initialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def speed_up(number=1)
    @speed += number
    puts "You are accelerating by #{number} and the speed is #{@speed} mph."
  end

  def brake(number=1)
    @speed -= number
    puts "You are decelarating by #{number} and the speed is now #{@speed} mph."
  end

  def current_speed
    puts "You are now going #{@speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "#{@model} is now shut-off."
  end

  def info
    puts "This is a #{@year} #{@color} #{@model}."
  end

  def info
    puts "This is a #{@year} #{@color} #{@model}."
  end
end

class MyCar < Vehicle
  NO_DOORS = 4

  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year, @color, @model, @speed = y, c, m, 0
    @@number_of_vehicles += 1
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great"
  end
end

class MyTruck < Vehicle
  NO_DOORS = 2
end


tesla_truck = MyCar.new(2021, "Grey", "CyberTruck")
tesla_truck.info
tesla_truck.speed_up
tesla_truck.speed_up(20)
tesla_truck.speed_up(30)
tesla_truck.brake
tesla_truck.brake(15)
tesla_truck.speed_up
tesla_truck.current_speed
tesla_truck.shut_down
puts tesla_truck.color
puts tesla_truck.year
tesla_truck.color = "space grey"
tesla_truck.info
tesla_truck.spray_paint("Matte Space Blue")
tesla_truck.info

puts MyCar.number_of_vehicles
puts Vehicle.number_of_vehicles