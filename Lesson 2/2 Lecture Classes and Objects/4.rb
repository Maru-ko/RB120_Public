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

  protected

  def splitter(string)
    self.first_name, self.last_name = string.include?(' ') ? string.split : [string, '']
  end

end








bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
p bob.last_name = 'Smith'
p bob.name
puts
bob.name = "John Adams"
puts bob.first_name
puts bob.last_name
puts bob.name
puts
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name