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
 
 One of the valuable features of Swift's structs is the automatic creation of a synthesized 
 memberwise initializer. This feature allows us to generate new instances of the struct by
 simply specifying its properties. However, this is not available for Swift's classes, which
 might be inconvenient. But why is this feature absent in classes?

 The primary reason lies in the concept of inheritance within classes, which would complicate 
 the functionality of memberwise initializers. Consider this scenario: if I developed a class
 that you inherited from and later appended some properties to my class, your code would break.
 All the areas where you relied on my memberwise initializer would suddenly cease to function.

 Swift presents a straightforward solution: instead of automatically producing a memberwise 
 initializer, authors of classes must manually create their initializers. This approach enables
 the addition of properties without impacting the class's initializer or other classes that
 inherit from it. Moreover, when modifications to the initializer are made, the author is fully
 conscious of the repercussions for any inheriting classes.
 */

/*
 In Swift, the concept of inheritance enables us to create classes based on existing classes. 
 When a class inherits from another (referred to as the "parent" or "super" class), the inheriting
 class (the "child" or "subclass") gains access to the properties and methods of the parent class.
 This access allows us to modify or extend the behavior of the new class by making small adjustments
 or additions.

 To implement inheritance in Swift, specify the parent class after a colon following the name of the 
 child class. This establishes the relationship between the classes. For instance, consider an example
 of an Employee class with a property and an initializer:
 */

class Employee {
    let hour: Int
    
    init(hour: Int) {
        self.hour = hour
    }
    /*
     Since Developer inherits from Employee, we can directly call the printSummary() method on instances 
     of Developer, like this:
     */
    func printSummary() {
        print("I work \(hour) hours a day.")
    }
}

//We could make two subclasses of Employee, each of which will gain the hours property and initializer:

final class Developer: Employee {
    func work() {
        print("I am writing code for \(hour) hours.")
    }
    /*
     So, if we wanted developers to have a unique printSummary() method, we’d add this to the Developer class:
     */
    override func printSummary() {
        print("I am a Swift developer and sometimes I spend \(hour) hours typing code.")
        /*
         Because Developer inherits from Employee, we can immediately start calling printSummary() on instances 
         of Developer.
         */
    }
}

class Manager: Employee {
    func work() {
        print("I am going to meeting for \(hour) hours.")
    }
    
}

/*
 See how the child classes can directly access the 'hours' property as if they've defined it themselves, 
 without the need for redundant code.

 Both classes inherit from the 'Employee' class and bring in their unique modifications. When we create instances 
 of these classes and invoke the 'work()' method, the resulting behavior will differ between the two instances.
 */

let andre = Developer(hour: 8)
let graci = Manager(hour: 9)
let lucas = Employee(hour: 8)
andre.work()
andre.printSummary()
/*
 It becomes a bit more complex when you aim to modify an inherited method. Consider the scenario where we placed 
 printSummary() within the Employee class, but perhaps one of the child classes requires slightly different functionality.

 In Swift, a straightforward rule is enforced: if a child class intends to alter a method from its parent class, 
 it must use the 'override' keyword in the child class's version of the method. This rule serves two purposes:

 1 - If you attempt to modify a method without employing 'override', Swift will prevent the code from building. 
 This prevents accidental method overrides.
 2 - If you use 'override' but the method doesn’t actually override something from the parent class, Swift will 
 reject the code build as it's likely a mistake.
 */
graci.work()
lucas.printSummary()

/*
 In addition to sharing properties, methods can also be shared and accessed by the child classes. For instance, 
 consider adding the following code to the Employee class.
 
 In Swift, the handling of method overrides is intelligent. For instance, if your parent class includes a work() 
 method without parameters, and the child class introduces a work() method that accepts a string to specify the
 work location, this situation doesn't demand the 'override' keyword because you're not directly replacing the
 parent method.

 Helpful hint: If you are certain that your class shouldn't support inheritance, you can label it as 'final'. 
 This signifies that while the class itself can inherit from other sources, it cannot be used as a parent class.
 No child class can utilize a 'final' class as its parent.
 */

/*
 When would you want to override a method?
 
 In Swift, when a class inherits from a parent class, it gains the ability to override the methods and occasionally 
 the properties of that parent class. This allows the child class to replace the implementation of the parent's
 method with its own.

 This level of customization is incredibly valuable for developers. Imagine this: someone has crafted a fantastic 
 class that you'd like to utilize, but it's not a perfect fit. Wouldn't it be convenient to override just a portion
 of its behavior rather than reworking the entire thing from scratch?

 Absolutely! This is precisely where method overriding becomes essential: you retain all the desired behavior while 
 tweaking one or two aspects within a custom subclass.

 In UIKit, Apple's original iOS user interface framework, this approach was frequently employed. For instance, consider 
 built-in apps like Settings and Messages, both displaying information in rows. Settings includes rows like General,
 Control Center, Display & Brightness, while Messages presents individual rows for different conversations. In UIKit,
 these are referred to as tables and share common behaviors, such as scrolling through rows, selecting them by tapping,
 displaying small gray arrows on the right side, and more.

 These row lists are quite prevalent, so Apple offers existing code containing standard behaviors. However, certain 
 aspects need adjustment, like the number of rows or their contents. Swift developers would create subclasses of Apple's
 table and override specific parts they wished to modify, thereby inheriting built-in functionality while gaining
 flexibility and control.

 Swift requires the 'override' keyword before overriding functions, which is beneficial:

 Using 'override' when it's unnecessary (if the parent class doesn’t declare the same method) triggers an error. 
 This prevents typos, like mismatched parameter names or types, and ensures your override won’t fail if the parent
 class alters its method without corresponding changes in the child class.
 Failure to use 'override' when necessary also generates an error, preventing accidental changes in behavior inherited 
 from the parent class.
 */

/*
 Which classes should be declared as final?
 
 Final classes in programming cannot be inherited from, preventing users from adding new functionality or altering 
 the existing functionality. This behavior isn't the default and requires explicit designation using the 'final' keyword.

 Remember, when someone subclasses your class, they can override properties and methods, granting them significant control. 
 If they dislike something you've implemented, they have the power to entirely replace it. They might continue using your
 original method along with their replacement, but they might not.

 This can lead to issues: perhaps your class performs a crucial function that shouldn't be altered, or you have clients 
 under a support contract and don't want them to disrupt how your code operates.

 Apple's older code was predominantly written in Objective-C before Swift. Objective-C lacked robust support for final 
 classes, so Apple often resorted to large warnings in their documentation. For instance, the AVPlayerViewController class,
 designed for playing movies, carries a prominent yellow warning stating that subclassing and overriding its methods aren't
 supported and may result in undefined behavior. Although the reasons may not always be clear, it's advised not to override
 these classes. Another example is the Timer class, which manages timed events like alarms, and it straightforwardly warns:
 "Do not subclass Timer."

 Previously, in Swift, final classes were considered more performance-efficient due to providing additional information on 
 code execution, enabling optimizations. However, this performance distinction is no longer true. Nevertheless, many developers
 still habitually declare classes as final to communicate the intent that subclassing isn’t encouraged unless explicitly allowed.
 This practice aids in conveying how the code is intended to be used.
 */

/*
 HOW TO ADD INITIALIZERS FOR CLASSES?
 
 In Swift, class initializers pose more complexity compared to struct initializers, but we can focus on the crucial part: 
 if a child class contains custom initializers, it must always invoke the parent's initializer once it finishes configuring
 its own properties, if any are present.

 As mentioned earlier, Swift doesn't automatically generate a memberwise initializer for classes. This holds true whether 
 inheritance is involved or not - Swift won't create a memberwise initializer for you. Consequently, you'll either need to
 create your own initializer or assign default values to all class properties.

 Let's begin by defining a new class:
 */
class Vehicle {
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

/*
 This new class contains a single Boolean property, along with an initializer responsible for setting the value of that property. 
 Utilizing 'self' here clarifies that we're assigning the 'isElectric' parameter to the property of the same name.

 Now, suppose we aim to create a Car class that inherits from the Vehicle class.
 
 However, Swift will reject the compilation of this code because although we've specified that the Vehicle class requires knowledge 
 about whether it's electric or not, we haven't supplied a value for that within the Car class.

 What Swift requires is for the Car class to have an initializer that encompasses both 'isElectric' and 'isConvertible'. Instead of 
 directly storing 'isElectric' within the Car class, we need to pass it on to the superclass by invoking its own initializer.

 Here's how that should be implemented:
 */
class Car: Vehicle {
    var isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

/*
 SUPER is another one of Swift's automatic values, akin to SELF. It enables us to invoke methods belonging to our parent class, 
 including its initializer. It's not restricted solely to initializers and can be utilized with other methods as needed.

 With valid initializers now present in both our classes, we can create an instance of Car using the following code:
 */
let teslaX = Car(isElectric: true, isConvertible: false)

// Tip: When a subclass doesn't have any custom initializers of its own, it automatically inherits the initializers of its parent class.
