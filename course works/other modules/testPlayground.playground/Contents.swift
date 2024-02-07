import Foundation

let numbers = [4, 5, 6, 2, 6, 8, 9, 70]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i  in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}



filterArray(array: numbers, f: {$0 % 2 == 0})

let arr = [1,2,3]

var count: Int = 0

let a =
filterArray(array: numbers) {value in
    for i in arr {
//        count += 1
        if i == value{
            return true
        }
    }
    return false
}

//print(count)


var dict = [Int:Bool]()
for value in arr {
    dict[value] = true
}

let a2 =
filterArray(array: numbers) {value in
    count += 1
    return dict[value] != nil
    
}

//print(count)


//------->TODO
func printNumb(clos:()->())->(){
    
    for y in 1...10 {
        print(y)
        clos()
    }
    
}


printNumb(clos: {
    print(111)
})

let arr1 = [3,5,33,45,2,88,56,45,33,22,11,1]


var reversNumb = arr1.sorted(by: {(num1: Int, num2: Int)->Bool in
    return num1 < num2
})


func numbFiltr(arr: [Int], clos: (Int?, Int)->(Bool)) -> Int{
    var numb: Int?
    for val in arr {
        if clos(numb, val) {
            numb = val
        }
    }
    return numb ?? 0
}

let any =
numbFiltr(arr: arr1){(a: Int?, b: Int) -> Bool in
    return a == nil || a == b
}

let yers = 18

yers > 18 ? print("yes") : print("no")

let verst: Double = 1.0

func convKmToVerst(km: Double)-> Double{
    
    return km * 1066.8/1000
}
convKmToVerst(km: 7)

func costDrive(dist: Double, fuel_consump: Double, costFuel: Double) -> Double{
    return ((dist/100) * fuel_consump) * costFuel
}

costDrive(dist: 1754, fuel_consump: 8.5, costFuel: 45)

let firstSixBits = 0b11111100
print(type(of: firstSixBits))
let n = 5
let b = 8
let c = 128
let result = n * c - b / 2 // 636
 
