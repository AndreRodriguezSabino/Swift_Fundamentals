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

