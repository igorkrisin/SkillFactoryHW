//1 Создайте перечисление для ошибок. Добавьте в него 3 кейса:
//
//ошибка 400,
//ошибка 404,
//ошибка 500.

enum Errors: Error {
    case Error400
    case Error404
    case Error500
}

//Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500).

//тут не совсем понял какого типа содать переменную и создал 2 - одна с типом error и одна string, которая хранит текст ошибки, проверять тип  Error в do- catch думаю не совсем правльно так как этот тип должен выбрасываться в исключении, поэтому проверяю тип String в блоке do catch  и в функции
let errorBadRequest: Errors = Errors.Error400


let error: String = "404"

//И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.

print("/////////////////////Вывод сообщения в консоль задание 1:")



do {
    if(error == "400")  {
        throw Errors.Error400
    }
    if (error == "404")  {
        throw Errors.Error404
    }
    if (error == "500")  {
        throw Errors.Error500
    }
} catch Errors.Error400 {
    print("Bad Request 400 сервер нашел синтаксическую ошибку в запросе")
} catch Errors.Error404 {
    print("Not Found 404 нет ресурса по данному запросу")
} catch Errors.Error500 {
    print("500 Internal Server Error любая внутренняя ошибка севера не в входящая в рамки ошибрк класса")
}

print("\n")

//2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!

print("//////////////////////////Вывод сообщения в консоль задание 2:")






func hadleerror(_ error: String) throws {
    if(error == "400") {
        throw Errors.Error400
    }
    if (error == "404") {
        throw Errors.Error404
    }
    if (error == "500") {
        throw Errors.Error500
    }
}

 

do {
    try hadleerror(error)
}  catch Errors.Error400 {
    print("Bad Request 400 сервер нашел синтаксическую ошибку в запросе")
} catch Errors.Error404 {
    print("Not Found 404 нет ресурса по данному запросу")
} catch Errors.Error500 {
    print("500 Internal Server Error любая внутренняя ошибка севера не в входящая в рамки ошибрк класса")
}

print("\n")


//3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.


print("//////////////////////////Вывод сообщения в консоль задание 3:")

func checkComparisonType<T: Equatable, E: Equatable> (_ firstType: T, _ secondType: E) {
    if type(of: firstType) == type(of: secondType) {
        print("Yes")
    } else {
        print("No")
    }
}

checkComparisonType(5, Errors.Error400)

print("\n")

//4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.

print("//////////////////////////Вывод сообщения в консоль задание 4:")


enum ErrorType: Error {
    case SameType
    case DifferentType
}


func checkComparisonTypeWithTrow<T: Equatable, E: Equatable> (_ firstType: T, _ secondType: E) throws {
    if type(of: firstType) == type(of: secondType) {
        throw ErrorType.SameType
    } else {
        throw ErrorType.DifferentType
    }
}

//try checkComparisonTypeWithTrow(5, 5)
//try checkComparisonTypeWithTrow(4, "rt")

print("\n")

//5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.

print("//////////////////////////Вывод сообщения в консоль задание 5:")

func checkValueForArguments<T: Equatable, E> (_ firstValue: T, _ secondValue: E) -> String {
    if firstValue == secondValue as? T {
        return "Значения равны"
    }else {
        return "Значения не равны"}
}

print(checkValueForArguments(12.0, 12.0))
print(checkValueForArguments("test", 12.0))























