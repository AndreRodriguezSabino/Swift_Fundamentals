import Cocoa

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
 if you want to create a String with multiple line, however, when
 using multi-lines String after the first triple quote you need
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
