import Cocoa

// STRUCTS

/*
 For a budding programmer learning Swift, it's essential to understand that structs empower 
 us to craft custom and intricate data types. These data types can possess their distinct
 variables and functions, providing us with a powerful tool for organizing and manipulating
 data.

 Here's a basic representation of a struct in Swift:
 */
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title), \(year) by \(artist)")
    }
}
/*
 In Swift, you can define a new data type called "Album." This custom data type has three constants: 
 "title" and "artist," both of which are strings, and "year," which is an integer. Additionally,
 I've included a simple function that can summarize the values of these three constants.

 You might have noticed that "Album" starts with a capital letter. This is a standard naming 
 convention in Swift, similar to how we use "String," "Int," "Bool," "Set," and so on. When
 referring to a data type, we use camel case with an initial uppercase letter. However, when
 dealing with elements inside the data type, like variables or functions, we use camel case
 with an initial lowercase letter. Keep in mind that this convention is more of a guideline
 than a strict rule, but it's a helpful one to follow.

 At this stage, an "Album" is just like "String" or "Int." You can create instances of it, 
 assign values, make copies, and perform various operations. For example, you can create
 multiple album instances, access and modify their values, and call their functions as needed:
 */

let bestOfTheBeast = Album(title: "Best of the Beast", artist: "Iron Maiden", year: 1996)
let aceOfSpades = Album(title: "Ace of Spades", artist: "Motorhead", year: 1980)

print(bestOfTheBeast.artist)
print(aceOfSpades.artist)

bestOfTheBeast.printSummary()
aceOfSpades.printSummary()

/*
 It's fascinating to observe how we can create a new "Album" instance as if we were invoking a function. 
 All we need to do is provide values for each of the constants in the order they were defined.

 As you can see, both "red" and "wings" originate from the same "Album" struct. However, once we create them, 
 they exist as separate entities, much like when we create two distinct strings.

 This becomes evident when we call the "printSummary()" function on each struct because this function 
 references the "title," "artist," and "year" constants. In both instances, the correct values are displayed
 for each struct. For example, "bestOfTheBeast" prints "Best of the Beast (1996) by Iron Maiden," while
 "aceOfSpades" prints "Ace of Spades (1980) by Motörhead." Swift intelligently recognizes that when
 "printSummary()" is called on "bestOfTheBeast," it should use the "title," "artist," and "year" constants
 specific to "bestOfTheBeast."

 Things get even more intriguing when you want to work with values that can change over time. For instance, 
 you could create an "Employee" struct that can manage vacation days as needed:
 */

struct Employee {
    let name: String
    /*
     Here's a helpful tip: When you provide a default value to a constant property, Swift will eliminate
     that property from the initializer altogether. If you want to set a default value while still allowing
     the option to change it when necessary, you should use a variable property.
     */
    var holidaysRemaining = 28
    
    /*
     func takeHolidays(days: Int) {
     Here's the deal: when we create an "Employee" as a constant using "let," Swift treats the employee and 
     all its associated data as constant. This means we can call functions on the employee without any issues,
     but those functions shouldn't be allowed to modify the data inside the struct because we've declared it
     as constant.

     To work around this, Swift requires us to take an additional step. Functions that only read data are 
     perfectly fine as they are. However, if a function needs to modify data that belongs to the struct,
     we must indicate this intention with a special keyword called "mutating." It looks like this:
     */
    mutating func takeHolidays(days: Int) {
        if holidaysRemaining > days {
            holidaysRemaining -= days
            print("I am going on holidays!")
            print("Hello \(name), you still have \(holidaysRemaining) days accrued remaining of holidays.")
        } else {
            print("I am sorry \(name), there are not enough days accrued.")
        }
    }
}

/*
 Now, our code will compile without any issues, but Swift will prevent us from calling the 
 "takeHolidays()" function on constant structs.

 In code, this behavior is acceptable:
 */
var lucas = Employee(name: "Lucas Rodriguez", holidaysRemaining: 25)
/*
 However, if you change "var rodriguez" to "let rodriguez," you'll encounter an issue again. 
 Swift will refuse to build your code because we're attempting to call a mutating function on a
 constant struct, which is not allowed.

 Before we dive into an in-depth exploration of structs in the upcoming chapters, it's essential 
 to introduce some terminology:

 Variables and constants that are part of structs are referred to as properties.
 Functions that are associated with structs are known as methods.
 When we create a constant or variable based on a struct, we call it an instance. For instance, 
 you could create multiple distinct instances of the Album struct.
 To create instances of structs, we use an initializer like this: Album(title: "Ace of Spades", 
 artist: "Motorhead", year: 1980).
 This last concept might seem a bit unusual initially because it appears as though we're treating 
 our struct like a function and passing in parameters. This is partly what's known as "syntactic
 sugar." Swift essentially generates a special function inside the struct called "init()," using
 all the struct's properties as its parameters. Consequently, it automatically treats these two
 code snippets as equivalent:
 */
var rodriguez = Employee.init(name: "Andre Rodriguez", holidaysRemaining: 14)
lucas.takeHolidays(days: 8)
rodriguez.takeHolidays(days: 5)
print(rodriguez.holidaysRemaining)
print(lucas.holidaysRemaining)

var arteaga = Employee.init(name: "Graciela Arteaga")
arteaga.takeHolidays(days: 7)

/*
 -- How to compute property values dynamically --
 
 Structs can include two types of properties: "stored properties" and "computed properties." 
 A "stored property" is a variable or constant that stores specific data within an instance
 of the struct. On the other hand, a "computed property" dynamically calculates its value each
 time it's accessed. This means that computed properties combine the features of both stored
 properties and functions: you access them like stored properties, but they function like functions.

 To illustrate, consider our previous example of an "Employee" struct now as Staff, which could keep
 track of the remaining vacation days for an employee.
 */
struct Staff {
    let name: String
    var holidaysAccrued = 14
    var holidaysTaken = 0
/*
 The current implementation of the struct works for basic purposes. However, we are losing valuable 
 information in the process. We assign an employee 14 days of vacation and subtract them as
 days are taken, but this approach results in the loss of the original grant of days.
 
 This concept is quite powerful: on the surface, it appears like we're reading a regular property, 
 but in the background, Swift is executing code to calculate its value each time.

 However, we can't write to it at this point because we haven't informed Swift how to handle that. 
 To enable writing to such properties, we need to provide both a "getter" and a "setter" - these are
 fancy names for the "code that reads" and the "code that writes," respectively.
 */
    var holidaysRemaining: Int {
        /*
         In this scenario, the getter is straightforward because it involves our existing code.
         However, the setter poses an interesting question. When you set the "holidaysRemaining"
         for an employee, do you intend to increase or decrease their "holidaysAccrued" value,
         or should "holidaysAccrued" remain unchanged while we adjust "holidaysTaken" instead?
         */
        get {
            //To address this, we can modify the struct to use a computed property, like this:
            holidaysAccrued - holidaysTaken
        }
        set {
            holidaysAccrued = holidaysTaken + newValue
        }
    }
}

var skywalker = Staff.init(name: "Anakin Skywalker", holidaysAccrued: 14)
skywalker.holidaysTaken += 4
skywalker.holidaysRemaining = 5
print(skywalker.holidaysAccrued)

/*
 Observe how "get" and "set" are markers for distinct pieces of code that execute when reading
 or writing a value. What's particularly noteworthy is "newValue" – Swift automatically provides
 this variable, and it holds whatever value the user attempted to assign to the property.
 */


struct Game {
    var titles = [String]() {
        willSet {
            print("All Games title right now are: \(titles)")
            print("This is now the new list of games: \(newValue)")
        }
        didSet {
            print("The amount of Game title included are/is: \(titles.count).")
            print("The amount of Games were \(oldValue) before new purcharse.")
        }
    }
}

var newGames = Game()
newGames.titles.append("The Lengend of Zelda, Breath of the Wild")
newGames.titles.append("God of War, Raganarok")
newGames.titles.append("Resident Evil")
