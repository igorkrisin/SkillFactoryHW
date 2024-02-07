import UIKit

//protocol SomeProtocol {
//    var someProperty: String? { get set }
//}
//
//class SomeClass: SomeProtocol {
//    //make class
//    var someProperty: String?
//}
//
//
//protocol Dog {
//    var paws: Int { get }
//   // var ear: Int { get }
//}
//
//
//class Dachhund: Dog {
//    private (set) var paws: Int = 4 // указание что данное свойство из протокола не изменяемое
//
//   
//}
//
//var knopka: Dachhund = Dachhund()
//print(knopka.paws)

//protocol Dog {
//    var paws: Int { get }
//    var weight: Float { get set }
//    var command: [String] { set get }
//}
//
//class Ovcharka: Dog {
//    private (set) var paws: Int = 4
//    var weight: Float
//    var command: [String]
//    init( weight: Float, command: [String]) {
//       
//        self.weight = weight
//        self.command = command
//    }
//}
//
//
//var sharick: Ovcharka = Ovcharka(weight: 5, command: ["Golos"])
//
//sharick.weight = 7
//sharick.command.append("fas")
//
//print(sharick.command)

//
//protocol SquadCanids {
//    var numberEars: Int { get }
//    var numberEyes: Int { get }
//    var numberTail: Int { get }
//    var thereIsFangs: Bool { get }
//}
//
//protocol Bark {
//    var dogCanBark: Bool { get }
//}
//
//
//protocol Commands {
//    var listComand: [String] { get set }
//}
//
//class Dog: SquadCanids {
//    private (set) var numberEars: Int = 2
//    private (set) var numberEyes: Int = 2
//    private (set) var numberTail: Int = 1
//    private (set) var thereIsFangs: Bool = true
//    
//    
//    
//    var dogNickName: String
//    var nickname: String {
//        get {
//            return dogNickName
//        }
//        set {
//            dogNickName = newValue
//        }
//    }
//    
//    init(dogNickName: String) {
//        self.dogNickName = dogNickName
//    }
//    
//}
//
//class Bobtail: Dog, Commands, Bark {
//    private (set) var dogCanBark: Bool = true
//    var listComand: [String]
//    init(dogNickName: String, listComand: [String]) {
//        self.listComand = listComand
//        super.init(dogNickName: dogNickName)
//    }
//}
//
//let bobtailJack: Bobtail = Bobtail(dogNickName: "Jack", listComand: ["sit", "serve", "lie down"])
//
//print (
//"""
//пес по имени \(bobtailJack.dogNickName) утеет лаять: \(bobtailJack.dogCanBark),
//у него здоровые зубы \(bobtailJack.thereIsFangs),
//имеет \(bobtailJack.numberTail) хвост,
//\(bobtailJack.numberEyes) глаза,
//\(bobtailJack.numberEars) уха,
//знает команды: \(bobtailJack.listComand)
//заключение врача - пес здоров
//"""
//)
//
//
//protocol SomeProtocol {
//    func someMethod()
//}
//
//struct SomeStruct: SomeProtocol {
//    func someMethod() {
//        print("struct")
//    }
//}
//
//enum SomeEnum: SomeProtocol {
//    case one
//    case two
//    
//    func someMethod() {
//        switch self {
//        case .one:
//            print("one")
//        case .two:
//            print("two")
//        }
//    }
//}
//
//let someEnum = SomeEnum.one
//someEnum.someMethod()
//
//let someStruct: SomeStruct = SomeStruct()
//someStruct.someMethod()
//
//
////14.4.1
//protocol persoMovie {
//    init(name: String, age: Int)
//    var name: String { get set}
//    var age: Int { get set }
//    func printHowOld()
//}
//
//class Hero: persoMovie {
//    var name: String
//    var age: Int
//    
//    required init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    
//    func printHowOld() {
//        print("name hero: \(self.name) his age: \(self.age)")
//    }
//}
//
//let jhonWeak: Hero = Hero(name: "Jhon", age: 34)
//
//jhonWeak.printHowOld()
//
////можно расширить протокол и написать в нем реализацию
//
//protocol SomeProtocol2 {
//    func someMethod(text: String) -> String
//}
//
//extension SomeProtocol2 {
//    func someMethod(text: String) -> String {
//        return text + " last String "
//    }
//}
//
//struct SomeStruct2: SomeProtocol2 {}
//
//let someText: SomeStruct2 = SomeStruct2()
//
//print(someText.someMethod(text: "start string"))
//
//
//protocol ProtocolJhonWick {
//    var jhonAge: Int {get set}
//    var jhonName: String {get set}
//    
//    init(name: String, age: Int)
//    
//    func printJhonData()
//    
//}
//
//extension ProtocolJhonWick {
//    func printJhonData() {
//        print("name of hero: \(jhonName), age: \(jhonAge) ")
//    }
//}
//
//class Hero2: ProtocolJhonWick {
//    var jhonAge: Int
//    var jhonName: String
//    
//    required init(name: String, age: Int) {
//        self.jhonAge = age
//        self.jhonName = name
//    }
//}
//
//let jhon: Hero2 = Hero2(name: "jhon", age: 23)
//jhon.printJhonData()
//
////делегирование
//
//
//protocol EngineerDelegat {
//    func taskHasEnded()
//}
//
//
//class Engineer {
//    var tasks: Int = 0 {
//        didSet {
//            if task == 0 {
//                delegate?.taskHasEnded()
//            }
//        }
//    }
//    var delegate: EngineerDelegat?
//}
//
//class ProjectManager { 
//    func addTasksToEngineer() {
//        engineer?.tasks += 1
//    }
//}
//
//extension ProjectManager: EngineerDelegat {
//    var engineer: Engineer?
//    
//   
//    func taskHasEnded() {
//        print("give me tasks ")
//    }
//    
//}
//
//var engineer  = Engineer()
//var manager = ProjectManager()
//engineer.delegate = manager
//manager.engineer = engineer
//manager.addTasksToEngineer()
//
//
//

//
//
//
//struct Product {
//    let title: String
//    let price: Int
//}
//
//struct Position {
//    let product: Product
//    var count: Int
//    
//    var cost: Int {
//        return product.price * count
//    }
//}
//
//protocol CatalogDelegate {
//    func addPosition(position: Position)
//}
//
//class Catalog {
//    var products = [Product]()
//    var delegate: CatalogDelegate?
//    
//    func addToCart(index: Int, count: Int) {
//        if products.count > index {
//            //добавляем позицию с этим продуктом в корзину
//            if let delegate = delegate {
//                let product = products[index]
//                let positions = Position(product: product, count: count)
//                
//                delegate.addPosition(position: positions)
//            }
//        }
//    }
//}
//
//
//class Cart: CatalogDelegate {
//    private (set) var positions = [Position]()
//    
//    var cost: Int {
//        var sum = 0
//        for position in positions {
//            sum += position.cost
//        }
//        return sum
//    }
//    
//   
//    
//    func addPosition(position: Position) {
//        self.positions.append(position)
//    }
//}
//
//
//let catalog = Catalog()
//let cart = Cart()
//
//catalog.delegate = cart
//cart.positions.count
//
//
//let kolbase = Product(title: "Колбача", price: 400)
//let milk = Product(title: "Молоко", price: 100)
//let cheese = Product(title: "Масдам", price: 200)
//
//catalog.products = [kolbase, milk, cheese]
//
//catalog.addToCart(index: 0, count: 2)
//catalog.addToCart(index: 1, count: 4)
//catalog.addToCart(index: 2, count: 21)
//
//cart.positions.count
//cart.cost
//
//for position in cart.positions{
//    print(position.product.title)
//}
//
//
//
//
//
////MARK - protocol
//
//protocol RouterDelegate {
//    var nameID: [String] { get set }
//    func saveName(name: String, text: String)
//}
//
//
//protocol UsersProtocol {
//    var name: String {get set}
//    var age: Int { get set }
//    
//    var delegate: RouterDelegate? { get set }
//    
//    init(name: String, age: Int, delegate: RouterDelegate?)
//}
//
////MARK: - Class
//
//class Router: RouterDelegate {
//    var nameID: [String] = []
//    func saveName(name: String, text: String) {
//        nameID.append(name)
//        nameID.append(text)
//    }
//}
//
//class User: UsersProtocol {
//    var name: String
//    var age: Int
//    
//    var delegate: RouterDelegate?
//    
//    func semdMail(name: String, text: String) -> Bool {
//        delegate
//        return true
//    }
//}
//
//
//
//
//protocol changeTextDelegate {
//    func changeText(text: String)
//}
//
//
////Делегат - тот кто реализует задачу, для этого ему нужен протокол changeTextDelegate
////Он свяжет между собой 2 класса и даст возможность обмениватся между собой информацией через делегат
////Делегат всегда соотвествует протоколу делегирования
//class General: changeTextDelegate {
//    private (set) var generalText = "Hello world"
//    func changeText(text: String) {
//        self.generalText = text // присваиваем свойсту changeText строку переданную нам из вне - через secondary
//    }
//}
//
////Делегатор - ставит задачу делегату
////Для этого внутри создаем св-во delegate типом changeTextDelegate что бы через нее обратиться к свойству generalText внутри General
//class Implementer {
//    var delegate: changeTextDelegate!
//}
//
////создаем объект General и проверяем что лежит в поле generalText
//
//var general = General()
//general.generalText
//
////создаем объект Implementer
//
//var implementer = Implementer()
//
////даем свойсту delegate доступ к свойству generalText по средствам ссылки на объект класса General
////то есть обратившись через ссылку на General, мы получаем доступ к свойствам его объекта, поскольку переменная delegate имеет тот же тип что и класс General
////значит по средствам протокола у нас есть возможность обращаться к его св-ам и методам
//
//implementer.delegate = general
//implementer.delegate.changeText(text: "Good bye!")
//
//
//general.generalText
//
//
//
//////////////////////////
//
//
//protocol SomeDelegate {
//    func printSomeText(someText: String)
//}
//
////Делегат
//class SomeClassImplementsDelegate: SomeDelegate {
//    func printSomeText(someText: String) {
//        print(someText + "Class Implements Delegate")
//    }
//}
//
////Делегатор
//class SomeClassUsingDelegate {
//    var delegate: SomeDelegate!
//    func simulateAction(text: String) {
//        delegate.printSomeText(someText: text)
//    }
//}
//
//let implementor = SomeClassImplementsDelegate()
//let delegate = SomeClassUsingDelegate()
//
//delegate.delegate = implementor
//delegate.simulateAction(text: "HEllo ")


///////////////////// задание на делегирование 14.6
///
///

//протокол FeedDeliveryDelegate, который обязывает реализовать три метода feedDeliveryByAddres, feedDeliveryTime и ordered;

protocol FeedDeliveryDelegate: AnyObject {
    func feedDeliveryByAdress(adress: String)
    func feedDeliveryTime(time: String)
    func orderd(ordered: [String]) -> [String]
}

//два перечисления: одно отвечает за еду DogFeed, а второе – за игрушки DogToys;

enum DogFeed {
    case meat(cost: Int)
    case fish(cost: Int)
    case bone(cost: Int)
}

enum DogToys {
    case ball(cost: Int)
    case flyPlate(cost: Int)
    case rubberToys(cost: Int)
}

//класс FeedShopHappyDog, который и реализует наш делегат.

class FeedShopHappyDog: FeedDeliveryDelegate {
    
    var ordered: [String] = []

    
    func printOrders(str: [String]) {
        print(str)
    }
    
    func feedDeliveryByAdress(adress: String) {
        self.ordered += ["shop recived order by adress: \(adress)"]
    }
    
    func feedDeliveryTime(time: String){
        self.ordered += ["shop recived order by time: \(time)"]
    }
    
    func orderd(ordered: [String]) -> [String]{
        self.ordered += ordered
        return self.ordered
    }
    
   
    
    
}


//класс WebsiteForOrderingFeedShopHappyDog, который имитирует действия пользователя. В нём же содержится переменная делегата.



class WebsiteForOrderingFeedShopHappyDog {
    weak var delegate: FeedDeliveryDelegate?
    
    var ballForDogs = DogToys.ball(cost: 250)
    var deliciosMeat = DogFeed.meat(cost: 200)

    
    func addToListDogToys(toys: DogToys){
        delegate?.orderd(ordered: ["\(toys)"])
        
        
    }
    
    func addToListDogFeed(feed: DogFeed){
        delegate?.orderd(ordered: ["\(feed)"])
     
    }
    
    func createDeliveryByAdress(adress: String) {
        delegate?.feedDeliveryByAdress(adress: adress)
    }
    
    func createDeliveryTime(time: String) {
        delegate?.feedDeliveryTime(time: time)
    }
    
    func printSummaryOrder() {
       
    }
    
}

var delegate = WebsiteForOrderingFeedShopHappyDog()
var shop = FeedShopHappyDog()
delegate.delegate = shop

delegate.addToListDogToys(toys: delegate.ballForDogs)
delegate.addToListDogFeed(feed: delegate.deliciosMeat)
delegate.createDeliveryByAdress(adress: "fuchika 14")
delegate.createDeliveryTime(time: "10.00")
delegate.printSummaryOrder()
print(shop.ordered)






