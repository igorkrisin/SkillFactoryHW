import UIKit


//1Создай кортеж для двух человек с одинаковыми типами данных и параметрами.
//При том одни значения доставай по индексу, а другие — по параметру.

let petr = (age: 18, name: "Petr", secondName: "Fedorov")
let fedor = (age: 28, name: "Fedor", secondName: "Petrov")

petr.0
petr.1
petr.2

fedor.age
fedor.name
fedor.secondName


//2Создай массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце). Используя цикл for и этот массив:
let dayOnMonths: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


//выведи количество дней в каждом месяце:
for numberDay in dayOnMonths {
    print(numberDay)
}

//используй еще один массив с именами месяцев чтобы вывести название месяца + количество дней:
let monthInYear: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]

print("\n///////  InArray:  //////////\n")//данные принты только для понятного вывода в консоль результатов

for i in 0..<dayOnMonths.count {
    print(monthInYear[i], dayOnMonths[i])
}

//сделай тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней):

let monthTuplesInArray: [(String, Int)] = [(monthInYear[0], dayOnMonths[0]),(monthInYear[1], dayOnMonths[1]), (monthInYear[2], dayOnMonths[2]), (monthInYear[3], dayOnMonths[3]), (monthInYear[4], dayOnMonths[4]), (monthInYear[5], dayOnMonths[5]), (monthInYear[6], dayOnMonths[6]), (monthInYear[7], dayOnMonths[7]), (monthInYear[8], dayOnMonths[8]), (monthInYear[9], dayOnMonths[0]), (monthInYear[10], dayOnMonths[10]), (monthInYear[11], dayOnMonths[11]) ]

print("\n///////  Intuples:  //////////\n")

for (month, day) in monthTuplesInArray {
    print( month, day)
}


//сделай тоже самое, только выведи дни в обратном порядке (порядок в исходном массиве не меняется):
print("\n///////  Reverse day for month:  //////////\n")
for i in 0..<dayOnMonths.count {
    
    print(monthInYear[i], dayOnMonths[dayOnMonths.count - i - 1])
}

//для произвольно выбранной даты (месяц и день) посчитай количество дней до конца года
//сделал данное задание при помощи функции, в иделе вынести проверку на правильность ввода дня и месяца в отдельные функцию и вернуть Int, ошибки отловить try , но я думаю это слишком будет

print("\n///////  function howManyDayToEndYear:  //////////\n")

func howManyDayToEndYear( _ monthName: String, _ dayInMonth: Int) -> String {
    
    let dayOnMonths: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let monthInYear: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
    
    if !monthInYear.contains(monthName) { //поверка правильности ввода месяца
        return "name month is wrong, please try again"
        
    }
    
    var numberMonthOnArray: Int = 0
    
    
    for i in 0..<monthInYear.count { // вычисляем какой по счету элемент массива данный месяц (стандартный метод знаю что есть, решил через for)
        if monthInYear[i] == monthName {
            numberMonthOnArray = i
        }
    }
    
    if dayInMonth < 0 || dayInMonth > dayOnMonths[numberMonthOnArray] { //проверка что день введен верно
        return "number day in month is wrong, please try again"
    }
    
    var countWholeMonth: Int = 0 // количество полныъ месяцев (без остатка)
    
    if numberMonthOnArray < 12 {
        countWholeMonth = numberMonthOnArray + 1
    } else if  numberMonthOnArray == 12 { // если декабрь, то ничего не прибавляем что бы не вылететь за границы
        countWholeMonth = numberMonthOnArray
    } else {
        print("error in numberMonthOnArray")
    }
    
 

    var howManyDay = dayOnMonths[countWholeMonth..<dayOnMonths.count].reduce(0, +) // попробовал, как работает reduce
    //    for i in countWholeMonth..<dayOnMonths.count {
    //        howManyDay += dayOnMonths[i]
    //    }
    
    let recentOfMonth = dayOnMonths[numberMonthOnArray] - dayInMonth //вычисляем остаток дней в месяце от указаной даты
    
    return String(howManyDay + recentOfMonth)
}

//TODO: реализовать проще - умножить на дни количесво месяцев и вычесть остаток от дней???


print("day to be year's end: ",howManyDayToEndYear("January", 1))

print("\n///////  task 3:  //////////\n")

//3 Создай словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.

var journal: [String: Int] = ["Иванов": 5, "Петров": 2, "Сидоров": 4, "Васильев": 3]

//Повысь студенту оценку за экзамен

journal.updateValue(4, forKey: "Васильев")
//второй вариант изменения значения в словаре
journal["Сидоров"] = 5

//Если оценка положительная (4 или 5) или удовлетворительная (3), то выведи сообщение с поздравлением, отрицательная (1, 2) - отправь на пересдачу
journal["Иванов"]

// перебор всех студентов с обращением к ним
for (nameStudent, noteStudent) in journal {
    if noteStudent >= 3 {
        print("\(nameStudent) congratulftion")
    } else {
        print("\(nameStudent) let's go to exam again")
    }
    
}

// обраъщение к единичному студента
if let noteStudent = journal["Иванов"] {
    if(noteStudent >= 3) {
        print("congratulation")
    } else {
        print("let's go to exam again")
    }
}


//Добавь еще несколько студентов — это будут новые одногруппники!

journal["Леонов"] = 3
journal["Филимонов"] = 4

//Удали одного студента — он отчислен

journal["Петров"] = nil


//Посчитай средний балл всей группы по итогам экзамена. рещил через функцию реализовать
print("\n///////  func arrangeNoteForStudents:  //////////\n")

func arrangeNoteForStudents( _ journal: [String:Int]) {
    var summNoteStudents: Int = 0
    
    for noteStudent in journal.values {
        summNoteStudents += noteStudent
    }
    
    let arrangeNote: Float = Float(summNoteStudents) / Float(journal.count)//можно без этой константы обойтись создал для наглядности и читаемости кода
    
    print("arange value note for everyone students: \(arrangeNote)")
}

arrangeNoteForStudents(journal)














