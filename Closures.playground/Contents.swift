import Cocoa

// CLOSURES

/*
 Here, we have a simple function that's defined and then called. Afterward,
 we make a duplicate of that function and call the duplicate. As a result,
 the same message will be printed twice.

 An important thing to note is that when you're making a copy of a function,
 you shouldn't include parentheses after it. It should be written as
 "var copyGreetings = greetings" and not "var copyGreetings = greetings()".
 If you add the parentheses, you'll actually call the function and assign
 its return value to something else.
 */
func greetings() {
    print("Hello, world!!!")
}
var copyGreetings = greetings
copyGreetings()


/*
 What if you want to avoid creating a separate function and instead directly assign 
 some functionality to a constant or variable? Well, it's possible in Swift, and it's
 called a "closure expression." Essentially, it's a fancy way of saying we're creating
 a closure—a piece of code that we can pass around and call whenever we need it.
 This closure doesn't have a name, but it works like a function without parameters,
 and it doesn't return a value.

 Now, if you want the closure to accept parameters, it's a bit special. Unlike regular 
 functions that define parameters and return values outside of curly braces, closures
 put everything inside those braces. Here's where you'll notice a keyword:
 "in." It follows the parameters and return type, marking the end of that section.
 Everything after "in" is the body of the closure itself.
 There's a reason for this syntax, and you'll see why it's necessary soon.

 But you might be wondering, "Why do I even need these closures?" I get it; 
 closures can seem quite abstract and complex, especially when you're first
 introduced to them. Many people struggle with closures initially because they
 appear intricate and potentially useless.

 However, closures are incredibly useful, and you'll encounter them extensively in Swift, 
 especially in SwiftUI. You'll use closures in almost every SwiftUI app you build,
 sometimes dozens or even hundreds of times. While they may not always look exactly
 like the example above, closures are a fundamental part of Swift programming.

 To grasp why closures are so valuable, let's start by introducing the concept of "function types." 
 You're familiar with types like "Int" for integers and "Double" for decimals, right? Well,
 functions also have types, and we'll explore that next.
 */
let SayHello = {(name: String) -> String in
    "\(name), welcome to Swift."
}
print(SayHello("Lucas"))

/*
 Let’s take the greetUser() function we wrote earlier: it accepts no parameters, returns no value,
 and does not throw errors. If we were to write that as a type annotation for greetCopy, we’d write this:
 */
func greetUser() {
    print("Some example")
}
var greetCopy: () -> Void = greetUser

/*
 Let's simplify this concept:

 1 - When you see empty parentheses (), it indicates a function that doesn't take any inputs (parameters).

 2 - The arrow -> signifies, much like when you define a function, that we're specifying 
 the type of value the function will return.

 3 - In this case, "Void" means the function doesn't return anything – it's like saying "nothing." 
 You might sometimes encounter this represented as (), but we usually avoid that because it can
 be confused with an empty parameter list.

 4 - Keep in mind that a function's type depends on the data it receives and sends back. 
 Sounds straightforward, right? However, there's a subtle detail: the names of the data it
 receives are not a part of the function's type.
 */

func UserData(for id: Int) -> String {
    if id == 1986 {
        return "Andre Rodriguez"
    } else {
        return "Anonymous"
    }
}
let data: (Int) -> String = UserData
let user = data(1986)
print(user)



let team = ["Andre", "Graci", "Lucas", "R2-D2", "C3PO"]
let sortedNames = team.sorted()
print(sortedNames)

/*
func teamCaptain(name1: String, name2: String) -> Bool {
    if name1 == "Lucas" {
        return true
    } else if name2 == "Lucas" {
            return false
    }
    return name1 < name2
}
*/

let teamCaptainName = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Lucas" {
        return true
    } else if name2 == "Lucas" {
        return false
    }
    return name1 < name2
})
print(teamCaptainName)
