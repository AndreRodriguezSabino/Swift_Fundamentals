import Cocoa

/*
 Swift strives to be predictable, meaning it encourages us to write code that is safe and operates as expected. 
 You've already encountered throwing functions, but Swift also employs another crucial mechanism for ensuring
 predictability, known as optionals. An optional is a concept that signifies "this thing might have a value or
 might not."

 To witness optionals in action, consider the following code:
 */
var opposite = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]
let peachOpposite = opposite["Peach"]

/*
 Here, we create a dictionary [String: String] with two keys: Mario and Luigi. Subsequently, we attempt to retrieve 
 the value associated with the key "Peach," which doesn't exist, and we haven't provided a default value in case the
 data is missing.

 What will peachOpposite be after that code runs? This is a [String: String] dictionary, meaning keys and values are 
 strings. However, we attempted to read a key that doesn't exist. It wouldn't make sense to get a string back if there
 isn't a value there.

 Swift addresses this with a concept called optionals, indicating data that might or might not be present. Optionals 
 are primarily denoted by appending a question mark after the data type. In this case, peachOpposite would be a String?
 instead of a String.

 Optionals act like a box that may or may not contain something. So, String? means there might be a string waiting inside, 
 or there might be nothing at all – a special value called nil, signifying "no value." Any type of data can be optional,
 including Int, Double, Bool, and instances of enums, structs, and classes.

 You might be wondering, "What has actually changed here? Previously, we had a String, and now we have a String?. 
 How does that impact our code?"

 Here's the key point: Swift aims for predictability, meaning it won't allow us to use data that might not be present. 
 With optionals, this requires us to unwrap the optional before using it – to check inside the box for a value and,
 if present, take it out and use it.

 Swift provides two primary ways of unwrapping optionals, but the one you'll encounter most frequently looks like this:
 */
if let marioOpposite = opposite["Mario"] {
    print("Mario's opposite is \(marioOpposite)!")
}

/*
 The if let syntax is widely used in Swift, and it combines creating a condition (if) with creating a constant (let). 
 Together, it performs three tasks:

 1 - It retrieves the optional value from the dictionary.
 2 - If the optional contains a string, it unwraps the value – meaning the string inside is assigned to the constant 
 marioOpposite.
 3 - The condition succeeds – we successfully unwrapped the optional – so the body of the condition is executed.
 The body of the condition will only execute if the optional had a value inside. Naturally, if you want to include 
 an else block, you can do so. It's a standard condition, so this kind of code is perfectly acceptable:
 */

var username: String? = nil
if let unwrappedName = username {
    print("The name is: \(unwrappedName)")
} else {
    print("There's no name at all! The optional is empty.")
}

/*
 Until now, dealing with optionals might seem a bit theoretical, but they play a crucial role in enhancing the quality 
 of our software. The key distinction is that while optionals signify data may or may not be present, non-optionals
 (regular strings, integers, etc.) assert that data must be available.

 Consider this: having a non-optional Int guarantees there's always a number inside, whether it's 1 million, 0, or any 
 other numeric value. On the contrary, an optional Int set to nil indicates the absence of any value – not 0 or any
 specific number, but truly nothing.

 Likewise, having a non-optional String ensures there is undoubtedly a string present. It might be "Hello" or an empty 
 string, but both scenarios differ from an optional string set to nil.

 This concept extends to all data types, including collections like Array and Dictionary. An array of integers may 
 contain one or more numbers or none at all. Again, this differs from an optional array set to nil.

 To clarify, an optional integer set to nil is distinct from a non-optional integer holding 0, an optional string set 
 to nil is different from a non-optional string set to an empty string, and an optional array set to nil is not the
 same as a non-optional array with no items – we're referring to the absence of any data, whether empty or otherwise.

 You can witness this distinction in action when attempting to pass an optional integer into a function that requires 
 a non-optional integer, like this:
 */

func square(number: Int) -> Int {
    number * number
}

/*
 Swift will reject the compilation of that code because the optional integer needs to be unwrapped. We can't use an 
 optional value where a non-optional is required because, if there were no value inside, we'd encounter an issue.

 Therefore, to utilize the optional, we must first unwrap it, like this:
 
 if let unwrappedNumber = number {
    print(square(number: unwrappedNumber)
 }
 
 Before we conclude, I'd like to bring up one last point: when unwrapping optionals, it's quite common to unwrap them 
 into a constant with the same name. This is completely acceptable in Swift and eliminates the need for naming constants
 like unwrappedNumber or similar.

 With this approach, we could rewrite the previous code like this:
 */

var number: Int? = nil
number = 3
if let number = number {
    print(square(number: number))
} else {
    print("Empty optional.")
}
/*
 This style might seem a bit perplexing at first glance, as if we're delving into the realm of quantum physics – 
 can number truly be both optional and non-optional simultaneously? Well, no.

 What's occurring here is that we're temporarily introducing a second constant with the same name, and it's only 
 accessible within the body of the condition. This phenomenon is known as shadowing and is predominantly employed
 in optional unwraps, as demonstrated above.

 So, inside the body of the condition, we possess an unwrapped value to manipulate – a genuine Int rather than an 
 optional Int?. However, outside the condition, we still have the optional.
 */

/*
 GUARD - unwrapping optional
 
 You've already witnessed how Swift utilizes if let to unwrap optionals, and it's the most frequent method for dealing 
 with optionals. However, there's a second approach that accomplishes nearly the same thing, and it's nearly as common:
 guard let.

 The syntax for guard let looks like this:
 */

func printSquare(for number: Int?) {
    guard let number = number else {
        print("Missing Input!")
        return
    }
    print("\(number) X \(number) is \(number * number)")
}
printSquare(for: nil)

/*
 Similar to if let, guard let assesses whether there's a value within an optional. If a value exists, it extracts the 
 value and assigns it to a constant of our selection.

 However, the method employed by guard let flips the process around. So, if let executes the code within its braces if 
 the optional contains a value, while guard let runs the code within its braces if the optional doesn't contain a value.
 This explains the use of else in the code: "check that we can unwrap the optional, but if we can't, then..."
 
 I understand it might seem like a minor distinction, but it carries significant implications. Guard provides a mechanism 
 to verify whether our program state aligns with our expectations, and if it doesn't, to exit – for instance, to exit from
 the current function.

 This is often referred to as an "early return": we inspect the validity of all the function's inputs right at the beginning 
 of the function, and if any are invalid, we run some code and exit immediately. If all our checks pass, the function can
 proceed as intended.

 guard is specifically designed for this programming style and, in fact, does two things to assist:

 1 - If you use guard to validate a function's inputs, Swift will always require you to use return if the check fails.
 
 2 - If the check passes and the optional being unwrapped contains a value, you can use that value after the guard code
 concludes.
 
 In summary, employ if let when you want to unwrap optionals to process them in some way, and turn to guard let to make 
 sure optionals contain something and exit otherwise.

 Tip: You can use guard with any condition, even those that don't involve unwrapping optionals. For instance, you could 
 use guard someArray.isEmpty else { return }.
 */

/*
 NIL COALESCING
 
 Swift offers a third method for unwrapping optionals – and it's quite handy. It's known as the nil coalescing operator, 
 and it allows us to unwrap an optional while supplying a default value if the optional happens to be empty.

 Let's take a step back:
 */

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"]

/*
 That attempts to read a key that doesn't exist in our captains dictionary, resulting in new being an optional string 
 set to nil.

 Using the nil coalescing operator, denoted by ??, we can assign a default value to any optional, like this:
 */
let newShip = captains["Serenity"] ?? "N/A"

/*
 That code fetches the value from the captains dictionary and tries to unwrap it. If the optional holds a value, it will 
 be extracted and stored in new; otherwise, "N/A" will be used as a fallback.

 This implies that regardless of whether the optional contains a value or is nil, the ultimate outcome is that new will 
 be an actual string, not an optional one. It could be the string retrieved from the captains value, or it might be "N/A".

 Now, I understand your thought process: why not just specify a default value when retrieving from the dictionary? 
 If that's what you're thinking, you're absolutely correct:
 
 let new = captains["Serenity", default: "N/A"]
 
 That achieves precisely the same outcome, which might make it appear that the nil coalescing operator is redundant. 
 However, the power of the nil coalescing operator extends beyond dictionaries; it can be applied to any optionals.

 As an illustration, consider the randomElement() method on arrays, which yields a random item from the array. However, 
 it returns an optional since the array could be empty. Therefore, we can leverage the nil coalescing operator to supply
 a default:
 */

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


 //Alternatively, suppose you have a struct with an optional property, and you wish to offer a reasonable default when it's absent:
 
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

/*
 It's also handy when creating an integer from a string, where you receive an optional Int? because the conversion might have failed – 
 for instance, you might have provided an invalid integer like "Hello." In such cases, we can employ nil coalescing to offer a default
 value, as demonstrated below:
 */

let input = ""
let numbers = Int(input) ?? 0
print(numbers)

/*
 As evident from the examples, the nil coalescing operator proves beneficial whenever you're dealing with an optional and want to 
 utilize the contained value or supply a default if it's absent.
 */
