**STATES & BEHAVIOURS**
`instance variables` keep track of state.
`instance methods` expose behavior for objects.

`Classes` are used to create `objects`

when defining a `class` *states & behaviours*
`states` track **attributes** for individual objects.
**behaviours** are what objects are capable of doing.

`instance variables` are scoped at the **object/instance** level, and how objects keep track of their states.

behaviours are defined as *instance methods* in a class.
*instance methods* defined in a class are available to objects(instances) of that class.

___

**Initializing a New Object***

```
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new #=> "This object was initialized!"
```

The `initialize` method gets called every time a new object is instantiated.
calling the `new` class method leads us to the `initialize` instance method.

The `initialize` method is refered to as a **`constructor`**, due to that it is triggered whenever a new object is instantiated.

___

**Instance Variables**

Instantiating an object with a 'name' state.

**`@name`** <=# instance variable
  a var that exists as long as the object exits
  how we tie data to objects
  lives on until the object instance is destroyed.
```
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

String object `"Sparky"` is being passed from the `new` method through to the `initialize` method, then assigned to local variable `name`.
Whiting the *constructor* method, the *INSTANCE VARIABLE* `@name` is set to `name`, ultimately resulting in assigning the String Object `"Sparky"` to the **`@name`** instance variable.

Every object's **state** is unique, `instance variables` are how we keep track.

***instance variables*** are responsible for keeping track of of information about the *state* of an object.

___

**Instance Methods**

```
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new('Sparky')
puts sparky.speak
fido = GoodDog.new('Fido')
puts fido.speak
```

The second object *`fido`* can perform `GoodDog` behaviours.
All objects of the same class have the same behaviours, though they contain **different states**.
The ***differing state*** in the above example is the `name`.


```
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
fido = GoodDog.new("Fido")
puts fido.speak
```
In the above example `instance methods` have access to `instance variables`, which allows us to expose information about the state of the object using instance methods.

___

**Accessor Methods**

[[[ A `NoMethodError` means that we called a method that doesn't exists or is unavailable to the object.]]]]


```
class GoooDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoooDog.new("Sparky")
puts sparky.get_name
puts sparky.speak
sparky.set_name = "Spartacus"
puts sparky.speak
puts sparky.get_name
```
`set_name=` special syntax equivalent to; `sparky.set_name=("Spartacus")` where `set_name=` is the method name, and the string object "Spartacus" is the argument being passed in to the method.
when we use `sparky.set_name = "Spartacus"` we need to realize that theres a method `set_name=` working behind the scenes, and that what we are witnessing is RUBY SYNTACTICAL SUGAR.

***below above simplified***

```
class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
sparky.name = "Ko-Inu"
puts sparky.speak
```
As a convention, Rubyists typically want to name those *getter* and *setter* methods the same name as the `instance variable` they are exposing and setting.

**writting getter & setter methods takes up a lot of room in a program for such a simple feature***
Due to the commonplace Ruby has a built=in way to automatically create these getter and setter methods.
**`attr_accessor`** method.

```
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
puts sparky
sparky.name = "Spartakus"
puts sparky.name
puts sparky.speak
puts sparky
```

the `attr_accessor` method takes a `:symbol` argument (which it uses to create the method name of the `getter` & `setter` methods.  One line replaces two method definitions.)

-
What if we only want `getter` method, and no `setter` method?
we present the;
**`attr_reader`** method!!!
Only allows for the retrieval of the instance variable.

What if we just want a setter method???
we present the;
**`attr_writer`** method!

all **`attr_`** methods take a `Symbol` as parameters.

```
attr_accessor :name, :height, :weight

def speak
"#{@name} says arg!"
end
```
instead of referencing the `@name` instance variable directly, we can use the `name` getter method (given to us now by the `attr_accessor`)
```
def speak
  "#{name} says arf!"
end
```
by removing `@` we're not calling the instance method.
***its generally a good idea to to call the **getter* ***method instead***

