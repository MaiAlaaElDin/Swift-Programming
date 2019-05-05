import UIKit

var str = "Hello, playground"

enum EnumA{
    case case1, case2, case3
}

var obj = EnumA.case1
obj = .case2
print(obj)


enum EnumB : String{
    case case1 = "XYZ", case2, case3
}
var obj2 = EnumB.case1.rawValue
var obj3 = EnumB.case3
print(obj2)
print(obj3)


//Extension

extension String{
    func sayHi(){
        print("Hi Hey Hello")
    }
}

var x : String = ""

x.sayHi()
