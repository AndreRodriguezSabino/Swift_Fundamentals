import Cocoa

/*
-- How to limit access to internal data using access control --
 
 Swift's structs, by default, allow us to freely access their properties and methods.
 However, this may not always be the desired behavior. There are instances where you
 want to shield certain data from external access. For example, you might need to apply
 specific logic before interacting with your properties, or you may be aware that certain
 methods must be invoked in a particular manner or sequence, making it unwise to allow
 external access.
 */

struct bankAccount {
    /*
     In Swift, funds should only be accessible within the struct – exclusively through 
     methods that are part of the struct, along with any computed properties, property
     observers, and similar components.

     To convey this, you just need to add a single word:
     • PRIVATE
     • SET -> access granted only using methods.
     */
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/*
 This struct includes methods for depositing and withdrawing money from a bank account,
 and it should be utilized in the following manner:
 */
var account = bankAccount()
account.deposit(amount: 300)

var success = account.withdraw(amount: 200)
if success {
    print("The amount requested has been withdrawn successfully! ")
} else {
    print("Sorry, you don't have enough funds.")
}

/*
 Now, accessing funds from outside the struct is no longer possible, but it remains possible 
 inside both deposit() and withdraw(). If you attempt to read or write funds from outside the
 struct, Swift will reject your code.

 This concept is referred to as "access control" because it regulates how a struct's properties 
 and methods can be accessed from outside the struct.

 Swift provides various access control options, but when you're learning, you'll typically need 
 just a few:

 • Use private to indicate "do not allow anything outside the struct to use this."
 
 • Use fileprivate to signify "do not allow anything outside the current file to use this."
 
 • Use public to indicate "let anyone, anywhere use this."
 
 There's an additional option that can be useful for learners, which is private(set). This means 
 "allow anyone to read this property, but only let my methods modify it." If we had applied this
 to BankAccount, it would imply that you can print account.funds outside of the struct, but only
 deposit() and withdraw() can actually change the value.

 In this case, I believe private(set) is the most suitable choice for funds. It enables you to 
 access the current bank account balance at any time, but modifying it requires adhering to the
 struct's logic.

 Access control fundamentally revolves around limiting what you and other developers on your 
 team can do, which is a sensible practice. If Swift can prevent us from making mistakes,
 that's always a wise decision.

 Note: When using private access control for one or more properties, you will likely need 
 to create your own initializer.
 */

//Static properties and methods
/*
 You've learned how to attach properties and methods to structs, and each struct maintains its 
 distinct copy of these properties. This ensures that calling a method on one struct won't access
 the properties of a different struct of the same type.

 However, there are situations, albeit infrequent, where you'd like to add a property or method 
 to the struct itself, rather than to a specific instance of the struct. This enables you to use
 these properties and methods directly. I frequently employ this technique in SwiftUI for two main
 purposes: generating example data and storing fixed data that should be accessible from various
 locations.

 To begin, let's explore a simplified example of how to create and utilize static properties and 
 methods:
 */

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("Student \(student) added to the new course.")
        studentCount += 1
    }
}

/*
 Pay attention to the "static" keyword in there. It signifies that both the "studentCount" property 
 and the "add()" method are associated with the School struct as a whole, rather than with specific
 instances of the struct.

 To employ this code, you would do the following:
 */
School.add(student: "Andre Rodriguez")
print(School.studentCount)

/*
 I haven't created an instance of School - we can directly use "add()" and "studentCount" on the struct 
 itself. This is because both of them are static, which means they don't exist uniquely on instances of
 the struct.

 This also explains why we can modify the "studentCount" property without needing the "mutating" keyword. 
 The "mutating" keyword is typically required for regular struct functions, but in this case, there's no
 need for it because we don't create an instance when calling "add()".

 If you want to combine static and non-static properties and methods, keep in mind two rules:

 1 - To access non-static code from static code, it's not possible. Static properties and methods cannot 
 refer to non-static properties and methods because it doesn't make sense - which instance of School would
 you be referring to?
 2 - To access static code from non-static code, always use your type's name, such as "School.studentCount." 
 You can also use "Self" to refer to the current type.
 Now, we have "self" and "Self," and they have distinct meanings: "self" pertains to the current value of
 the struct, while "Self" relates to the current type.

 A helpful tip: It's easy to overlook the distinction between "self" and "Self," but if you think about it, 
 it aligns with the naming conventions in Swift, where data types begin with a capital letter
 (e.g., Int, Double, Bool). So, it's logical for "Self" to start with a capital letter too.
 */
