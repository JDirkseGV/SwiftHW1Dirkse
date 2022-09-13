import Foundation
//Problem #1
let myString = "hello"
var cost = 3.14
let cnt :Int = 2
var shouldWe :Bool = true
let v1 :Int = 17
let v2 :Int = 1010

//Problem #2
var exString = "5.2 plus 4.3 equals: \(5.2+4.3)"

//Problem #3
var hive: [String] = ["queen", "worker", "drone"]
print(hive[0])
hive.append("honey")
hive += ["are", "us"]

//Problem #4
for item in hive {
  print(item)
}
for (index,value) in hive.enumerated() {
  print("Item #\(index) is \(value)")
}

//Problem #5
var authorReadability: [String:Double] = ["Mark Twain":8.9, "Nathaniel Hawthorne": 5.1, "John Steinbeck":2.3, "C.S. Lewis":9.9, "Jon Krakaur":6.1]

//Problem #6
print(authorReadability["John Steinbeck"]!)
authorReadability["Erik Larson"] = 9.2
if authorReadability["Jon Krakaur"]! < authorReadability["Mark Twain"]! {
  print("Mark Twain")
} else {
  print("Jon Krakaur")
}

//Problem #7
for (key,value) in authorReadability {
  print("\(key):\(value)")
}

//Problem #8
for index in 1...10 {
  print(index)
}

//Problem #9
for index in (1...10).reversed() {
  print(index)
}

//Problem #10
var x = 3
var y = 5
var answer = 0
for _ in 1...y {
  answer += x
}

//Problem #11
var iterator = 0
var sum: Double = 0
var scores: [Double] = []

//for (_, score) in authorReadability {
//  scores.append(score)
//}

scores += authorReadability.values
while (iterator < scores.count){
  sum += scores[iterator]
  iterator+=1
}
var avg = sum / Double(iterator)
print(avg)

//Problem 12
if avg < 5 {
  print("Low")
} else if avg >= 5 && avg < 7 {
  print("Moderate")
} else if avg >= 7 {
  print("High")
}

//Problem 13
var count = 104
var strOut: String

switch count {
  case 0:
    strOut = "none"
  case 1...3:
    strOut = "a few"
  case 4...9:
    strOut = "several"
  case 10...99:
    strOut = "tens of"
  case 100...999:
    strOut = "hundreds of"
  case 1000...999999:
    strOut = "thousands of"
  case 1000000...:
    strOut = "millions of"
  default:
    strOut = "invalid count"
}
print(strOut)

//Problem 14
func verbalizeNumber(amount: Int) -> String {
  switch amount {
  case 0:
    return "none"
  case 1...3:
    return "a few"
  case 4...9:
    return "several"
  case 10...99:
    return "tens of"
  case 100...999:
    return "hundreds of"
  case 1000...999999:
    return "thousands of"
  case 1000000...:
    return "millions of"
  default:
    return "invalid amount"
  }
}

//Problem 15
for index in 1...100000 where index%10000 == 0 {
  print("\(index) is \(verbalizeNumber(amount:index)) dollars.")
}

//Problem 16
func verbalizeAndShoutNumber(amount: Int) -> String {
  return verbalizeNumber(amount: amount).uppercased()
}

//Problem 17
func expressNumbersElegantly(max: Int, verbalizeFunction: (Int) -> String) -> String {
  var combinedString: String = ""
  for i in 1...max where i%10 == 0 {
  combinedString += "\(i) is \(verbalizeFunction(i)) dollars. "
  }  
  return combinedString
}
var function: (Int) -> String = verbalizeNumber
print(expressNumbersElegantly(max: 900, verbalizeFunction: function))

function = verbalizeAndShoutNumber
print(expressNumbersElegantly(max: 900, verbalizeFunction: function))

//Problem 18
protocol Thing {
  func summarize() -> String
}
class Widget: Thing {
  var name: String
  var cost: Int

  init(name: String, cost: Int) {
    self.name = name
    self.cost = cost
  }

  func summarize() -> String {
    return "I am a \(name). I cost \(cost) dollars."
  }
}
class ShinyWidget: Widget {

  override func summarize() -> String {
    return "I am a SHINY \(name). I cost \(cost) dollars."
  }
}
let w1 = Widget(name: "CoolWidget", cost: 10)
let w2 = ShinyWidget(name:"CoolerWidget", cost: 100)
print(w1.summarize())
print(w2.summarize())

//Problem 19
extension String {
  var capitalizeFirstOnly: String {
    let letFirst: String = self.prefix(1).capitalized
    let letRemaining = self.dropFirst()
    return letFirst + letRemaining
  }
}

var famousLastWords = ["the cow jumped over the moon.", "three score and four years ago", "lets nuc \'em Joe!", "ah, there is just something about Swift"]
var capitalized = famousLastWords.map({saying in saying.capitalizeFirstOnly})

print(capitalized)

//Problem 20
extension String {
  func encrypt() -> String {
    var newChars = self.unicodeScalars.map {$0.value + 1}
    var newStringArr = newChars.map {String(UnicodeScalar(UInt8($0)))}

    var encryptedString = newStringArr.joined()
  
    return encryptedString 
  }
  func decrypt() -> String {
    var newChars = self.unicodeScalars.map {$0.value - 1}
    var newStringArr = newChars.map {String(UnicodeScalar(UInt8($0)))}

    var decryptedString = newStringArr.joined()
  
    return decryptedString 
  }
}
let str: String = "Hello World Secrets!"
let encodedStr = str.encrypt()
print(encodedStr)
print(encodedStr.decrypt())