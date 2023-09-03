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
