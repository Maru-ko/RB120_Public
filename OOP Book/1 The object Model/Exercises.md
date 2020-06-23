***HOW DO WE CREATE AN OBJECT IN RUBY? EXAMPLE OF CREATION OF AN OBJECT***

Objects are created by defining a class & instantiating it using the class method #.new to create
a new instance AKA **object**.

```
class Soda
end

coke = Soda.new
mountain_dew = Soda.new
```

***What is a Module? How do we use them in our classes? Create one for the one above and include it properly***


```
module FlavorBlast
	def flavor(ingredient)
		puts ingrediend
	end
end

class Soda
	include FlavorBlast
end

coke = Soda.new

```
1. Grouping common methods into a module so we can reuse it.
2. For name spacing.

___

**ENCAPSULATION**
creating objects, and exposing interfaces(methods) to interact with those *objects*
Form of **data protection** so that data cannot be manipulated or changed without obv intention.
Hiding pieces of functionality & making it unavailable to the rest of the code base.

***Ruby accomplishes ENCAPSULATION by creating objects, and exposing them to interfaces(methods) to interact with those objects***

___

**POLYMORPHISM**
Using pre-written code for new purposes in OOP.

***INHERITANCE***
A class inherits the behaviours of a ***SUPERCLASS***
Givings us power to define basic classes with large resuability & smaller subclasses.

***modules***
Objects CANNOT BE CREATED with modules.
Module must be mixed in with a class using the `include` method invocation.
aka ***`MIXIN`***
behaviours declared in said module are available to the **class and its objects**

___

**OBJECTS**
`methods` & `blocks` are **not** `objects`
`Objects` are created from `CLASSES`
Individual objects will contain different info from other objects, yet they are instances of the same class.

```
'chips'.class
=> String
'soda'.class
=> String
'peanut butter'.class
=> String
```
