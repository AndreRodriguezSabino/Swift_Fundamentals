import Cocoa

/*
 In the realm of programming, think of protocols in Swift as analogous to contracts. They enable us to
 specify the kind of functionality we anticipate a particular data type to possess, and Swift
 guarantees that the remainder of our code adheres to these specified rules.

 Consider the scenario of crafting code to simulate a person's commute from home to the office. 
 We could design a compact Car structure and subsequently devise a function similar to the following:
 
 func commute(distance: Int, using vehicle: Car) {
     // lots of code here
 }
 
 Of course, they might also commute by train, so we’d also write this:
 
 func commute(distance: Int, using vehicle: Train) {
     // lots of code here
 }
 
 Or they might travel by bus:
 
 func commute(distance: Int, using vehicle: Bus) {
     // lots of code here
 }
 
 Alternatively, they might opt for a bike, an e-scooter, a ride-share service, or various other transportation 
 alternatives.

 The reality is, at this stage, we're not concerned with the specific mechanics of the underlying trip. 
 Our focus is much broader: understanding the estimated commute duration for the user with each option and
 determining the essential actions for moving to the new location.

 This is where protocols play a crucial role. They enable us to outline a set of properties and methods that we 
 intend to utilize. These protocols don't implement the actual code for those properties and methods—think of them
 as blueprints. They merely specify that these properties and methods must exist.

 As an illustration, we could create a new Vehicle protocol like this:
 */

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 To initiate a new protocol, we use the keyword protocol followed by the chosen protocol name. As this represents a 
 new type, we follow camel case, starting with an uppercase letter.

 Within the protocol, we enumerate all the methods essential for the protocol to function as expected. These methods, 
 however, lack any code inside; there are no function bodies provided here. Instead, we define the method names, parameters,
 and return types. Additionally, we can indicate if methods are meant to throw errors or if they are mutating.

 So, by creating a protocol, how does this benefit us?

 Now, we have the ability to devise types that adhere to that protocol. This involves crafting new structs, classes, or enums 
 that fulfill the protocol requirements, a process known as adopting or conforming to the protocol.

 Importantly, the protocol doesn't specify the complete set of functionality that must be present; it outlines only a basic 
 minimum. Consequently, when generating new types that conform to the protocol, you retain the flexibility to include additional
 properties and methods as needed.

 For instance, we could establish a Car struct that conforms to the Vehicle protocol, like this:
 */

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I am driving \(distance)Km!")
    }
    func openSunRoof() {
        print("It is a nice day!!")
    }
}

/*
 Here are a few key points to focus on in the provided code:

 1 - We declare that Car conforms to Vehicle by using a colon after the name Car, similar to marking subclasses.
 
 2 - All the methods listed in Vehicle must be precisely implemented in Car. If there are slight differences in names,
 parameter types, return types, etc., Swift will notify us that we haven't conformed to the protocol.
 
 3 - The methods in Car contain actual implementations of the methods outlined in the protocol. In this instance, our
 struct offers an estimated time in minutes for driving a specific distance and prints a message when travel() is invoked.
 
 4 - The openSunroof() method doesn't originate from the Vehicle protocol and doesn't logically belong there because not
 all vehicle types have a sunroof. However, this is acceptable because the protocol only defines the essential functionality
 that conforming types must possess, allowing them to add their own methods as necessary.
 
 So, in summary, we've successfully created a protocol and developed a Car struct that conforms to this protocol.

 To conclude, let's update the commute() function from earlier so that it incorporates the new methods we introduced to Car:
 */

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

/*
 The code is functional, but at first glance, it may seem like the protocol isn't providing much value. Although it 
 compelled us to implement two precise methods within Car, one might wonder why bother with the protocol if we could
 have achieved the same without it.

 Now, here's the clever aspect: Swift recognizes that any type conforming to Vehicle must include implementations for 
 both the estimateTime() and travel() methods. Consequently, it allows us to use Vehicle as the parameter type instead
 of specifying Car. Let's modify the function accordingly:
 
 func commute(distance: Int, using vehicle: Vehicle) {
 
 In this modification, we're indicating that this function can be invoked with any type of data, given that the type 
 adheres to the Vehicle protocol. Notably, the function's body remains unchanged because Swift ensures that the necessary
 estimateTime() and travel() methods exist for any conforming type.

 If you're pondering the utility of this, let's consider the following struct:
 */

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I am cycling \(distance)Km!!")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)
