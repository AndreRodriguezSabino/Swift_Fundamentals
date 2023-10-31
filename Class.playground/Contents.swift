import Cocoa

/*
 CLASSES
 
 In Swift, data is typically stored using structs for types like String, 
 Int, Double, and Array. However, there is another way to create custom
 data types called classes. While classes share many similarities with
 structs, they also have distinct differences.

 First, let's explore what classes and structs have in common:

 1 - You have the flexibility to create and name them.
 2 - Properties and methods, including property observers and access control,
 can be added.
 3 - Custom initializers can be created to configure new instances according
 to your needs.
 
 However, classes differ from structs in five key aspects:

 1 - Classes can inherit and build upon the functionality of another class,
 inheriting all its properties and methods as a starting point. Selective
 method overriding is also possible.
 2 - Due to the inheritance capability mentioned above, Swift does not automatically
 generate a memberwise initializer for classes. This means you must either write
 your own initializer or assign default values to all properties.
 3 - When you copy an instance of a class, both copies share the same data.
 Any changes made to one copy affect the other.
 4 - Classes can optionally have a special function called a deinitializer,
 which is executed when the final copy of a class instance is destroyed.
 5 - Even if you declare a class as a constant, you can still modify its properties,
 provided they are defined as variables.
 
 While these differences may seem somewhat arbitrary at first, they serve
 specific purposes. SwiftUI, for instance, heavily utilizes classes, especially
 for the third point: all copies of a class share the same data. This allows
 various parts of an app to share information, ensuring that changes in one
 part automatically update others.

 The other aspects are also important but are used to varying degrees:

 • Building one class based on another is vital in Apple's older UI framework,
 UIKit, but is less common in SwiftUI apps. In UIKit, lengthy class hierarchies
 were common, where class A was built on class B, which was built on class C,
 and so on.
 
 • The absence of a memberwise initializer can be inconvenient, but it makes sense
 given the potential complexities when one class is based on another.
 
 • The ability to change properties of a constant class is linked to the shared data
 behavior of classes. While a constant class cannot change what object it points to,
 it can still modify the data within that object. This is unlike structs, where each
 copy is unique and holds its own data.
 
 • With multiple references to one class instance, it's important to know when the final
 copy is destroyed. Deinitializers help in cleaning up any special resources allocated
 when the last copy is removed.
 */

// One example of classes:
class Game {
    var score = 0 {
        didSet {
            print("This is the score now: \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
newGame.score += 5

/*
 Indeed, the only distinction between the class and a struct is the keyword used to create 
 them – "class" instead of "struct." Everything else remains identical. At first glance,
 this might make classes appear redundant, but trust me, all five of their differences hold
 crucial significance.

 In the upcoming chapters, I'll delve deeper into these five differences between classes and 
 structs. However, for now, the key takeaway is this: both structs and classes are indispensable,
 and you'll require both when working with SwiftUI.
 */

/*
 WHY DOES SWIFT HAVE BOTH CLASSES AND STRUCTS?
 
 Classes and structs in Swift offer developers the capability to craft customized, intricate 
 types comprising properties and methods. However, they distinguish themselves through five
 significant differences:

 • Classes do not automatically generate memberwise initializers.
 
 • Inheritance is supported in classes, enabling one class to build upon another, inheriting 
 its properties and methods.
 
 • Copies of structs are always unique, whereas copies of classes refer to the same shared data.
 
 • Classes have deinitializers, methods executed when an instance of the class is destroyed, which 
 structs lack.
 
 • Variable properties in constant classes can be altered, while in constant structs, modifying 
 variable properties is prohibited.
 
 The essence is that these differences exist and are crucial. Most Swift developers typically
 opt for structs over classes when possible. Therefore, when selecting a class over a struct,
 it's typically for the specific behavior outlined above.
 
 WHY DON'T SWIFT CLASSES HAVE A MEMBERWISE INITIALIZER?
 
 One of the valuable features of Swift's structs is the automatic creation of a synthesized memberwise initializer. This feature allows us to generate new instances of the struct by simply specifying its properties. However, this is not available for Swift's classes, which might be inconvenient. But why is this feature absent in classes?

 The primary reason lies in the concept of inheritance within classes, which would complicate the functionality of memberwise initializers. Consider this scenario: if I developed a class that you inherited from and later appended some properties to my class, your code would break. All the areas where you relied on my memberwise initializer would suddenly cease to function.

 Swift presents a straightforward solution: instead of automatically producing a memberwise initializer, authors of classes must manually create their initializers. This approach enables the addition of properties without impacting the class's initializer or other classes that inherit from it. Moreover, when modifications to the initializer are made, the author is fully conscious of the repercussions for any inheriting classes.
 */
