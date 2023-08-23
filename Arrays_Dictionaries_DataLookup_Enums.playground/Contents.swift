import Cocoa

//ARRAYS

/* In Swift is very common the use of Arrays. Arrays
 is a group of data of the same type stored in a variable
 or constant, the usage for Arrays normally is used to
 create lists or collection, counting. We can see some
 examples below:
 */

var programmingLanguages: Array = ["Swift", "PHP", "JavaScript", "Python"]
let someNumbers = [1, 9, 6, 14, 36, 40]
print(programmingLanguages[0]) // The is one way to print the values stored in one Array

/*
 -> Arrays, the position of one data in an Arrays is called
 Index. Every Array the Index starts with zero as you can see
 on the example above, Swift is the first data of the
 Array 'programmingLanguages' in the position 0.

-> If your Array is a variable, we can modify it including
 more data using a function 'append()', any data with equal
 type can be added or removed from our Array.
 */

programmingLanguages.append("C++")
print(programmingLanguages.count) // Function to see how many elements are stored in the Array

/*
We can also create an empty Array using
'var programminngLanguages = Array<String>()'
and start to feed our Array with data using the
function that we saw before, 'append()'.
A different way to create an Empty Array is using,
'programmingLanguages = [String]()' and add more
data using the function 'append()', that is exactly
the same result of the previous example.
 */

var sortOfNumbers = Array<Int>()
sortOfNumbers.append(10)
sortOfNumbers.append(17)
sortOfNumbers.append(23)

var cities = [String]()
cities.append("Oxford")
cities.append("London")
cities.append("San Francisco")
cities.append("Manchester")
cities.append("Leeds")

/*
 Some more functions we can use together with
 Arrays are:
 
 -> 'contains()' that check if the Array
 contains a certain data that we are searching.
 
 -> 'remove(at: )' that removes a data stored from the
 position that we determine using the index position
 after 'at'.
 
 -> 'removeAll()' that removes all data stored
 in the Array.
 
 -> 'sorted()' that is going to organise our Array
 in ascending order, which means alphabetically
 */

print(cities.contains("Bristol"))
cities.remove(at: 4)
print(cities.count)
print(cities.sorted())
let useReverse = cities.reversed()
print(useReverse)
