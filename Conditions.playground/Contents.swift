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
print("")

/*
 Swift also has a sort of condition (multiple condition) for
 some sort of code. For example, if we need to set some code
 up having more than one option on the same block of code, we
 have the ELSE statment, IF some happen you have as a return
 one condition, in case not ELSE we get a different result
 as a return. See some examples below:
 */

var age = 18

if age >= 18 {
    print("With the age of \(age) years old, you are eligible to vote on the next election.")
} else {
    print("With the age of \(age) years old, you are not eligible to vote on the next election.")
    print("Please wait until you turn 18 years old.")
}
print("")

/*
 There's an even more advanced condition called ELSE IF, which lets
 us run a new check if the first one fails. You can have just one
 of these if you want, or have multiple ELSE IF, and even combine
 ELSE IF with an ELSE if needed. However, you can only ever have one
 ELSE, because that means "if all the other condition have been false".
 */

var challenge25 = 21

if challenge25 >= 18 {
    print("Your age is \(challenge25) years old, and with this age you can drink.")
} else if challenge25 >= 16 && challenge25 < 18 {
    print("""
With the age of \(challenge25) years old, you only can have a drink of
one pint of beer, cider or one glass of wine together with someone
that is 18 or older that order the items mentioned before together with
a sustainble meal.
""")
} else {
    print("With the age of \(challenge25) years old, you are not allowed to drink alcohol.")
}
