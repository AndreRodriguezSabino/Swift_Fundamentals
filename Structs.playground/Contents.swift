import Cocoa

// STRUCTS

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title), \(year) by \(artist)")
    }
}

let bestOfTheBeast = Album(title: "Best of the Beast", artist: "Iron Maiden", year: 1996)
let aceOfSpades = Album(title: "Ace of Spades", artist: "Motorhead", year: 1980)

print(bestOfTheBeast.artist)
print(aceOfSpades.artist)

bestOfTheBeast.printSummary()
aceOfSpades.printSummary()
