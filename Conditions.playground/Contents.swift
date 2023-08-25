import Cocoa

/*
 In Swift programs very often make choices:
 - Like if something is bigger than other
 - If a student pass the exams checking the results
 - If something contains in another
 
 Swift handles these with IF statements, which let us
 check a condition and run some code if the conddition
 is true. They look like this, see below:
 */

var score: Int = 8

if score >= 7 {
    print("Well done, your score was \(score) and you pass the exams!!")
}

/*
 -> The condition starts with IF, which signals to Swift we want to check
 some kind of condition in our code.
 -> The 'SCORE >= 7' part is where we write our condition.
 -> If the condition is true - if the score really is over than 7 - then
 we print the PRINT message.
 
 Our code uses symmbols called braces - opening and closing braces, also
 we can hear curly braces or curly brackets.
 These braces are used constantly in Swift and other programming languages
 to mark a block of code. Inside of the code block we can include as much
 code as we find necessary for the functionality of our program.
 
 When using >< symbols these are a comparasion operator, because it
 compares two things and return a Boolean result.
 
 Another example, if adding a number to an Array makes it contain more than
 3 items, remove the oldest one. Let's use 'append()', count', and remove(at:),
 so we can now pull all three together with a condition like you can see below:
 */

// Making an Array with 3 numbers
var addNumbers: Array<Int> = [9, 56, 16]

// Adding numbers
addNumbers.append(37)

// Condition
if addNumbers.count > 3 {
    addNumbers.remove(at: 0)
}

// Display the results
print(addNumbers)

/*
 Here we have some examples of comparasion operators that are will be very
 often on our Condition functionality:
 
 1- (>) Greater than
 2- (<) Less than
 3- (==) Equal to
 4- (!=) It is not equal to (different)
 5- (||) Symbol to be used as OR
 6- (&&) Symbol to be used as AND
 
 All these symbols above we can combine between them.
 */

let job = "Manager"

if job == "Manager" {
    print("this is the new \(job) in this company!")
}

if job != "Supervisor" {
    print("The \(job) will try to sort this out.")
}

// User name checks

// Creating a user name
var userName = "Oxford##"

// Checking if user name is empty
if userName.count == 0 {
    userName = "Anonymous"
}

// Displaying it
print("Welcome, \(userName)!")

var userName2 = ""

if userName2.isEmpty {
    userName2 = "Anonymous"
}
print(userName2)
