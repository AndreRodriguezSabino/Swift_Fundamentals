import Cocoa

/*
 WHILE Loop
 
 Swift features another type of loop known as "while." When you specify
 a condition, a while loop will repeatedly carry out its instructions until
 the condition becomes false.

 While loops are still occasionally encountered, they are not as
 prevalent as for loops in the Swift programming language.
 */

var countDown = 10
while countDown >= 0 {
    print(countDown)
    countDown -= 1
}
print("Blast off!!!")

var countUp = 0
while countUp <= 60 {
    print(countUp)
    countUp += 6
}

/*
 While loops come in handy when you're uncertain about the number of times
 the loop needs to run. To illustrate this, I'd like to introduce you to a
 valuable feature shared by Int and Double in Swift: the random(in:) function.
 By providing it with a range of numbers, this function will return a random
 Int or Double value within that specified range.
 */

var id = Int.random(in: 1...500)
var amount = Double.random(in: 0...2)

// create an integer to store the table position
var table = 0

//carry on looping until we reach 6
while table != 6 {
    //roll a new dice and print what it was
    table = Int.random(in: 1...6)
    print("Rolling dice \(table)")
}

/*
 In your coding projects, you will probably use both for and while loops.
 For loops are typically preferred when you have a known quantity of data
 to iterate through, such as a range or an array. Conversely, while loops
 are well-suited when you need to apply a particular custom condition to
 govern the loop's execution.
 */

let colour = ["Blue", "Black", "Grey", "Red"]
var count = 0
while count <= 2 {
    print("The colour chosen was \(colour[count])")
    count += 1
}

var dogs: Int = 0
while dogs < 10 {
    dogs += 1
    print("I'm getting another dog.")
    if dogs == 4 {
        print("Enough dogs!")
        dogs = 10
    }
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

var speed = 50
while speed <= 55 {
    print("Accelerating to \(speed)")
    speed += 1
}

/*
 In Swift, you have two options for skipping one or more items in a loop:
 "continue" allows you to skip the current loop iteration, while "break"
 lets you skip all remaining iterations. Similar to while loops, these features
 are occasionally employed but are less common in practice than you might expect.

 Let's delve into them individually, starting with "continue." When you're
 iterating over an array of data in Swift, the language extracts one item at
 a time from the array and executes the loop body with that item. If you use
 "continue" within the loop body, Swift will promptly halt the current loop
 iteration and proceed to the next item in the loop, where it will continue
 its normal execution. This is frequently employed near the beginning of loops
 to filter out loop variables that do not meet specific criteria you've defined.
 */

let extensionNames = ["Andre.jpg", "examples.txt", "Lucas.jpg", "MyCV.psd"]

for extensionName in extensionNames {
    if extensionName.hasSuffix(".jpg") == false {
        continue
    }
    print("The files found were \(extensionName)")
}

/*
 That creates an array of extension strings, then loops over each one and checks
 to make sure it has the suffix “.jpg” – that it’s a picture. continue is used
 with all the extensions failing that test, so that the rest of the loop body is
 skipped.
 */

// As for break, that exits a loop immediately and skips all remaining iterations.

let num1 = 10
let num2 = 16
var multiple = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: num1) && i.isMultiple(of: num2) {
        multiple.append(i)
        if multiple.count == 10 {
            break
        }
    }
}
print(multiple)
