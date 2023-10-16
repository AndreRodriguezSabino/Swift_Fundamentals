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
     PRIVATE
     */
    private var funds = 0
    
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
