import SwiftUI

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

/*
 Swift's labeled statements are like nametags for specific sections of our code.
 They are particularly handy when we need to escape from nested loops.

 To better understand how they work, let's dive into an example involving
 unlocking a safe with a combination of movements. Imagine we have an array
 representing all the possible movements:
 */

let options = ["up", "down", "left", "right"]

//For the purpose of testing and experimentation, here's the hidden combination we're attempting to guess:
let secretCombination = ["up", "up", "right",]

/*
 To discover the secret combination, we have to create arrays that encompass all
 potential three-color variations. These variations include sequences like:

 - up, up, up
 - up, up, down
 - up, up, left
 - up, up, right
 - up, down, left
 - up, down, right
 ...and so on.
 
 To achieve this, we can write three loops, with one loop nested inside another,
 to systematically generate these combinations.
 */
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
                print("Trying: \(option1), \(option2), \(option3)")
                let attempt = [option1, option2, option3]
                
                if attempt == secretCombination {
                    print("The combination is \(attempt)!")
                    break outerLoop
                }
        }
    }
}

/*
 This involves repeatedly going through the same items to build an attempt array,
 and if this attempt matches the secret combination, a message is displayed.
 
 Those three loops come to a halt immediately when they discover the combination
 we're seeking. In this simple example, the impact on performance may not be significant.
 However, imagine if you were dealing with hundreds or even thousands of items.
 In such cases, it becomes crucial to conserve computational effort like this.
 Remember this concept for your own coding adventures—it can be a valuable optimization
 technique.
 */
