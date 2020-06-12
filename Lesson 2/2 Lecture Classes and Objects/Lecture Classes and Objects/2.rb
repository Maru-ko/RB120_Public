class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name='')
    @first_name, @last_name = first_name, last_name
  end

  def name
    "#@first_name #@last_name"
  end

end

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.last_name
puts bob.name