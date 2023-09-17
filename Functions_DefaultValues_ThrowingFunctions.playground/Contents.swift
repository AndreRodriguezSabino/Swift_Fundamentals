import Cocoa

/*
 When we add parameters to functions, it's like giving the function special
 instructions or options. This allows the function to work with different
 kinds of information based on what we want. Sometimes we want to have these
 options available so we can change how the function works, but other times
 we don't want to worry about it.
 
 That prints any times table, starting at 1 times the number up to any end point.
 That number is always going to change based on what multiplication table we want,
 but the end point seems like a great place to provide a sensible default –
 we might want to count up to 10 or 12 most of the time, while still leaving open
 the possibility of going to a different value some of the time.

 To solve this problem, Swift lets us specify default values for any or all of our
 parameters. In this case, we could set end to have the default value of 12, meaning
 that if we don’t specify it 12 will be used automatically.
 
 See the example below:
 */

func TimeTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print(" \(number) X \(i)= \(number * i)")
    }
    print()
}
TimeTable(for: 5, end: 5)
TimeTable(for: 8)

/*
 See how we can use printTimeTables() in two different ways: we can give it both
 parameters when we need to, but if we simply write printTimeTables(for: 5),
 it will automatically use the default value of 12 for "end."
 */

/*
 When we use removeAll() in Swift, it will remove all the items from an array and
 free up the memory that was used by that array. This is usually what you want
 because you're removing items for a reason. However, there's a special version
 of this function that not only removes the items but also keeps the memory
 capacity of the array intact.

 This is achieved using a default parameter value. There's a parameter called
 keepingCapacity, and its default value is set to false, which means it does the
 sensible thing by default – it clears the array and frees up memory. But if,
 in some rare cases, you want to keep the array's existing memory capacity,
 you can pass in true.

 In simple terms, default parameter values help us make functions flexible
 without making them complicated to use. You only need to specify extra
 parameters when you want something unusual to happen.
*/

var names = ["Andre", "Lucas", "Luke", "Vader"]
names.count
names.removeAll(keepingCapacity: true)
names.count
