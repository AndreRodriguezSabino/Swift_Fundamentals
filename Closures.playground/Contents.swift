import SwiftUI

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
/*
 Initially, it's straightforward: we have a function that takes an integer and returns a string.
 However, when we make a copy of this function, the copied function type doesn't include the
 external parameter name. So, when we call the copy, we use "data(1986)" instead of "data(for: 1986)."
 */


/*
 The "sorted()" function gives us the ability to use our own custom sorting logic.
 This custom sorting function needs to take two strings as input and return "true"
 if the first string should come before the second in the sorted order, or "false"
 if the first string should come after the second. If Lucas were in charge,
 the function would be like this:
 */

let team = ["Andre", "Graci", "Lucas", "R2-D2", "C3PO"]
let sortedNames = team.sorted()
print(sortedNames)

/*

 If the first name is "Lucas," we return "true" to sort "name1" before "name2." Conversely, 
 if "name2" is "Lucas," we return "false" to sort "name1" after "name2."
 If neither name is "Lucas," we default to using the "<" operator for a standard
 alphabetical sort.

 In summary, you can pass a custom sorting function to the "sorted()" function, 
 as long as that function a) takes two strings as input, and b) returns a Boolean.
 "sorted()" can then use this function to determine the sorting order.
 
func teamCaptain(name1: String, name2: String) -> Bool {
    if name1 == "Lucas" {
        return true
    } else if name2 == "Lucas" {
            return false
    }
    return name1 < name2
}
 
 The beauty of closures is that we can seamlessly combine them with the requirements 
 of functions like "sorted()." "sorted()" simply needs a function that can take two
 strings and return a Boolean. It doesn't matter if that function is formally created
 using "func" or provided on the spot using a closure.

 So, instead of passing the "teamCaptainName()" function to "sorted()", 
 we can use a closure. We open with a curly brace, define its parameters and return type,
 add "in," and then write our standard function code inside it.

 I understand this might initially feel challenging. It's not because you're not smart 
 enough or not cut out for Swift programming; it's simply because closures can be
 quite complex. Don't worry – we'll explore ways to make this concept more approachable!

 Alright, let's write some new code that uses a closure to call "sorted()":
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

/*
 I understand that this might seem like a lot of new syntax to digest all at once, 
 but I want to assure you that it will become easier to understand. In the very next chapter,
 we'll explore techniques to make the code more concise and easier to follow.

 But for now, let's break down what's happening in this code:

 1 - We're still using the "sorted()" function just like before.

 2 - Instead of passing in a regular function, we're passing a closure. Everything from the 
 opening brace (after "by:") down to the closing brace on the last line belongs to this closure.

 3 - Inside the closure, we specify the two parameters that "sorted()" will provide us, 
 which are both strings. We also declare that our closure will return a Boolean value.
 Then, we mark the start of the closure's code by using the "in" keyword.

 4 - Everything else within the closure is just standard function code.
 */

/*
 TRAILING CLLOSURES SYNTAX
 
 As a reminder, the "sorted()" function can accept any kind of function for custom sorting, 
 with one important rule: that function must take two items from the array (in this case,
 two strings) and return a Boolean set to "true" if the first string should come before
 the second.

 To be crystal clear, this function must adhere to these rules. If it doesn't return 
 anything or if it only accepts one string, Swift won't let us build our code.

 Now, think about this: in the code we provided, the function we pass to "sorted()" 
 must deal with two strings and return a Boolean. So, why do we need to specify the
 types of our two parameters and the return type in our closure?

 The answer is simple: we don't. There's no need to specify the parameter types because 
 they must be strings, and we don't need to specify the return type because it must
 be a Boolean.
 */

let TheBigBangTheoryNames = ["Sheldon", "Leonard", "Rajesh", "Howard", "Penny", "Amy", "Bernadette", "Stuart"]
let sortedBigBang = TheBigBangTheoryNames.sorted()
print(sortedBigBang)

//Swift allows special syntax called trailing closure syntax. It looks like this:
let SheldonFirst = TheBigBangTheoryNames.sorted{name1, name2 in
    if name1 == "Sheldon" {
        return true
    } else if name2 == "Sheldon" {
        return false
    }
    return name1 < name2
}

let firstName = SheldonFirst
print(firstName)

/*
 Instead of passing the closure as a parameter, we directly begin the closure itself. 
 In doing so, we remove "(by:" from the beginning and the closing parenthesis at the end.
 This structure helps keep things tidy and logical because if the parameter list and "in"
 were outside, it would look even more confusing.

 Now, there's one more way Swift simplifies closures: it can automatically give us parameter 
 names using shorthand syntax. With this shorthand, we no longer need to write "name1"
 and "name2"; instead, we rely on Swift's predefined values, "$0" for the first string
 and "$1" for the second.

 By using this syntax, our code becomes even more concise:
 */

let AmyFirst = TheBigBangTheoryNames.sorted{
    if $0 == "Amy" {
        return true
    } else if $1 == "Amy" {
        return false
    }
    return $0 < $1
}

let AmyNow = AmyFirst
print(AmyNow)

/*
 When we're working with values that we use more than once, it makes sense.
 However, if our "sorted()" call is simpler, such as when we only want to
 perform a reverse sort, I would do this:
 */

let reversePeopleOrder = TheBigBangTheoryNames.sorted {
    return $0 > $1
}

/*
 The "in" keyword is crucial; it indicates the conclusion of the parameters and return type, 
 leaving everything that follows as the body of the closure. There's a purpose behind this
 structure, and you'll understand it shortly.

 In the example below, I've reversed the sorting order from "<" to ">", and now that we've 
 simplified the code to a single line, we can eliminate the "return" keyword,
 making it incredibly concise:
 */

let reverseEverybody = TheBigBangTheoryNames.sorted{$0 > $1}
let everyoneReversed = reverseEverybody
print(everyoneReversed)

/*
 There aren't strict rules for when to use shorthand syntax and when not to, but as a guideline, 
 I typically use shorthand syntax unless one of the following conditions is met:

 1 - The closure's code is lengthy.
 2 - We use "$0" and similar placeholders more than once each.
 3 - There are three or more parameters (e.g., "$2," "$3," and so on).
 If you're still not convinced about the usefulness of closures, let's explore two more examples.

 First, we have the "filter()" function, which allows us to apply some code to every item in an 
 array and create a new array containing items for which the code returns "true." For instance,
 we can find all team players whose names start with "S" like this:
 */

let onlyS = TheBigBangTheoryNames.filter{$0.hasPrefix("S")}
print(onlyS)
/*
 This code will output ["Sheldon", "Stuart"] because those are the only two team members whose 
 names start with "T."

 Now, let's move on to the second example. The "map()" function allows us to modify each item 
 in an array using our own custom code and returns a new array containing all the modified items:
 */

let UppercasedCharacters = TheBigBangTheoryNames.map{$0.uppercased()}
print(UppercasedCharacters)

/*
 This code will print ["SHELDON", "LEONARD", "RAJESH", "HOWARD", "PENNY", "AMY", "BERNADETTE", "STUART"] 
 because it has transformed each name into uppercase and generated a new array with the results.

 Quick tip: When working with "map()", the type of data you return doesn't have to be the same as the 
 type you started with. For instance, you could convert an array of integers into an array of strings.

 As I mentioned earlier, you'll frequently use closures in SwiftUI:

 1 - When you create a list of data on the screen, SwiftUI will ask you to provide a function that takes 
 one item from the list and converts it into something that can be displayed on the screen.

 2 - When you create a button, SwiftUI will request one function to execute when the button is pressed 
 and another to generate the contents of the button, which could be an image, text, and more.

 3 - Even arranging pieces of text vertically is done using a closure.

 You could certainly create separate functions every time SwiftUI requires these, but believe me, 
 you won't. Closures make this kind of code feel entirely natural, and you'll be amazed at how SwiftUI
 leverages them to create elegantly simple and clean code.
 */


/*
 ACCEPTANCE FUNCTIONS AS PARAMETERS
 
 There's one more aspect of closures I'd like to cover: how to write functions that can take other
 functions as arguments. This skill is particularly valuable when working with closures due to trailing
 closure syntax, but it's a useful ability to have in general.
 
 Here's a function that creates an array of integers by repeatedly executing another function a specified
 number of times:
 */

func makeArray(size: Int, using generartor: () -> Int) -> [Int]{
    var number = [Int]()
    
    for _ in 1..<size {
        let newNumber = generartor()
        number.append(newNumber)
    }
    return number
}
/*
 Let's break down how this works:

 1 - We have a function named "makeArray()" that accepts two parameters: the first one specifies the number
 of integers we want in the array, and the second parameter is a function. This function doesn't take
 any parameters but will return an integer each time it's called. "makeArray()" itself returns an array
 of integers.

 2 - Inside "makeArray()", we start by creating an empty array to hold our integers.

 3 - We then enter a loop that repeats as many times as specified.

 4 - In each iteration of the loop, we call the generator function that was passed as a parameter.
 This function generates and returns a single integer, which we add to the "numbers" array.

 5 - Finally, once the loop has run its course, we return the filled-up array of integers.

 In essence, the core of "makeArray()" is quite straightforward: it repeatedly calls a function 
 to produce integers, collects those integers into an array, and ultimately returns that array.
 
 I understand that this code might appear a bit complex with multiple sets of parentheses and 
 return types. Let's break it down into a linear reading:

 1 - We're defining a new function.

 2 - This function is named "makeArray()".

 3 - It takes two parameters:

 • The first parameter is an integer named "size."
 • The second parameter is a function called "generator," which doesn't take any parameters but
 returns an integer.
 
 4 - In the end, the entire "makeArray()" function returns an array of integers.
 */

/*As a result, we can create arrays of integers of any size by providing a function that specifies
 how each number should be generated:
 */
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

/*
 And remember, you can achieve the same functionality using regular functions as well.
 So, you could write code like this:
 */
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)
/*
 This code will invoke "generateNumber()" 50 times to populate the array.

 As you learn Swift and SwiftUI, there will be only a few occasions when you'll need to understand 
 how to accept functions as parameters. However, now you have a basic understanding of how it
 functions and its significance.

 Before we move on, there's one more thing to cover: you can make your function accept multiple 
 function parameters if needed. In such cases, you can specify multiple trailing closures.
 This syntax is quite common in SwiftUI, so it's essential to provide you with a glimpse of it here.
 */

/*
 To illustrate this, here's a function that takes three function parameters, and each of these
 functions doesn't take any parameters and doesn't return anything:
 */
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to do the first work...")
    first()
    print("About to do the second work...")
    second()
    print("About to do the third work...")
    third()
}

/*
 I've included additional "print()" statements to simulate specific tasks being performed between 
 the calls to "first," "second," and "third."

 When calling this function, the first trailing closure follows the same pattern as what we've 
 used previously. However, the second and third closures are formatted slightly differently:
 you close the brace from the previous closure, then specify the external parameter name followed
 by a colon, and then open another brace for the next closure. Here's the code structure:
 */
doImportantWork {
    print("First work done.")
} second: {
    print("Second work done.")
} third: {
    print("Third work done.")
}

/*
 Having three trailing closures is not as unusual as you might think. In SwiftUI, for instance,
 creating a section of content requires three trailing closures: one for the content itself,
 one for a header to be placed above it, and one for a footer to be placed below it.
 */
