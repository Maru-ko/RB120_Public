class MyCar
  attr_accessor :year, :color, :model

  def initialize(y, c, m)
    @year, @color, @model, @speed = y, c, m, 0
  end

  def speed_up
    self.speed += 10
  end

  def brake
    self.speed -= 10
  end

  def shut_off
    self.speed = 0
  end
end



tesla_truck = 2021, 'grey', 'truck'
p tesla_truck
