import Foundation

// Абстракция данных пользователя
protocol UserData {
    var userName: String { get }    //Имя пользователя
    var userCardId: String { get }   //Номер карты
    var userCardPin: Int { get }       //Пин-код
    var userPhone: String { get }       //Номер телефона
    var userCash: Float { get set }   //Наличные пользователя
    var userBankDeposit: Float { get set }   //Банковский депозит
    var userPhoneBalance: Float { get set }    //Баланс телефона
    var userCardBalance: Float { get set }    //Баланс карты
}



enum UserActions {
    case responceCardBalance
    case responseDepositeBalance
    case withDrawCashCard(summ: Float)
    case withDrawCashDeposite(summ: Float)
    case addPhoneBalanceWithCard(summ: Float)
    case addPhoneBalanceWithCash(summ: Float)
    case addDepositBalanseWithCash(summ: Float)
    case addCardtBalanseWithCash(summ: Float)
}


// Виды операций, выбранных пользователем (подтверждение выбора)
enum DescriptionTypesAvailableOperations: String {
    case responceCardBalance = "Do you want check card balance"
    case responseDepositeBalance = "Do you want check deposite balance"
    case getCashCard = "Do you want get cash from card"
    case getGashDeposite = "Do you want get cash from Deposite"
    case addPhoneBalanceWithCard = "Do you want add cash to phone's balanse with card"
    case addPhoneBalanceWithCash = "Do you want add cash to phone's balanse with deposite"
    case addDepositBalanseWithCash = "Do you want add Deposite balance with cash"
    case addCardtBalanseWithCash = "Do you want add  Card balance with cash"
}

// Способ оплаты/пополнения наличными, картой или через депозит
enum PaymentMethod {
    case card
    case cash
    case deposite
}


// Тексты ошибок
enum TextErrors: String {
    case emptyBalanseAtCard = "your card is not have many"
    case emptyBalanseAtDeposite = "your deposite is not have many"
    case noManyInAtmCard = "no many on card"
    case noManyInAtmDeposite = "no many on deposite"
    case notEnoughManyCard = "not enough many on card"
    case notEnoughManyDeposite = "not enough many on deposite"
    case notEnoughCash = "your many is not right"
    case incorrectPinOrIdCard = "you entered wrong pin or incorrect id card"
    case incorrectNumberPhone = "you entered incorrect number phone"
}



// Протокол по работе с банком предоставляет доступ к данным пользователя зарегистрированного в банке
protocol BankApi {
    func showUserCardBalance()
    func showUserDepositBalance()
    func showUserToppedUpMobilePhoneCash(cash: Float)
    func showUserToppedUpMobilePhoneCard(card: Float)
    func showWithdrawalCard(cash: Float)
    func showWithdrawalDeposit(cash: Float)
    func showTopUpCard(cash: Float)
    func showTopUpDeposit(cash: Float)
    func showError(error: TextErrors)
    
    func checkUserPhone(phone: String) -> Bool
    func checkMaxUserCash(cash: Float) -> Bool
    func checkMaxUserCard(withdraw: Float) -> Bool
    func checkMaxUserDeposit(withdraw: Float) -> Bool
    func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool
    
    mutating func topUpPhoneBalanceCash(pay: Float)
    mutating func topUpPhoneBalanceCard(pay: Float)
    mutating func getCashFromDeposit(cash: Float)
    mutating func getCashFromCard(cash: Float)
    mutating func putCashDeposit(topUp: Float)
    mutating func putCashCard(topUp: Float)
}





class User: UserData {
    
    
    var userName: String    //Имя пользователя
    var userCardId: String //Номер карты
    var userCardPin: Int //Пин-код
    var userPhone: String       //Номер телефона
    var userCash: Float //Наличные пользователя
    var userBankDeposit: Float  //Банковский депозит
    var userPhoneBalance: Float    //Баланс телефона
    var userCardBalance: Float//Баланс карты
    
    init(userName: String, userCardId: String, userCardPin: Int, userPhone: String, userCash: Float, userBankDeposit: Float, userPhoneBalance: Float, userCardBalance: Float) {
        self.userName = userName
        self.userCardId = userCardId
        self.userCardPin = userCardPin
        self.userPhone = userPhone
        self.userCash = userCash
        self.userBankDeposit = userBankDeposit
        self.userPhoneBalance = userPhoneBalance
        self.userCardBalance = userCardBalance
    }
}





class ATM {
    
    private let userCardId: String
    private let userCardPin: Int
    private var someBank: BankApi
    private let action: UserActions
    private let paymentMethod: PaymentMethod?
  
    init(userCardId: String, userCardPin: Int, someBank: BankApi, action: UserActions, payment: PaymentMethod? = nil) {
        
        self.userCardPin = userCardPin
        self.someBank = someBank
        self.userCardId = userCardId
        self.paymentMethod = payment
        self.action = action
        sendUserDataToBank(userCardId: userCardId, userCardPin: userCardPin, actions: action, payment: paymentMethod)
        
    }

    public final func sendUserDataToBank(userCardId: String, userCardPin: Int, actions: UserActions, payment: PaymentMethod?) {
        let isCurrentUser = someBank.checkCurrentUser(userCardId: userCardId, userCardPin: userCardPin)
        
        if !isCurrentUser {
            someBank.showError(error: .incorrectPinOrIdCard)
            return
        }
        
        switch actions {

        case .addPhoneBalanceWithCard(let summ):
            someBank.topUpPhoneBalanceCard(pay: summ)
            
        case .addPhoneBalanceWithCash(let summ):
            someBank.topUpPhoneBalanceCash(pay: summ)
           
        case .withDrawCashCard(let summ):
            someBank.getCashFromCard(cash: summ)
            
        case .withDrawCashDeposite(let summ):
            someBank.getCashFromDeposit(cash: summ)
            
        case .responceCardBalance:
            someBank.showUserCardBalance()
            
        case .responseDepositeBalance:
            someBank.showUserDepositBalance()
            
        case .addCardtBalanseWithCash(let summ):
            someBank.putCashCard(topUp: summ)
            
        case.addDepositBalanseWithCash(let summ):
            someBank.putCashDeposit(topUp: summ)
            
        }
        
    }
}


struct Bank: BankApi {
    
    private var user: UserData
    
    init(user: UserData) {
        self.user = user
    }
    
    func showUserCardBalance() {
        let answer = """
            
            Hello \(user.userName),
            \(DescriptionTypesAvailableOperations.responceCardBalance.rawValue)
            your \(PaymentMethod.card) balance is \(user.userCardBalance)
        
        """
        print(answer)
       
        
    }
    func showUserDepositBalance() {
        let answer = """
            Hello \(user.userName),
            \(DescriptionTypesAvailableOperations.responseDepositeBalance.rawValue)
            your \(PaymentMethod.deposite) balance is \(user.userBankDeposit)
        
        """
        print(answer)
    }
    func showUserToppedUpMobilePhoneCash(cash: Float) {
        let answer = """
            Hello \(user.userName) you add balance phone to \(cash) $
            now balance phone  is \(user.userPhoneBalance)
        
        """
        //добавил строку баланса что бы тестировать правильность (в реальности банкомат не знает сколько денег на балансе, как правило)
        print(answer)
    }
    func showUserToppedUpMobilePhoneCard(card: Float) {
        let answer = """
            Hello \(user.userName), \(DescriptionTypesAvailableOperations.addPhoneBalanceWithCard.rawValue)
            you add balance phone to \(card) $
            now balance your \(PaymentMethod.card) is \(user.userCardBalance) $
            now balance phone  is \(user.userPhoneBalance) $
        
        """
        
        //добавил строку баланса что бы тестировать правильность (в реальности банкомат не знает сколько денег на балансе, как правило)
        print(answer)
    }
    func showWithdrawalCard(cash: Float) {
        let answer = """
            Hello \(user.userName), \(DescriptionTypesAvailableOperations.getCashCard.rawValue) to \(cash) $
            now balance your \(PaymentMethod.card) is \(user.userCardBalance) $
        
        """
        
        //добавил строку баланса что бы тестировать правильность (в реальности банкомат не знает сколько денег на балансе, как правило)
        print(answer)
    }
    func showWithdrawalDeposit(cash: Float) {
        let answer = """
            Hello \(user.userName), \(DescriptionTypesAvailableOperations.getGashDeposite.rawValue) to \(cash) $
            now balance your \(PaymentMethod.deposite) is \(user.userBankDeposit) $
        
        """
        
        //добавил строку баланса что бы тестировать правильность (в реальности банкомат не знает сколько денег на балансе, как правило)
        print(answer)
    }
    func showTopUpCard(cash: Float) {
        let answer = """
            Hello \(user.userName), \(DescriptionTypesAvailableOperations.addCardtBalanseWithCash.rawValue) \(cash) $
            now balance your \(PaymentMethod.card) is \(user.userCardBalance) $
        
        """
        
        print(answer)
    }
    func showTopUpDeposit(cash: Float) {
        let answer = """
            Hello \(user.userName), \(DescriptionTypesAvailableOperations.addDepositBalanseWithCash.rawValue) \(cash) $
            now balance your \(PaymentMethod.deposite) is \(user.userBankDeposit) $
        
        """
        
        print(answer)
    }
    func showError(error: TextErrors) {
        switch error {
        
        case .emptyBalanseAtCard:
            print(error.rawValue)
        case .emptyBalanseAtDeposite:
            print(error.rawValue)
        case .incorrectPinOrIdCard:
            print(error.rawValue)
        case .notEnoughCash:
            print(error.rawValue)
        case .noManyInAtmCard:
            print(error.rawValue)
        case .noManyInAtmDeposite:
            print(error.rawValue)
        case .notEnoughManyCard:
            print(error.rawValue)
        case .notEnoughManyDeposite:
            print(error.rawValue)
        case .incorrectNumberPhone:
            print(error.rawValue)
        }
    }
    
    func checkUserPhone(phone: String) -> Bool {
        let index0 = phone.index(phone.startIndex, offsetBy: 0)
        let index1 = phone.index(phone.startIndex, offsetBy: 1)
        
        if(phone.count != 11 || phone[index0] != "8" &&  phone[index0] != "7" || phone[index1] != "9" ) {
            showError(error: .incorrectNumberPhone)
            return false
        }
        return true
    }
    func checkMaxUserCash(cash: Float) -> Bool {
        return cash <= user.userCardBalance
    }
    func checkMaxUserCard(withdraw: Float) -> Bool {
        return withdraw <= user.userCardBalance
    }
    func checkMaxUserDeposit(withdraw: Float) -> Bool {
        return withdraw <= user.userBankDeposit
    }
    
    func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool {
            return userCardId.count == 16 && userCardId == user.userCardId && userCardPin == user.userCardPin
    }
    
   
    
    
    mutating func topUpPhoneBalanceCash(pay: Float) {
        if !checkUserPhone(phone: user.userPhone){
            return
        }
        if checkMaxUserCash(cash: pay){
            self.user.userPhoneBalance += pay
            self.user.userCash -= pay
            showUserToppedUpMobilePhoneCash(cash: pay)
        }
        else{
            showError(error: .notEnoughCash)
        }
        
    }
    mutating func topUpPhoneBalanceCard(pay: Float) {
        if !checkUserPhone(phone: user.userPhone){
            return
        }
        if checkMaxUserCard(withdraw: pay){
            self.user.userPhoneBalance += pay
            self.user.userCardBalance -= pay
            showUserToppedUpMobilePhoneCard(card: pay)
        } else{
            showError(error: .notEnoughManyCard)
        }
        
    }
    mutating func getCashFromDeposit(cash: Float) {
        if checkMaxUserDeposit(withdraw: cash) {
            self.user.userCash += cash
            self.user.userBankDeposit -= cash
            showWithdrawalDeposit(cash: cash)
        } else{
            showError(error: .notEnoughManyDeposite)
        }
    }
    mutating func getCashFromCard(cash: Float) {
        if checkMaxUserCard(withdraw: cash) {
            self.user.userCash += cash
            self.user.userCardBalance -= cash
            showWithdrawalCard(cash: cash)
        } else{
            showError(error: .notEnoughManyCard)
        }
    }
    mutating func putCashDeposit(topUp: Float) {
        self.user.userBankDeposit += topUp
        self.user.userCash -= topUp
        showTopUpDeposit(cash: topUp)
    }
    mutating func putCashCard(topUp: Float) {
        self.user.userCardBalance += topUp
        self.user.userCash -= topUp
        showTopUpCard(cash: topUp)
        
    }
    
}






var user = User(userName: "Egor", userCardId: "1221111111111111", userCardPin: 1234, userPhone: "89999990000", userCash: 20000, userBankDeposit: 50000, userPhoneBalance: 300, userCardBalance: 40000)



var apiBank = Bank(user: user)
print("пополнение баланса при помощи наличных:")
var atm = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .addPhoneBalanceWithCash(summ: 4000), payment: .cash)
print("поплнение баланса при помощи карты: ")
var atm2 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .addPhoneBalanceWithCard(summ: 4000), payment: .card)
print("запрос баланса карты: ")
var atm3 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .responceCardBalance, payment: .card)
print("запрос баланса депозита: ")
var atm4 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .responseDepositeBalance, payment: .card)
print("снятие наличных с депозита: ")
var atm5 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .withDrawCashDeposite(summ: 300), payment: .card)
print("снятие наличных с карты: ")
var atm6 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .withDrawCashCard(summ: 700), payment: .card)
print("пополнение карты наличнми: ")
var atm7 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .addCardtBalanseWithCash(summ: 100), payment: .card)
print("пополнение депозита наличными: ")
var atm8 = ATM(userCardId: "1221111111111111", userCardPin: 1234, someBank: apiBank, action: .addDepositBalanseWithCash(summ: 100), payment: .card)

















