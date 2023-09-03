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
