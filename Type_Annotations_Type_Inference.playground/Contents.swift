import SwiftUI

// TYPE ANNOTATION AND TYPE INFERENCE

/*
 Swift is able to figure out what type of data a constant or
 variable holds based on what we assingn to it. However, sometimes
 we don't want to assign a value immediately, or sometimes we
 want to override Swift's choice of type, and that's where type
 annotations come in.
 */

let number = 10
let city = "Brighton"

/*
 This uses type inference: Swift infers that NUMBER is an integer
 because we are assigning number to it, and then infers that CITY is
 a string because we are assigning atext to it.
 */

let Numbers: Double = 37.2
let programmingLanguage: String = "Swift"

/*
Now we are being explicit: NUMBERS must be a Double, and PROGRAMMING_LANGUAGE
must be a String. That's exactly what Swift's type inference would have done
 anyway, but sometime it isn't - sometimes you will want to choose a different
 type.
 
 For example, maybe SCORE is a decimal because the user can get half points,
 so you'd write this:
*/

var score: Double = 2

/*
Without the : Double part Swift would infer that to be an interger,
but we are overriding that and saying it is definitely a decimal
 number.
 
 STRING -> holds text

 INT -> holds whole numbers
 
 DOUBLE -> holds decimal numbers
 
 BOOL -> holds either true or false
 
 ARRAYS -> holds lots of different values, all in the order you add them.
 This must be specialized, such as [String]
 'var names: [String] = ["John", "Andre", "Lucas"]
 
 DICTIONARY -> holds lots of different values, where you get to decide
 how data should be accessed. This must be specialized, such as [String: Int]
 'var userName: [String: String] = ["Andre": "@andresrcalvo"]
 
 SET -> holds lots of different values, but stores them in an order that's
 optmized for checking what it contains. This must be specialized, such
 as Set<String>
 'var series: Set<String> = Set(["The Big Bang Theory", "Game of Thrones", "Friends"])
*/
