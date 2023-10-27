import SwiftUI

var greeting = "Hello, world!"
/* VAR is a keyword for a variable creation.
 Variable is a kind of 'container' where you can store data
 for usage on different points of your software, also variables
 can be changed any time with a different data in it, if you declare,
 as for example 'greeting = "Andre". */

let totalDistance_Km = 400
/* LET, also is a keyword for a constant creation unlike variable,
 this means once you set a data up, the data can not be changed
 and if you try to do it you are going to receive an error message
 and your software will stopped working. */

print(greeting)
print(totalDistance_Km)
/* PRINT is a function that normally used to print data from
 a variable, constant or any type of message*/


// CREATING STRINGS

/*
 -> Text data assigned to a variable or constant, we call it
 STRING, String is grouped of character (text) between double quote
 that we use as data.
 
 -> Swift does not allow the creation of a String with multiple
 lines using double quotes, instead, you need to use triple quotes
 as syntax if you want to create a String with multiple line, however,
 when using multi-lines String after the first triple quote you need
 to 'break' the first line, the following text needs indentation
 and the second and last three quotes 'breaks' after text
 as you can see on the example below:
 */

var bigText = """
 This is an example how you can create
 a String using multiple lines inside
 of a variable or constant, in this case,
 in a variable.
 """
print(bigText)

let name = "SwiftUI"
print(name)


// CREATING INTEGER (TYPE) NUMBERS "WHOLE NUMBERS"

/* When we work with variables or constant is very common
 the use of numbers as a valid data stored, Swift is a programming
 language with very strong data type, in order to this,
 normally we need to declare the type for example for numbers
 that we can use INT (integer, or whole number) and this means
 the number can be a big one or even a negative number as you
 could see in some examples below:
 */

var examRate = 10
let distance = 150
let frozenProducts = -18

// The numbers also can be combined with all arithmetic operators

let sum = examRate + 5
let sub = examRate - 3
let mutiplication = examRate * 4
let division = examRate / 2

// Another thing you can do is use the variable or constant as operanding:

var points = 8
points = points + 3
points += 7 // Here is tha same example of above but using COMPOUND OPERATOR


// USE OF DECIMAL NUMBERS

/* When we are working with numbers a huge amount of the time we need
 to treat this element as a decimal numbers (floating point after one number).
 As mentioned previously Swift is a programming language with treat
 variables/constant Types very strictly and them can not be mixed,
 in the case of Decimal numbers the type that we have to use is DOUBLE.
 See some examples:
 */

let num0 = 1.3
let num1: Double = 5.9 // Double type declared in the example
let result: Double = num0 + num1
print(result)

/* However, if you try to sum an Integer number with a decimal
 number you are going to receive an error message saying you are not
 allowed to mix the types up, in order to granted an operation
 using this two numbers, you should use numbers of the same types
 or you force a chenge of type, as you can see on the following
 example:
 */

let num2 = 6.0
let num3 = 3
let IntForced = Int(num2) + num3 // Int(num2) is a function to force the type conversion
print(IntForced)
