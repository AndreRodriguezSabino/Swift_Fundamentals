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
    /*
     'var name' and 'var currentPassenger'
     With those two extra requirements in place, Swift will warn us that both Car and Bicycle no longer conform to the
     protocol because they are missing the properties. To fix that, we could add the properties to Car and Bicycle as you can see
     from lines (75 and 76 for Car) and (138 and 139 for Bicycle):
     */
    var name: String { get }
    var currentPassengers: Int { get set }
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
    let name = "Car"
    var currentPassengers = 1
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
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I am cycling \(distance)Km!!")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

/*
 Now, we introduce a second struct that also adheres to the Vehicle protocol. This is where the potency of protocols 
 becomes evident: we can now supply either a Car or a Bicycle to the commute() function. The internal logic of the
 function can be as complex as needed, and when it invokes estimateTime() or travel(), Swift will automatically select
 the appropriate method—when a car is passed in, it will declare "I'm driving," but with a bike, it will announce
 "I'm cycling."

 Protocols enable us to articulate the type of functionality we want to interact with, rather than specifying exact types. 
 Instead of mandating "this parameter must be a car," we can express "this parameter can be anything at all, as long as it
 can estimate travel time and move to a new location."

 In addition to methods, protocols also allow us to define properties that must be present in conforming types. To achieve 
 this, we use var, followed by the property name, and indicate whether it should be readable and/or writable.

 For instance, we could specify that all types conforming to Vehicle must declare the number of seats they have and the 
 current count of passengers, like this:
 
 protocol Vehicles {
     var name: String { get }
     var currentPassengers: Int { get set }
     func estimateTime(for distance: Int) -> Int
     func travel(distance: Int)
 }

 These additions introduce two properties:

 1 - A string property named name, which must be readable. This could be a constant or a computed property with a getter.
 
 2 - An integer property named currentPassengers, which must be read-write. This could be a variable or a computed property 
 with both a getter and a setter.
 
 Type annotations are necessary for both properties since we cannot provide default values in a protocol, similar to how 
 protocols cannot supply implementations for methods.
 */

/*
 Once again, you have the flexibility to substitute those properties with computed properties as long as you adhere to the 
 guidelines—using { get set } would disallow conforming to the protocol with a constant property.

 Our protocol now mandates the implementation of two methods and two properties. This ensures that all conforming types must 
 incorporate these four elements for our code to function correctly. Consequently, Swift can confidently assert the presence
 of this functionality, allowing us to write code that depends on it.

 For instance, we could craft a method that takes an array of vehicles and utilizes it to compute estimates across a variety of 
 options:
 */

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

/*
 I trust this illustrates the genuine potency of protocols. We accept an entire array of the Vehicle protocol, enabling us to
 pass in a Car, a Bicycle, or any other struct that conforms to Vehicle. Swift ensures seamless compatibility, making it work
 effortlessly:
 */

getTravelEstimates(using: [car, bike], distance: 150)

/*
 In addition to receiving protocols as parameters, you can also return protocols from a function if necessary.

 Quick tip: You have the flexibility to conform to as many protocols as necessary. Simply list them one by one, separated by commas.
 If you find yourself needing to subclass something and conform to a protocol simultaneously, it's best practice to mention the parent
 class name first, followed by the listed protocols.
 */

/*
 EXTENSION
 
 In the realm of programming, extensions empower us to enhance the capabilities of any data type, whether it's one we crafted ourselves 
 or one created by others – even if it's a type from Apple's library.

 Let's delve into a practical example by exploring a method applicable to strings known as trimmingCharacters(in:). This method excels 
 at purging specific types of characters from the beginning or end of a string. It can handle various character types, such as
 alphanumeric letters, decimal digits, and, more frequently, whitespace and new lines.

 Whitespace encompasses characters like the space and tab characters, along with their assorted variations. New lines refer to line 
 breaks in text, and despite their seemingly straightforward nature, the reality is that there's no universal method for creating them.
 Therefore, when we invoke the trim operation for new lines, it automatically takes care of all the diverse variants for us.

 Consider this string as an illustration, where whitespace exists on both ends:
 */
var quote = "               Let's start a new phrase in this paragrapher    "
/*
 If we wanted to trim the whitespace and newlines on either side, we could do so like this:
 let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
 */
//print(trimmed)

/*
 The value .whitespacesAndNewlines is part of Apple's Foundation API, and interestingly, so is the trimmingCharacters(in:) method. 
 As I mentioned way back at the start of this course, Foundation is loaded with handy code!

 However, repeatedly calling trimmingCharacters(in:) can be a bit verbose. So, let's craft an extension to streamline the process 
 and make it more concise:
 */
extension String {
    /*
     Extensions also enable the addition of properties to types, but with a rule: these must only be computed properties, not stored ones.
     The rationale is that adding new stored properties would impact the actual size of data types. For instance, if we appended several
     stored properties to an integer, every integer everywhere would need more memory space, causing various issues.

     Fortunately, we can still achieve a great deal using computed properties. As an example, a property I find handy to add to strings
     is called lines, which segments the string into an array of individual lines. This leverages another string method called
     components(separatedBy:), breaking the string into a string array by splitting it at a specified boundary. In this instance,
     we'd set the boundary to be new lines, and this is how we'd integrate it into our string extension (also see line 344):
     */
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }

    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
/*
 Let's break down the process step by step:

 1 - We kick off with the extension keyword, signaling to Swift that we're extending the functionality of an existing type.
 
 2 - The type we're targeting is specified next – in this case, we're enhancing the capabilities of the String type.
 
 3 - Following that, we open a pair of curly braces, and all the code within these braces will be appended to strings.
 
 4 - We introduce a fresh method named trimmed(), designed to yield a new string as its output.
 
 5 - Inside this method, we make use of the familiar trimmingCharacters(in:) method, passing along its result.
 
 6 - It's worth noting the use of self here – it automatically points to the current string. This works seamlessly because
 we're currently within a string extension.
 
 7 - Now, whenever we desire to eliminate whitespace and newlines, we can effortlessly employ the following syntax:
 */
let trimmed = quote.trimmed()
print(trimmed)

/*
 Way simpler!

 This has indeed spared us some keystrokes, but is it significantly superior to a standard function?

 In reality, we could have crafted a function like this:
 */
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

//Then used it like this:
let trimmed2 = trim(quote)

/*
 That's less code compared to using an extension, both in creating the function and utilizing it. This type of 
 function is known as a global function because it's accessible throughout our entire project.

 However, extensions offer several advantages over global functions, such as:

 1 - Convenient Discovery: When you type quote. in Xcode, it displays a list of methods associated with the string, 
 including those added through extensions. This makes it easy to locate our additional functionality.
 
 2 - Organizational Clarity: Writing global functions can make your code appear messy; they are challenging to organize
 and keep track of. On the flip side, extensions are naturally grouped by the data type they extend.
 
 3 - Access to Internal Data: Extensions, being a seamless part of the original type, enjoy full access to the type's
 internal data. This means they can utilize properties and methods marked with private access control, for instance.
 
 4 - In-Place Modification: Extensions make it more straightforward to modify values directly, altering a value in place
 rather than generating a new one.
 
 To illustrate, earlier, we created a trimmed() method in the extension that produces a new string with removed whitespace 
 and newlines. If we wanted to alter the string directly, we could include this in the extension:
 
 mutating func trim() {
     self = self.trimmed()
 }
 
 Because the quote string was created as a variable, we can trim it in place like this:
 
 quote.trim()
 */

/*
 Notice the slight change in method naming: when we return a new value, we use trimmed(), but when modifying the string directly, 
 it's trim(). This isn't accidental; it aligns with Swift's design guidelines. If you're returning a new value instead of altering
 it in place, you should employ word endings like "ed" or "ing," such as reversed().

 Pro tip: Earlier, I introduced you to the sorted() method on arrays. Now armed with this rule, you should recognize that for a 
 variable array, you can use sort() to sort the array in place rather than creating a new copy.
 */

//With that in place we can now read the lines property of any string, like so:

let text = """
Now, we are going to start a new line
text to explaing some functionalities
on how to use LINES method in
our code adding it in an Array.
"""
print(text.lines.count)
print(text.lines)

/*
 Whether they're simple one-liners or intricate functionalities, extensions consistently pursue the same objective: to simplify
 your code writing process, enhance readability, and facilitate long-term maintenance.
 */

/*
 Before we wrap up, I'd like to share a highly valuable trick when dealing with extensions. Earlier, you observed how Swift automatically
 creates a memberwise initializer for structs, like this:
 */

struct Book {
    let title: String
    let numberOfPages: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.numberOfPages = pageCount
        self.readingHours = pageCount / 50
    }
}

let aH = Book(title: "Atomic Habits", numberOfPages: 320, readingHours: 6)

/*
 I also pointed out that crafting your own initializer results in Swift no longer automatically generating the memberwise one for us. 
 This is intentional, as a custom initializer signifies our intention to assign data using specific custom logic.
 
 If Swift were to maintain the memberwise initializer in this scenario, it would bypass our logic for calculating the approximate reading time.

 However, there are instances where you want both – the ability to utilize a custom initializer while retaining Swift's automatic memberwise 
 initializer. It's crucial to understand what Swift does in this scenario: if we implement a custom initializer within our struct, Swift deactivates
 the automatic memberwise initializer.

 Here's a little insight that might foreshadow what's next: if we implement a custom initializer within an extension, Swift won't disable the automatic 
 memberwise initializer. This makes sense when you consider it: if adding a new initializer in an extension also turned off the default initializer,
 a small modification from us could potentially disrupt various other Swift code.

 Therefore, if we wish our Book struct to have both the default memberwise initializer and our custom one, we'd place the custom initializer in an extension.
 */

/*
 WHEN SHOULD YOU USE EXTENSIONS IN SWIFT?
 
 Extensions provide us with the capability to enhance classes, structs, and more. This is particularly handy for modifying types we don't own – types 
 that were authored by Apple or someone else. When we add methods through extensions, they blend seamlessly with the original type's methods. However,
 there's a distinction for properties: extensions can only introduce computed properties and not new stored properties.

 Beyond modifying external types, extensions are valuable for organizing our own code. While there are various approaches, let's focus on two: conformance 
 grouping and purpose grouping.

 Conformance grouping involves adding protocol conformance to a type through an extension and placing all required methods inside that extension. 
 This simplifies the understanding of how much code a developer needs to keep in mind while reading an extension. For instance, if the current extension
 adds support for Printable, developers won't encounter printing methods mixed in with methods from unrelated protocols.

 On the flip side, purpose grouping entails creating extensions to perform specific tasks, making it more convenient to manage large types. For example, 
 you might have an extension dedicated to handling the loading and saving of a particular type.

 It's important to note that some developers realize they have a sizable class and attempt to make it more manageable by breaking it into extensions. 
 To clarify, the type remains the same size as before; it's just neatly segmented. While this may enhance understanding, it doesn't actually reduce the
 size of the class.
 */
