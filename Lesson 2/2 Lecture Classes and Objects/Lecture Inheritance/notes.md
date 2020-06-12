**CLASSES & OBJECTS**

Classes are blueprints for objects.

Every object comes with a `to_s` method inherited from the `Object` class.
It prints out the place in memory.



**INHERITANCE**

Class based inheritance works great when it's used to model hierarchical domains.

Objects that sublcass can not only override methods, they can also inherit methods.

OOP allows us to organize behaviours into classes, and set up a hierarchical structure that takes advantage of inheritance.

Inheriting behaviours is a way to re-use common behaviours.


"we do not have a good 'default' method for sublcasses"

The ML-UP is the order in which Ruby will traverse the class hierarchy to look for methods to invoke.
Ruby will traverse up the chain of super-classes, it will invoke the first method called, and stop its traversal.

To see the method lookup path we can use the `#ancestors` *class* method.

All classes subclass from `Object`.


**POLYMORPHISM**
Refers to the ability of different objects to respond in different ways to the same message (method invocation).

There are several ways to implement polymorphism.

https://miro.medium.com/max/1400/1*_aYQlS86g2bzyRXkE1KTAw.png
***POLYMORPHISM THROUGH INHERITANCE***

the code shows 2 subclasses and 1 superclass each with a 'eat' method.
we have 3 instantiations within an array, this array is caputured in a variable
the each method is invoked on the array, at each iteration we send the now designated
'animal' argument/parameter to the #feed_animal method [which was defined below the classes]
in which arguments passed to it have the `meat` method invoked on them.

The client code can treat them all as a generic object (animal - an object that cat eat)
The public interface allows us to work with all these types in the same way though the implementations can be dramatically differnent.
THIS IS POLYMORPHISM IN ACTION.

***POLYMORPHISM THOUGH DUCK TYPING***
Duck typing in ruby doesn't concern itself with the class of an object; instaed, it concerns itself with what methods are available on the object.
'if an objects quacks likea  duck, we can treat it like a duck'.

In the example each class must define a `prepare_wedding` method and implement it in its own way.  If we must add another 'preparer', we can create another class and just implement `prepare_wedding` to perform the appropriate actions.

**ENCAPSULATION**

Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need.
We expose these properties and methods through the public interface of a class; its public methods.

Encapsulation lets us hide the internal representation of an object from the outside

and only expose the methods and properties

that users of the object need.


We expose these methods and properties trhough the public interface of a class;
its public methods.

Encapsulation lets us hide the iternal representation of an object from the outside
and only expose the methods and properties that the user of an object needs.
We expose these properties and methods through the public interface of a class; its public methods.

The class should have as few public methods as possible.
It lets us simplify using that class and protect data from undesired changes form the outerworld.