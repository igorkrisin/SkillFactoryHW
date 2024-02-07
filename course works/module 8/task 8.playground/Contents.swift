import Foundation

let listOfProducts: [String] = ["Pepperoni", "Mozzarella",
         "Bacon", "Sausage",
         "Basil", "Garlic", "Onion", "Oregano",
         "Mushroom", "Tomato",
         "Red Pepper",
         "Ham", "Chicken",
         "Red Onion",
         "Black Olives",
         "Bell Pepper",
         "Pineapple",
         "Canadian Bacon", "Salami",
         "Jalapeño",
         "Spinach",
         "Italian Sausage", "Provolone",
         "Pesto", "Sun-Dried Tomato",
         "Feta",
         "Meatballs",
         "Prosciutto",
         "Cherry Tomato",
         "Pulled Pork", "Chorizo",
         "Anchovy", "Capers"]

func makePizza(product: [String])->(){
    var pizza: [String] = []
    var i = 0
    while pizza.count != 4 {
        var product: String = product.randomElement()!
        if !pizza.contains(product){
            pizza.append(product)
            print("product \(i): \(product)")
            i += 1
        }
        
        
        
    }
}

makePizza(product: listOfProducts)

var make: String = "hello"

make = "hello"

var ingradients: [String] = []
ingradients.isEmpty
ingradients.max()

ingradients = ["rook"]
ingradients.popLast()

ingradients.isEmpty

var evenNumbers = Set([2,4,6,8])
evenNumbers.insert(10)
print(evenNumbers)
evenNumbers.insert(2)

evenNumbers.remove(2)
evenNumbers.remove(2)

var playerScores: [String: Int] = ["Paris": 6, "Marina": 10, "Tim": 9, "Jon": 14]

playerScores["Tim"]

var forbiddenPizzas: Set =
         ["Lemon and Pumpkin",
             "Hawaiian with a Fried Egg", "Schnitzel and Granola"]
forbiddenPizzas.insert("Chicken and Boston Beans")
forbiddenPizzas.remove("Lemon and Pumpkin")

print(forbiddenPizzas)

var dessertPizzaOrders = ["Rocky Road": 2, "Nutella": 3, "Caramel Swirl": 1]

print(dessertPizzaOrders["Rocky Road"]!,", ",  dessertPizzaOrders["Caramel Swirl"]!)

dessertPizzaOrders.updateValue(17, forKey: "Banana Split")

print(dessertPizzaOrders)

var point = (x: 10, y: 20, z: 49)
point.z

point = (10,9,56)
point.0


switch(make) {
case "Hawaii":
    break
default: print("hello")
}
1..<4


72...96
-100...100
9...
...37000
let arr2: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

func evenNumb(arr: [Int])->() {
    for i in 0..<arr.count {
        if arr[i]%2 == 1 {
            print(arr[i])
        }
    }
}

evenNumb(arr: arr2)
var todaysWeather = "Windy"
var temperature = 35
var message = "Today′s Weather"


switch(todaysWeather){
    case "Sunny":
        message = "It′s a lovely sunny day!"
    case "Windy":
        message = "Strap your hat on. It’s windy!"
    case "Raining":
        message = "Pack your umbrella!"
    case "Snow":
        message = "Brr! There’s snow in the air!"
    default:
        message = "It′s a day, you know?"
}
if(temperature > 65) {
    message += " And it′s not cold out there."
}
else if(temperature < 35){
    message += " And it′s chilly out there."
}
else {
    message += " And it′s not cold or hot!"
}

//2 == "a"

func printOrder(countPizza: Int, namePizza: String) -> () {
    if (countPizza > 5) {
             print("Because more than 5 pizzas were ordered, a discount of 10% applies to the order.")
    }
    switch namePizza{
    case "Hawaiian":
        print("\(countPizza)x Hawaiian pizzas were ordered.")
    case "Prosciutto":
                 print("\(countPizza)x Prosciutto pizzas were ordered.")
    default:
        "there is not this pizza now"
    }
}

printOrder(countPizza: 5, namePizza: "Hawaiian")

func testingLable(_ test: Int)->(){
    print("all right")
}

testingLable(5)




func makeDod(_ name: inout String){
    name = "Dod"
    
}
var name: String = "Tim"

makeDod(&name)

print(name)

func greet(name: String, favoriteNumber: Int, likesKaraoke: Bool)-> String {
    return "Hi, \(name)! Your favorite Number is \(favoriteNumber), likes karaoke: \(likesKaraoke)"
}
print(greet(name: "Paris", favoriteNumber: 6, likesKaraoke: true))



func average(_ numbers: Double...) -> Double {
    var total = 0.0
    for number in numbers {
        total += number
    }
return total / Double(numbers.count)
}

average(5, 5, 4)

func mult(_ i: Int, _ y: Int) -> Int {
    return i + y
}

func multForFunc(_ mult: (Int, Int)->Int, _ num: Int, _ num2: Int) {
    print(num + num2 + mult(num, num2))
}

multForFunc(mult(_:_:), 5, 5)


typealias Pizza = String
func makeHawaiianPizza() -> Pizza {
    print("One Hawaiian Pizza, coming up!")
    print("Hawaiian pizza is mostly cheese, ham, and pineapple.")
    return "Hawaiian Pizza"
}
func makeCheesePizza() -> Pizza {
    print("One Cheesey Pizza, coming up!")
    print("Cheesey pizza is just cheese, more cheese, and more cheese.")
    return "Cheese Pizza"
}
func makePlainPizza() -> Pizza {
    print("One Plain Pizza, coming up!")
    print("This pizza has no toppings! Not sure why you’d order it.")
    return "Plain Pizza"
}
func order(pizza: String) -> () -> Pizza {
    if (pizza == "Hawaiian") {
        return makeHawaiianPizza
    } else if (pizza == "Cheese") {
        return makeCheesePizza
    } else {
        return makePlainPizza
    }
}
var myPizza = order(pizza: "Hawaiian")
print(myPizza())

func sayGoodByeHello(name: String) -> (hello: String, goodbye: String, waiting: String) {
    return ("\(name) hello", "\(name) goodbye", "\(name) waiting for, please")
}

sayGoodByeHello(name: "Man")

print(sayGoodByeHello(name: "Igor").hello)
print(sayGoodByeHello(name: "Igor").waiting)
print(sayGoodByeHello(name: "Igor").goodbye)

func billSplit(_ cost: Double, _ tea: Int, _ amountPeople: Int)-> Double {
    return (cost - (Double(tea)*(cost*0.01)))/Double(amountPeople)
}

billSplit(200, 10, 2)

func billSplit2(_ cost: Double, _ tea: Int = 20, _ amountPeople: Int = 2)-> Double {
    return (cost - (Double(tea)*(cost*0.01)))/Double(amountPeople)
}
billSplit2(200)

enum State {
    case stop
    case dead
    case winner
}

var StatePlayer: State = .dead

enum Fruit: CaseIterable {
    case pineapple
    case dragonfruit
    case lemon
}
for fruit in Fruit.allCases {
    print(fruit)
}

print(Fruit.allCases)

enum Hat: Int {
    case top = 1
    case bowler
    case baseball
}
var hat = Hat(rawValue: 3)


enum PlayerState: String {
    case dead = "Dead"
    case blockaded = "Block"
    case winner = " Winner"
}

func setPlayerState(state: PlayerState) {
    print("The player state is now \(state)")
}
print(PlayerState.blockaded.rawValue)

var state: PlayerState = .dead

var mult = {(numb: Int)-> Int in
    return numb*numb}


mult(5)

print("The result is \(mult(10))")

func order(pizza: () -> Void) {
    print("# Ready to order pizza! #")
    pizza()
    print("# Order for pizza placed! #")
}

let hawaiianPizza = {
    print("One Hawaiian Pizza, coming up!")
    print("Hawaiian pizza is cheese, ham, & pineapple.")
}

order(pizza: hawaiianPizza)


let cheeseyPizza = {
    print("One Cheesey Pizza, coming up!")
    print("Hawaiian pizza is cheese, ham, & pineapple.")
    
}

order(pizza: hawaiianPizza)

func performWithPiano(song: (String) -> String) {
    var performance = song("Piano")
    print(performance)
}

//var mult = {(numb: Int)-> Int in
//    return numb*numb}


var neverGonnaGiveYouUp = {(text: String)->String in
    return "'Never gonna Give You up' on Piano"
}

    

performWithPiano(song: neverGonnaGiveYouUp)

let operat = {(total: Int, next: Int) in
    return total + next
}

func operateOn(_ array: [Int], operation: (Int, Int) -> Int) -> Int
{
    var cur = array[0]
    for item in array[1...] {
        cur = operation(cur, item)
    }
    return cur
}

let numbers = [7, 2 ,4 ,5, 6, 8]

let test = operateOn(numbers, operation:  +)

let test2 = operateOn(numbers, operation: *)

var count = 5

let incrementer = {
    count += 1
}
incrementer()
incrementer()
incrementer()
incrementer()
print(count)

func counter()->() -> Int {
    var count = 0
    let incrementer: () -> Int = {
        count += 1
        return count
    }
    return incrementer
}

let myCounter = counter()

let secondCounter = counter()

myCounter()
myCounter()
myCounter()

print(secondCounter())

var closures:[()->()] = []

func callEscaping(closure: @escaping () -> Void) {
    print("callEscaping() function called!")
    closures.append(closure)
    closure()
    return
}

callEscaping {
    print("closure called")
}

func cookedPizza(completed: ()->()){
    print("cooking pizza")
    print("cooked pizza")
    completed()
    print("pizza cooked and everithing is done")
}

let deliveryPizza = {print("pizza pucking and ready delivery")}

cookedPizza(completed: deliveryPizza)

var numbers2 = [1, 5, 2, 3, 7, 4, 6, 9, 8]



let sortClosure = {(a: Int, b: Int) -> Bool in
    a>b
}

numbers2.sort(by: sortClosure)

print(numbers2)

struct Pizza2 {
    var name: String
    var ingridients: [String] = []
    init() {
        name = "Cheese"
        ingridients = ["Cheese"]
    }
}



var pizzaHawaii = Pizza2()

pizzaHawaii.ingridients = ["Cheese", "Pineapple", "Ham", "Pizza Sauce"]

struct GarlicBread {
    var strength: Int
    var vegan: Bool
    var spicy: Int
    init() {
        self.strength = 1
        self.spicy = 0
        self.vegan = false
        
    }
    
    init(strength: Int) {
        self.strength = strength
        self.vegan = false
        self.spicy = 0
    }
    
    
    init(strenght: Int, spicy: Int) {
        self.strength = strenght
        self.spicy = spicy
        self.vegan = false
        
    }
    
    init(strenght: Int, spicy: Int, vegan: Bool) {
        self.strength = strenght
        self.spicy = spicy
        self.vegan = vegan
        
    }
}


let bgarBread = GarlicBread(strength: 50)


struct Pizza3 {
    var name: String
    private var chefsNotes: String
    init(name: String) {
        self.name = name
        self.chefsNotes = "A tasty pizza, but pineapple isn’t for everyone!"
    }
}

var pizzaTest1 = Pizza3(name: "cheese")

pizzaTest1.name

struct Pizza4 {
    var name: String
    var ingredients: [String]
    
    func getPrice()->Int {
        return self.ingredients.count * 2
    }
    
    mutating func setName(newName: String) {
        self.name = newName
    }
}

var hawaiian = Pizza4(name: "Hawaiian", ingredients: ["Ham", "Cheese", "Pineapple"])
var meat = Pizza4(name: "Meaty Goodness", ingredients: ["Pepperoni", "Chicken", "Ham", "Tomato", "Pulled Pork"])
var cheese = Pizza4(name: "Cheese", ingredients: ["Cheese"])

hawaiian.getPrice()
meat.getPrice()
cheese.getPrice()

hawaiian.setName(newName: "Hawaiian!!!")


let distance: Int = 7
let oneVerst: Double = 1066.8
let result = Double(distance)*oneVerst/1000

print(round(result*100)/100)


struct Pizza5 {
    var name: String
    var ingredients: [String]
    var lactoseFree: Bool {
        return ingredients.contains("Cheese")
    }
    var quantity: Int {
        didSet {
            print("The pizza \(name) has \(quantity) pizzas left")
        }
    }
}

var hawaiian5 = Pizza5(name: "Hawaiian", ingredients: ["Pineapple","Ham","Cheese"], quantity: 10)
print(hawaiian5.lactoseFree)
var vegan5 = Pizza5(name: "Vegan", ingredients: ["Artichoke", "Red Pepper", "Tomato", "Basil"], quantity: 10)
print(vegan5.lactoseFree)

print(hawaiian5.quantity -= 1)
hawaiian5.quantity -= 1

print(hawaiian5.quantity)

let text = "The great apple orchard"
var charCount = 0
for _ in 1...text.count {
    charCount += 1
}

print(charCount)

var a = 2
var x = 7
repeat {
    a += x
    print(a)
    x -= 2
} while x > 0
print(a)
for num in stride(from: 5, to: -10, by: -2) {
    print("\(num)")
}

struct Pizza6{
    lazy var cookingDuration = getCoockingTime()
}

func getCoockingTime() -> Int {
    print("get coocking time() was called!")
    return 100
}

var hawaii = Pizza6()

print(hawaii.cookingDuration)


class Plant {
    var name: String
    var latinName: String
    var type: String
    var description: String {
        return "This is a \(name) (\(latinName)) \(type)."
    }
    init(name: String, latinName: String, type: String) {
        self.name = name
        self.latinName = latinName
        self.type = type
    }
}

class Succulent: Plant {
    var age: Int
    override var description: String{
        return "This is a \(name) (\(latinName)) \(type) it is \(age) yers old."
    }
    init(name: String, latinName: String, age: Int) {
        self.age = age
        super.init(name: name, latinName: latinName, type: "Succulent")
    }
}

let americanAloe = Succulent(name: "American aloe", latinName: "Agave americana", age: 5)

print(americanAloe.description)


//let elephantsFoot = Succulent(name: "Elephant's Foot", latinName: "Beaucarnea recurvata")
//
//let calicoHearts = Succulent(name: "Calico hearts", latinName: "Adromischus maculatus")

//print(calicoHearts.latinName)


class Tree: Plant {
    init(name: String, latinName: String) {
        super.init(name: "Tree \(name)", latinName: latinName, type: "Tree")
    }
}

var europeanLarch = Tree(name: "europeanLarch", latinName: "Larix decidua")

print(europeanLarch.type)
print(europeanLarch.name)

open class Test {
    
    
    
    
}


class Alien {
    func drink() {
        print("Drinking some alien wine!")
    }
}

class Clingon: Alien {
    override func drink() {
        print("parx!")
        print("Drinking some alien bladwine!")
    }
}

var clingones = Clingon()

clingones.drink()


struct Succulent1 {
    var name: String
}

var suc: Succulent1 = Succulent1(name: "succulent")

suc.name = "hernja"


class Plant6 {
    var name: String
    var latinName: String
    var type: String
    init(name: String, latinName: String, type: String) {
        self.name = name
        self.latinName = latinName
        self.type = type
        print("hello")
    }
    
    deinit {
        print("The plant '\(name)' has been deinitialized.")
    }
}

var _ = Plant6(name: "Bay laurel", latinName: "Laurus nobilis", type: "Evergreen Tree")


actor Human {
    var maximumAge = 107
    func printAge() {
        print("Max age is currently \(maximumAge)")
    }
    func updateMaximumAge(from other: Human) async {
        maximumAge = await other.maximumAge
    }
}


protocol MyProtocol {
    var specialNumber: Int {get set}
    func secretMessage() -> String
}

struct myStruct: MyProtocol {
    var specialNumber: Int
    func secretMessage() -> String {
        return "specialNumber: \(specialNumber)"
    }
}

var str: myStruct = myStruct(specialNumber: 5)

protocol HasLaserGun {
    func fireLaserGun()
}

protocol Bipedal {
    func walk()
}

protocol HasArms {
    var armCount: Int { get }
    func gripWith(arm: Int)
}

protocol HasAntenna {
    var antennaCount: Int { get }
}

protocol HasWheels {
    var wheelCount: Int {get}
}

protocol PetrolPowered {
    var petrolPrecent: Int {get set}
}

struct RobotOne: Bipedal, HasAntenna {
    var antennaCount: Int
    
    func walk() {
        print("Robot is now walking, using its legs.")
    }
}
var myFirstRobot = RobotOne(antennaCount: 2)
myFirstRobot.walk()

struct RobotTwo: HasArms, HasAntenna, PetrolPowered {
    var armCount: Int
    var antennaCount: Int
    var petrolPrecent: Int
    
    func gripWith(arm: Int) {
        print("Now gripping with arm number \(arm)")
    }
}

var mySecondRobot: RobotTwo = RobotTwo(armCount: 2, antennaCount: 2, petrolPrecent: 100)

mySecondRobot.gripWith(arm: 1)

struct RobotThree: HasWheels, HasArms, HasAntenna {
    var wheelCount: Int
    var armCount: Int
    var antennaCount: Int
    func gripWith(arm: Int) {
        print("A RobotThree type robot is now gripping with arm number \(arm)")
    }
}

var myThreeRobot: RobotThree = RobotThree(wheelCount: 1, armCount: 2, antennaCount: 2)
myThreeRobot.gripWith(arm: 1)

struct RobotFour: HasWheels, HasLaserGun {
    var wheelCount: Int
    func fireLaserGun() {
        print("piu piu piu")
    }
}

var myFourthRobot: RobotFour = RobotFour(wheelCount: 2)
myFourthRobot.fireLaserGun()

struct RobotFive: HasArms, HasWheels {
    var wheelCount: Int
    var armCount: Int
    func gripWith(arm: Int) {
        print("A RobotThree type robot is now gripping with arm number \(arm)")
    }
}

var robotFifth: RobotFive = RobotFive(wheelCount: 3, armCount: 4)

robotFifth.gripWith(arm: 4)


protocol Aircraft {
    func takeOff()
    func land()
}
protocol Watercraft {
    var buoyancy: Int { get }
}
protocol PetrolPowered1 {
    var petrolPercent: Int { get set }
    func refuel() -> Bool
}
protocol Landcraft {
    func drive()
    func brake() -> Bool
}

struct AmfibiaCar: Aircraft, Watercraft, PetrolPowered, Landcraft {
    var petrolPrecent: Int
    var buoyancy: Int = 0
    var petrolPercent: Int = 0
    
    mutating func refuel() -> Bool {
        petrolPercent = 100
        return true
    }
    
    
    func takeOff() {
        print("i'm fly!")
    }
    func land() {
        print("i'm arrive")
    }

    func drive() {
        print("i'm going")
    }
    func brake() -> Bool {
        print("stopped")
        return true
    }
}

struct FutureVehicle: Aircraft, Watercraft, PetrolPowered, Landcraft {
  
    
    var petrolPrecent: Int
    
   
    var buoyancy: Int = 0
    var petrolPercent: Int = 0
    func takeOff() {
        print("Taking off!")
    }
    func land() {
        print("Landing!")
    }
    mutating func refuel() -> Bool {
        petrolPercent = 100
        return true
    }
    func drive() {
        print("Driving!")
    }
    func brake() -> Bool {
        print("Stopped!")
        return true
    }
}

var futureCar: FutureVehicle = FutureVehicle(petrolPrecent: 100, buoyancy: 10)
futureCar.drive()
futureCar.brake()


protocol Animal {
    var type: String { get }
}
struct Dog: Animal {
    var name: String
    var type: String
    func bark() {
        print("Woof!")
    }
}
struct Cat: Animal {
    var name: String
    var type: String
    func meow() {
        print("Meow!")
    }
}

struct Cow: Animal {
    var nameAn: String
    var type: String
    var noise: String
    func animNoize() {
        print(noise)
    }
    mutating func animName() {
        nameAn.self = noise
    }
}
var bunty = Cat(name: "Bunty", type: "British Shorthair")
var nigel = Cat(name: "Nigel", type: "Russian Blue")
var percy = Cat(name: "Percy", type: "Manx")
var argos = Dog(name: "Argos", type: "Whippet")
var apollo = Dog(name: "Apollo", type: "Lowchen")
var kola = Cow(nameAn: "kola", type: "dvornjaga", noise: "muuuuu")

var animals: [Animal] = [bunty, nigel, percy, argos, apollo, kola]

for anim in animals {
    if(type(of: anim) == Cat.self){
        print(bunty.meow())
    }
    else if(type(of: anim) == Dog.self){
        print(argos.bark())
    }
    else {
        print(kola.noise)
    }
}

print(animals[0])


extension Int {
    var square : Int{
        return self*self
    }
    
    var more100: Bool {
        return self > 100
    }
    
    func cube() -> Int{
        return self * self * self
    }
    mutating func incrementBy10() {
        self + 10
    }
    func description() -> String {
        return "This Int contains the value \(self)"
    }
    
    func half() -> Int {
        return self/2
    }
    
}

var myInt: Int = 100
print(myInt.square)
print(myInt.cube())
myInt.incrementBy10()
print(myInt.description)


struct Dog1 {
    var name: String
    var age: Int
   
}
var argos1 = Dog1(name: "Argos", age: 7)
protocol Bark {
    func bark()
}
extension Dog1: Bark {
    func bark() {
        print("Woof!")
    }
}
argos1.bark()

struct MySequence: Sequence, IteratorProtocol {
    var cur = 1
    mutating func next() -> Int? {
        defer {
            cur *= 5
        }
        return cur
    }
}

var myNum = 0
let numbers1 = MySequence()
for number in numbers1 {
    myNum = myNum + 1
    if myNum == 10 {
        break
    }
    print(number)
}


var videoGames = ["Mass Effect", "Deus Ex", "Pokemon Go", "Breath of the Wild", "Command and Conquer", "Destiny 2", "Sea of Thieves", "Fallout 1"]



protocol EnumerateCollection {
    func enumerateCollection()
}

struct GameCollection: EnumerateCollection {
    var gamesList: [String]
    func enumerateCollection() {
        print("Games in Collection:")
        for game in gamesList {
            print("Game: \(game)")
        }
    }
}



extension Collection {
    func describe() {
        if count == 1 {
            print("There is 1 item in this collection.")
        } else {
            print("There are \(count) items in this collection.")
        }
    }
}


var myCollection = GameCollection(gamesList: videoGames)

myCollection.enumerateCollection()

videoGames.describe()



var favoriteQuote: String = "Space, the final frontier..."
if favoriteQuote != "" {
    print("My favorite quote is: '\(favoriteQuote)'")
} else {
    print("I don't have a favorite quote.")
}

struct Person {
    var name: String
    var coffeesConsumed: Int
    var consumesCoffee: Bool
}

var josh = Person(name: "Josh", coffeesConsumed: 5, consumesCoffee: true)

var tom = Person(name: "Tom", coffeesConsumed: 0, consumesCoffee: false)

var apple: Int? = 5

if apple == nil {
    print("nil apple")
} else {
    print(apple!+2)
}
let age = "60"

if let ageNumber =  Int(age) {
    print("2112")
}

struct Person2 {
    var name: String
    var favoriteSong: Song2
    var favoriteKaraokeSong: Song2?
}

struct Song2 {
    var name: String
}



let paris = Person2(name: "Paris", favoriteSong: Song2(name: "Learning to Fly — Pink Floyd"), favoriteKaraokeSong: Song2(name: "Africa — Toto"))
let bob = Person2(name: "Bob", favoriteSong: Song2(name: "Shake It Off — Taylor Swift"))
let susan = Person2(name: "Susan", favoriteSong: Song2(name: "Zombie — The Cranberries"))

func isThereKaraokeSong(person: Person2) -> (){
    if let karaokeSong = person.favoriteKaraokeSong {
        print ("His favorite karaoke song is \(karaokeSong)")
    } else {
        print ("karaoke song not there")
    }
}

isThereKaraokeSong(person: susan)



