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
print()

/*
 In the example below, when you want to run your code a certain
 number of times using a range, but you don't actually want the
 loop variable - you don't want "i" or "j", because you don't use it.
 For this, you can replace the loop variable with an underscore:
 */

var robotTilt = "I am switching on my system"

for _ in 1...5 {
    robotTilt += " system"
}

print(robotTilt + "...")

/*
 Another way to show intervals range is represented like this,
 "1...", this means you are trying to count from 1 to the end
 of your Array for example if you don't know how many items
 have included in your Array.
 */

let range: ClosedRange = 0...10
print(range.first!) // 0
print(range.last!) // 10

/*
 A closed range operator going from a...b defines a range that includes
 both a and b in which a must not be greater than b.
 The closed operator is useful if you’d like to use all the values.
 For example, if you’d like to iterate over all elements of a collection:
 */

let names = ["Andre", "Graci", "Lucas"]
for index in 0...2 {
    print("Name \(index) is \(names[index])")
}
// Name 0 is Andre
// Name 1 is Graci
// Name 2 is Lucas

print(names[0...2])

/*
 A one-sided range operator only defines one side of the bounds, for example,
 a... or ...b. A one-sided range goes as far as possible in one direction
 */

print(names[1...])
print(names[...1])

