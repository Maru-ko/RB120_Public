class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type, @name = type, name
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end    
end

class Shelter
  attr_reader :adopts
  def initialize
    @adopts = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
   @adopts[owner.name] ? @adopts[owner.name] << pet : @adopts[owner.name] = [pet]
  end

  def print_adoptions
    @adopts.each { |k, v| puts "#{k} has adopted the following pets:"; v.each { |pet| puts "A #{pet.type} named #{pet.name}"} }
  end
end






butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts shelter.adopts