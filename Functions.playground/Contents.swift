import Cocoa

/*
 When you've crafted a piece of code that you find particularly useful
 and want to reuse it multiple times, it's a good idea to encapsulate
 it within a function. Functions are essentially isolated segments of
 code that you extract from the main program and assign a name to,
 making it convenient to call and use them whenever needed.
 
 Function's "call site," which is a formal term that essentially means
 "the location where a function is invoked."

 Now, what do those parentheses serve? Well, that's where we provide
 configuration options for our functions. It's where we pass in data that
 tailors the function's behavior, making it more adaptable and versatile.
 */

func isEven(number: Int) {
    if number.isMultiple(of: 2) {
        print("The number \(number) is even.")
    } else {
        print("The number \(number) is odd.")
    }
}
isEven(number: 5)

/*
 Observe how I've included "number: Int" within the parentheses? This is what
 we call a parameter, and it's where we can customize how our function behaves.
 We're essentially specifying that anyone who uses this function must provide
 an integer value at this spot, and Swift will make sure of it. Once inside
 the function, we can treat "number" as if it were any other constant, allowing
 us to use it as shown within the "print()" statement.
 
 As you can observe, when we invoke the "isEven()" function, we have to explicitly
 state "number: 5." In other words, we include the parameter name as part of the
 function call. This practice might not be typical in some other programming
 languages, but in Swift, it's quite useful as it serves as a reminder of the
 purpose of each parameter.
 
 The number 5 in this case is an argument: This is the value that get sent into
 thefunction to work with, used to fill: number.
 
 Crucial Note: If you like to use the term "argument" for data being sent into a
 function and "parameter" for data received by it, that's absolutely fine. Whether
 you refer to them as "arguments" or "parameters," when instructing Swift to execute
 a function, you must consistently provide the parameters in the same order they
 were originally listed when defining the function. Keep in mind that any data you
 generate within a function is automatically cleared once the function completes
 its execution.
 */

func timeTable(num: Int, end: Int) {
    print("The time table of: \(num)")
    for i in 1...end {
        print(" \(num) X \(i)= \(i * num)")
    }
}
timeTable(num: 7, end: 5)
timeTable(num: 3, end: 6)
timeTable(num: 6, end: 7)
timeTable(num: 8, end: 1)
timeTable(num: 9, end: 10)

/*
 When you want a function to give you a return, follow these two steps in Swift:

 Use an arrow "->" followed by the data type just before the opening brace of your
 function. This tells Swift what kind of return the function will provide.

 Employ the "return" keyword to send back the desired result.

 For instance, imagine you want to simulate rolling a dice in different parts of
 your code. Instead of always assuming it's a 6-sided dice, you can create a function
 like this:
 */

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

/*
 Let's delve into a somewhat more challenging example: how to determine whether two
 strings contain the same letters, irrespective of their order?

 In this scenario, you need to create a function that accepts two string arguments
 and returns true if they both contain the same letters, even if the letters are
 arranged differently. For example, "efg" and "gef" should be deemed equivalent
 because they both include the letters "e," "f," and "g."

 In truth, you already possess sufficient knowledge to solve this problem independently.
 However, you may have overlooked a technique that simplifies this task considerably:
 when you utilize the sorted() function on any string, you obtain a new string with all
 the letters arranged in alphabetical order. Consequently, if you apply this function
 to both strings and compare the results using ==, you can ascertain whether the letters
 are identical, regardless of their sequence.
 */

func findContents(type1: String, type2: String) -> Bool {
    let first = type1.sorted()
    let second = type2.sorted()
    return first == second
}
findContents(type1: "efg", type2: "gef")

/*
 Also can be written without or with the key-word RETURN and doing it you can avoid write to
 much code
*/
func Contents(type1: String, type2: String) -> Bool {
    /* return */type1.sorted() == type2.sorted()
}

/*
 Remember, this only works when your function consists of a single line of code, and, i
 mportantly, that line of code must genuinely return the data you committed to returning.
 */

func pythagoras(a: Double, b: Double) -> Double {
    let math = (a * a) + (b * b)
    let result = sqrt(math)
    return result
}
let hypotenuse = pythagoras(a: 10, b: 16)
print(hypotenuse)

/*
 Returning multiple values
 
 In Swift, there's a solution in the form of tuples. Similar to arrays, dictionaries,
 and sets, tuples allow us to store multiple pieces of data in a single variable.
 However, unlike these other options, tuples have a fixed size and can hold various
 data types.
 */

func setNames() -> (firstName: String, lastName: String) {
    (firstName: "Andre", lastName: "Rodriguez")
}
let myName = setNames()
print("My full name is \(myName.firstName) \(myName.lastName)")

/*
 The example above, our return type is (firstName: String, lastName: String), which is
 essentially a tuple consisting of two strings.
 
 In this tuple, each string has a designated name. These names aren't enclosed in quotes;
 they serve as specific labels for each item within our tuple, unlike the arbitrary keys
 used in dictionaries.

 Inside the function, we construct a tuple that includes all the elements we promised,
 associating them with their respective names. For instance, we set firstName to "Taylor,"
 and so on.

 When we invoke the setNames() function, we can access the values within the tuple using
 these key names, such as firstName and lastName.

 I understand that tuples may appear quite similar to dictionaries, but there are important
 distinctions:

 When you access values in a dictionary, Swift can't be certain in advance whether they exist
 or not. While we might be confident that user["firstName"] will be present, Swift can't make
 that assumption, necessitating the provision of a default value.

 In contrast, when you access values in a tuple, Swift knows in advance that they are available
 because the tuple explicitly specifies their presence.

 Accessing values using user.firstName is not susceptible to typos, unlike dictionary keys,
 which are strings that might lead to errors.

 A dictionary could potentially contain numerous other values alongside "firstName,"
 but in a tuple, we must explicitly list all the values it will contain. Consequently,
 a tuple guarantees the presence of precisely those values and nothing more.

 Therefore, tuples possess a key advantage over dictionaries: they allow us to specify
 precisely which values exist and their data types, ensuring that we always have access
 to the expected data, whereas dictionaries may or may not contain the values we seek.
 
 At times, you might encounter tuples that lack named elements. In such cases, you can
 access the elements within the tuple by using numeric indices, starting from 0.
 Here's how you can do it:
 */

func newName() -> (String, String) {
    ("Lucas", "Rodriguez")
}
let user = newName()
print("Hello, my name is \(user.0) \(user.1)")

/*
 Lastly, if a function returns a tuple, you have the ability to extract and work with
 its individual values if needed.
 */

func people() -> (first: String, second: String) {
    (first: "Graci", second: "Arteaga")
}
//let users = people()
//let firstN = users.first
//let secondN = users.second
let (first, second) = people()
print("Hello, my name is \(first) \(second)")

/*
 Still Above -> This brings us back to the named version of the people() function,
 where we receive a tuple, and then proceed to copy its elements into individual
 variables before utilizing them. In essence, we're simply rearranging the data.
 
 Nonetheless, instead of assigning the entire tuple to the users variable and
 subsequently extracting individual values, we can streamline the process by
 directly unpacking the return value from people() into two distinct constants.
 */

/*
 In fact, if you find that you don't need all the values from the tuple, you can
 take it a step further by using the underscore (_) to signal to Swift that you
 want to disregard that specific part of the tuple:
 */

func allNames() -> (myFirst: String, mySecond: String) {
    ("Luke", "Skywalker")
}
let (myFirst, _) = allNames()
print("I only want to catch the first name here: \(myFirst)")

/*
 - Customizing Parameters Labels -
 
 You've observed that Swift developers prefer to assign names to their function parameters.
 This practice enhances clarity, making it easier to understand the purpose of these
 parameters when the function is invoked. As an example, we can create a function to
 simulate rolling a dice a specific number of times, utilizing parameters to determine
 the number of sides on the dice and the quantity of rolls:
 */

func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 8)

/*
 Even if you revisit this code after six months, you can still easily understand what
 rollDice(sides: 6, count: 8) does.

 Swift places a lot of importance on naming parameters for use outside the function.
 In fact, it uses these names to decide which method to execute. This is different from
 many other programming languages, but in Swift, it's completely valid:
 */

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

/*
 Absolutely, all of these functions are named "hireEmployee()"—but don't worry,
 Swift can figure out which one you're referring to based on the names of the
 parameters you use. To make it easier to tell them apart, you'll often see
 documentation mentioning each function along with its specific parameters,
 like "hireEmployee(name:)" or "hireEmployee(title:)".
 
 Sometimes, though, these parameter names are less helpful, and there are two
 ways I want to look at.

 First, think about the hasPrefix() function you learned earlier:
 */

let lyric = "Hello, world. I am enjoying Swift"
print(lyric.hasPrefix("Hello"))

/*
 When we use the hasPrefix() function, we simply provide the prefix we want to
 check for directly—no need to say something like hasPrefix(string:) or, even worse,
 hasPrefix(prefix:). But why is that?

 Well, when we define parameters for a function, we can actually give them two names:
 one for when we call the function and another for when we use it inside the function itself.
 hasPrefix() does this by specifying _ as the external name for its parameter. In Swift,
 this means "ignore this" and effectively removes the need for an external label for that parameter.

 We can apply the same technique in our own functions if we find it makes the code more readable.
 For example, we previously had this function:
 */

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
//func isUppercase(string: String) -> Bool {
}

let string = "HELLO, WORLD"
//let res = isUppercase(string: string)
let res = isUppercase(string)

/*
 This concept is frequently used in Swift. For instance, consider the append() function used to
 add items to an array or the contains() function used to check if an item exists in an array.
 In both cases, it's quite clear what the parameter is without needing an additional label.

 Now, the second issue with external parameter names arises when they don't quite fit naturally
 when calling the function. You still want to include them, so using _ as a placeholder isn't a
 great choice. Let me illustrate this with another function we discussed earlier:
 
 Imagine saying "print times table for 5" out loud; it's clear and makes sense. However,
 this doesn't work in Swift. Even though "for" is a nice and clear name when calling the function,
 it's not allowed inside the function itself.

 You've already seen that we can use _ before the parameter name to avoid writing an external
 parameter name. The alternative is to provide a second name for the parameter: one for external
 use and one for internal use. This approach results in more readable code when calling the function.

 Here's how it's done:
 */

func printTimesTables(for number: Int) {
    for i in 1...10 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

/*
 There are three important things to pay close attention to here:

 1 - We specify for number: Int: The external name is "for," the internal name is "number," and it's of type Int.
 
 2 - When we call the function, we use the external name for the parameter, like this: printTimesTables(for: 5).
 
 3 - Inside the function, we use the internal name for the parameter, as in print("\(i) x \(number) is \(i * number)").
 
 So, Swift provides two key methods for managing parameter names: we can use _ for the external parameter
 name to indicate that it shouldn't be used, or we can include a second name so that we have both external
 and internal parameter names.

 Tip: I mentioned earlier that technically, the values you pass into a function are called "arguments," and
 the values you receive inside the function are called "parameters." This can get a bit confusing because we
 have both argument labels and parameter names in the function definition. However, for simplicity, I'll be
 using the term "parameter" for both, and when the distinction is crucial, I'll clarify by using "external
 parameter name" and "internal parameter name."
 */
