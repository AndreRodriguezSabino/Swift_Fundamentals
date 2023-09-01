import Cocoa

/*
 << FOR LOOP >>
 
 Computers excel ate carrying out repetitive tasks, and Swift
 simplifies the process of iterating over code a set number of
 times or for each item within an array, dictionary or set.
 */

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift is the official programming language on \(os)")
}

/*
 The code above operates by iterating through each item in the
 "platforms" collection and placing them one by one into a variable
 called "os". It's important to note that we haven't previously
 defined "os"; it's automatically created for us as part of the loop
 and is only accessible within the curly braces that mark the beginning
 and the end of the loop.
 
 Within these curly braces, we specify the code we want to execute
 for each item in the collection. In this instance, the provided
 code will produce four lines of output, each corresponding to an
 item in the loop. Initially, it assigns "iOS" to the "os" variable
 and then calls the "print()" function. It subsequently repeats
 this process for "macOS", "tvOS" and "watchOS".
 
 For the clarity, we assign common terms to these elements:
 
 1- The code enclosed within the curly braces referred to as the
 "loop body".
 2- A single run through the loop body is known as a "loop iteration"
 3- "os" is termed the "loop variable". It's confined solely to the
 scope of the loop body and assumes a new value with each subsequent
 loop iteration.
 
 Next example we can see a loop using numbers intervals. Please
 see it below:
 */

for i in 1...10 {
    print("3 X \(i) = \(3 * i)")
}
print()

// In the example above 1...10 means, in an interval of 1 to 10.
 
for i in 1...10 {
    print("7 X \(i) = \(7 * i)")
}
print()

// You can also put loops inside loops, called nested loops:

for i in 1...10 {
    print("The \(i) times table:")
    for j in 1...10 {
        print(" \(i) X \(j) = \(j * i)")
    }
    print()
}

/*
 On Swift we can use a different way of range that counts up to
 but excluding the final number: "..<". You can see it below:
*/

for i in 1..<15 {
    print("Counting up to \(i)")
}
