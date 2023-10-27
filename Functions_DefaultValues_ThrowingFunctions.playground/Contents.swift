import SwiftUI

/*
 When we add parameters to functions, it's like giving the function special
 instructions or options. This allows the function to work with different
 kinds of information based on what we want. Sometimes we want to have these
 options available so we can change how the function works, but other times
 we don't want to worry about it.
 
 That prints any times table, starting at 1 times the number up to any end point.
 That number is always going to change based on what multiplication table we want,
 but the end point seems like a great place to provide a sensible default –
 we might want to count up to 10 or 12 most of the time, while still leaving open
 the possibility of going to a different value some of the time.

 To solve this problem, Swift lets us specify default values for any or all of our
 parameters. In this case, we could set end to have the default value of 12, meaning
 that if we don’t specify it 12 will be used automatically.
 
 See the example below:
 */

func TimeTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print(" \(number) X \(i)= \(number * i)")
    }
    print()
}
TimeTable(for: 5, end: 5)
TimeTable(for: 8)

/*
 See how we can use printTimeTables() in two different ways: we can give it both
 parameters when we need to, but if we simply write printTimeTables(for: 5),
 it will automatically use the default value of 12 for "end."
 */

/*
 When we use removeAll() in Swift, it will remove all the items from an array and
 free up the memory that was used by that array. This is usually what you want
 because you're removing items for a reason. However, there's a special version
 of this function that not only removes the items but also keeps the memory
 capacity of the array intact.

 This is achieved using a default parameter value. There's a parameter called
 keepingCapacity, and its default value is set to false, which means it does the
 sensible thing by default – it clears the array and frees up memory. But if,
 in some rare cases, you want to keep the array's existing memory capacity,
 you can pass in true.

 In simple terms, default parameter values help us make functions flexible
 without making them complicated to use. You only need to specify extra
 parameters when you want something unusual to happen.
*/

var names = ["Andre", "Lucas", "Luke", "Vader"]
names.count
names.removeAll(keepingCapacity: true)
names.count

/*
  <-- Handle Errors in Functions -->
 
 Mistakes and problems occur frequently in programming, such as when you try to read a
 file that doesn't exist or when downloading data fails due to network issues. If we don't
 deal with these issues properly, our code can crash. Therefore, Swift requires us to
 handle errors or, at the very least, acknowledge the possibility of errors occurring.

 This process involves three steps:

 1 - Informing Swift about the potential errors that can occur.
 2 - Creating a function that can detect and report errors when they occur.
 3 - Invoking that function and managing any errors that might arise.
 
 Let's walk through an example: Suppose a user wants us to evaluate the strength of their password.
 We should report a serious error if the password is too short or too easily guessable.

 To begin, we need to define the types of errors that could occur. This means creating a new
 enumeration (enum) that builds upon Swift's built-in Error type, like this:
 */

enum passwordError: Error {
     case short, obvious
}

/*
 This step defines two possible errors related to passwords: "short" and "obvious."
 It doesn't specify the exact criteria for these errors, only that they are potential issues.

 For step two, we create a function that can trigger one of these errors. When an error
 is triggered or "thrown" in Swift, it means something serious went wrong within the function.
 Instead of continuing with normal execution, the function stops immediately and doesn't provide
 any result.

 In our case, we're designing a function to assess the strength of a password. If the password
 is very weak (less than 5 characters or widely known), we'll throw an error right away.
 For all other passwords, we'll return a rating such as "OK," "Good," or "Excellent."

 Here's how this is implemented in Swift:
 */

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw passwordError.short
    }
    if password == "12345" {
        throw passwordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
 
/*
 Let's break down the process:

 1 - If a function can potentially encounter errors but doesn't handle them itself,
 you must declare the function as "throws" before specifying its return type.
 2 - We don't specify the exact type of error that the function might throw, only
 that it has the potential to throw errors.
 3 - Just marking a function with "throws" doesn't mean it must throw errors; it simply
 means that it's allowed to throw them.
 4 - When you want to trigger an error, you use the "throw" keyword followed by one of
 our PasswordError cases. This immediately exits the function, so it won't return a string.
 5 - If no errors are thrown, the function behaves as usual and returns a string.
 This covers the second step of handling errors: we've defined the possible errors and
 written a function that can throw them.

 Now, for the final step of handling errors in Swift:

 1 - You start a block of code where errors might occur by using the "do" keyword.
 2 - When you call one or more functions that can throw errors, you use the "try" keyword to
 indicate that you're aware of the potential for errors.
 3 - You handle any errors that may be thrown using the "catch" keyword.
 In pseudocode, it looks like this:
 
 do {
     try someRiskyWork()
 } catch {
     print("Handle errors here")
 }
 
 Let's dig into this code snippet:

 If the "checkPassword()" function runs without any issues, it will return a value stored
 in the "result" variable, which is then printed out. However, if any errors occur
 (which is the case here), the message about the password rating will never be printed –
 the execution will immediately jump to the "catch" block.

 Now, there's a crucial part of this code that's worth discussing: the "try" keyword.
 It must be used before calling any functions that might throw errors. It serves as a visual
 cue to developers that regular code execution could be interrupted if an error occurs.

 When you use "try," you need to be within a "do" block and ensure that you have one or more
 "catch" blocks ready to handle potential errors. In certain situations, there's an alternative
 called "try!" which doesn't require "do" and "catch" but will crash your code if an error
 is thrown. You should use "try!" sparingly and only if you're absolutely certain that an
 error won't occur.

 When it comes to handling errors, you must always include a "catch" block that can handle
 any type of error.
 */

let password = "12345"
do {
    let result = try checkPassword(password)
    print("Password rate: \(result)")
} catch passwordError.short {
    print("Error Detected. Password too short, please create a longer password.")
} catch passwordError.obvious {
    print("Error Detected. Password easy to find out, please create a more difficult password.")
}
