import SwiftUI

/* BOOLEAN that came from George Boole, an English mathematician
 who spent time of his life researching and writting about logic.
 
 -> Boolean is a data type to store logical values that is only
 accept two kind of values, TRUE or FALSE. This type of data is
 commonly used to do some logical tests, as 'if it contain', yes
 or no and so...
 Some examples of boolean data:
 */

let contain: Bool = true
let exist: Bool = false

// Another examples of logical are on some functions

let fileExtension = "newProject.swift"
print(fileExtension.hasSuffix(".swift"))

let number = 150
print(number.isMultiple(of: 4))

/* Two more ways to represent logical data are '!' (exclamation mark)
 as the only operator valid for logical values, that represent the
 inversion of one result, false to true, or true to false.
 
 The second way to flip the result of a logical result is the use
 of one function called 'toggle()' that also flip the result of a
 logical operation.
 */

var isTrue = true
isTrue = !isTrue
print(isTrue)

var passExams = true
print(passExams)

passExams.toggle()
print(passExams)


// INTERPOLATION OF ANY TYPE

/* When using Swift we can use the interpolation, this means we can
 join one String to another using the signal (+), however, the use
 of the + signal does not work if we are working with different types
 of data, in this case you will need to force the conversion of type.
 To avoid the conversion of type one thing we can do is inside of
 the double quotes, we can include \() backslash and parentheses to
 include variables and constants without needed to convert any type.
 */

let firstName = "George "
let surname = "Lucas"
let starWarsDirector = firstName + surname
print(starWarsDirector)
print("") // To break one line

let text = "Some example how to \"include\" double quotes inside a String." // Using backslash before the internal double quotes.

let firstStarWarsMovie = 1977

let StarWars = """
    The first Star Wars film was launched
    in \(firstStarWarsMovie), called \"A new Hope\".
    The director of this film was \(firstName)\(surname),
    great director that was involved for soo many
    years on Star Wars industrie.
"""
print(StarWars)
print("")

// Convesion Celsius to Fahrenheit

var celsius: Double = 22.0
var fahrenheit = ((celsius * 9) / 5) + 32
var temperature = """
    The temperature in celsius is \(celsius)°C,
    converting it to Fahrenheit, the temperature
    is \(fahrenheit)°F.
"""
print(temperature)
