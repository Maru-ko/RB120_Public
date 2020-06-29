**Question 1**
Which of the following are objects in Ruby?
If they are objects how can you find out what class they belong to?

All shows are objects,
Things that are not objects in ruby are blocks, methods, if statements, argument lists.

we can invoke the #class method on each object.

**Question 2**

we can include the module `Speed` in both `Car` & `Truck` Classes.
We can instantiate a new object of the Truck and Car class respectively and invoke the instance method `go_fast` which was made available to the respective class by the inclusion of the `Speed` module.

**Question 3**
The instance method `go_fast` in the `Speed` module contains a call to a string that uses string interpolations to reference `self.class`.  When `small_car.go_fast` is invoked, `self.class` returns the class in which `small_car` belongs to, since its an object of the `Car` class.

**Question 4**
We creat a new instance of the `AngryCat` class by invoking the class method `new` on `AngryCat` and setting it to a local variable.
example
```Ruby
felix = AngryCat.new
# we can also just do this
AngryCat.new
#however we aren't capturing this new instantiated AngryCat object in anything, so we won't be able to reference it.
```
**Question 5**
We can tell which class has an instance variable by observing the code within the class definition.
If we find anything prefixed by `@` and set to a value withing a class method definition or instance method definitinon we know it is an instance variable.
If we saw `@instance_variable = nil` outside of a method defintion/in the `Class` body the it would be a `Class Instance Variable`
PS. `Pizza` class has an instance variable.
`Fruit` class is just playing us, line 3 is a local variable being assign to an argument passed in aka bad code.

**Question 6**
```Ruby
class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

#or
attr_reader :volume
```

**Question 7**
Ther default return value of `to_s` is the `object class space in memory initialized instance variable`
aka Object's class and encoding of the object id.

**Question 8**
`self` inside an instace method refers to the `age` instance method which operates on the `@age` instance variable.
`self` hereis referencing the istance(object) that called themethod - *the calling object*.

**Question 9**
`self` refers to the class, since it is a `class method` so it references `Cat` class.

**Question 10**
To create a new instance of the `Bag` class we would call the class method `new` on the clas name itself, and pass in two arguments
`Bag.new(color argument, material argument)` since there are no default operators we must pass in two arguments or ruby will raise an `ArgumentError`
