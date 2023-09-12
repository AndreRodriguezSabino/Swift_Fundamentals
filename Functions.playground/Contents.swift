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
