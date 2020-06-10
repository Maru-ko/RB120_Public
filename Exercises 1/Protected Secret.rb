class Person
  attr_writer :secret

  def compare_secret(other)
    puts secret
    puts other.secret
    self.secret == other.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = "Shh.. this is a secret!"

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
=begin
protected methods allow access between class instances, while private methods don't.


=end