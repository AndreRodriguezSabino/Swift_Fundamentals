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

enum TransportationOption {
    case airplane, helicopter, bicycle, car, scooter
}

var chosenTransport = TransportationOption.airplane

if chosenTransport == .airplane || chosenTransport == .helicopter {
    print("It is a good day to fly!")
} else if chosenTransport == .bicycle {
    print("Let's go for a cycling!")
} else if chosenTransport == .car {
    print("Today is d the day to get stuck in the traffic...")
} else {
    print("Probably today I will rent a scooter.")
}

/*
 SWITCH condition: Switch lets us check individual cases one
 by one. In case of an Enum, it knows all possible cases the
 Enum can have, so if we miss one or check one twice it will
 complain.
 */

enum seasonOfTheYear {
    case spring, summer, autumn, winter
}

var forecast = seasonOfTheYear.summer

switch forecast {
case .summer:
    print("On \(forecast), the weather is really hot!")
case .autumn:
    print("On \(forecast), the weather is fine and lot of leaves fall from the trees.")
case .spring:
    print("On \(forecast), new flowers just coming out!")
case .winter:
    print("On \(forecast), the weather is really cold!")
}

/*
 SWITCH statements must be exhaustive - you must ensure all
 possible values are covered. If you're switching on a string
 then cleary it's not possible to make an exhaustive check of
 all possible strings because there is an infinite number, so
 instead we need to provide a default case - code to run if
 none of the other cases match.
 The DEFAULT: it will be run if all cases have failed to match.
 Swift checks its cases in order and runs the first one that
 matches. If you place DEFAULT before any other case, that case
 is useless because it will never be matched and Swift will
 refuse to build your code.
 */

let EnglandCapital = "London"

switch EnglandCapital {
case "Oxford":
    print("Here in Oxford is a city the has history with the University and Harry Potter films.")
case "Cambridge":
    print("Cambridge is also known for its University.")
case "Dover":
    print("Dover is known for its country borders, eurotunnel and swimmers who cross the channel to France.")
case "London":
    print("London, is the England capital. With some amazing places and great restaurants.")
default:
    print("Probably you are outside of England")
}
print("")

/*
 If your intention if for Swift to continue executing folllowing
 cases, you can employ FALLTHROUGH. Although infrequently utilized,
 there are occasions - albeit rare - when this approach can assist
 in preventing redundant tasks.
 */

let countDownRocket = 10
print("The count down for the rocket launch has just started...")

switch countDownRocket {
case 10:
    print("Ten!!")
    fallthrough
case 9:
    print("Nine!!")
    fallthrough
case 8:
    print("Eight!!")
    fallthrough
case 7:
    print("Seven!!")
    fallthrough
case 6:
    print("Six!!")
    fallthrough
case 5:
    print("Five!!")
    fallthrough
case 4:
    print("Four!!")
    fallthrough
case 3:
    print("Three!!")
    fallthrough
case 2:
    print("Two!!")
    fallthrough
case 1:
    print("One!!")
    fallthrough
default:
    print("Blast off!!!")
}
print("")

/*
 TERNARY CONDITIONAL OPERATOR
 There's a final method for evaluating conditions in Swift,
 and upon encountering it, you mighgt find yourself pondering
 its utility.
 This alternative is referred to as the ternary conditional
 operator. To comprehend the nomenclature, it's essential
 to be familiar with the fact that symbols like +, -, ==, and
 the like are classified as binary operators since they operate
 on two input elements. For instance, the operation 3 + 9
 involves the numbers 3 and 9.
 
 Conversely, ternary operators operate on three input elements.
 As a matter of fact, given that the ternary conditional operator
 stands as the sole ternary operator in Swift, it's frequently
 denoted simply as "the ternary operator".
 
 But enough about terminology; what precisely does it achive?
 Essentially, the ternary operator empowers us to assess a
 condition and yield one two values: one value if the condition
 holds true, and another value if it doesn't.
 For example:
 */

let minimumAgeToDrink = 18
let canDrink = minimumAgeToDrink >= 18 ? "Yes!" : "No!"
print(canDrink)
