class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    splitter(full_name)
  end

  def name
    "#@first_name #@last_name".strip
  end

  def name=(string)
    @first_name, @last_name = splitter(string)
  end

  def to_s
    name
  end
  protected

  def splitter(string)
    self.first_name, self.last_name = string.include?(' ') ? string.split : [string, '']
  end

end



bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"