import UIKit

var str = "Hello, playground"

var strArr = ["Esraa", "Mai","Ahmed", "Rokaya","Zeinab", "Muhammad"]

strArr.sort { (s1: String, s2: String) -> Bool in
    return s1 < s2
}

strArr.sort { $0 < $1 }

print(strArr)

//protocols: blueprint of methods

protocol extra{
    func method2()
}

protocol myProtocol : extra{
    var firstName : String {get} //constant
    var lastName : String {get set} //stored property
    var fullName : String {get set} //computed property
    var id : Int {get} // can be read - written
    
    func instanceMethod() -> String
    static func myStaticMethod()
}

struct MyStruct : myProtocol{
    
    let firstName: String = "Mai "
    
    var lastName: String = "Alaa"
    
    var fullName: String{
        get{
            return firstName + lastName
        }set{
            print("Set")
        }
    }
    
    var id: Int{
        get{
            return 20
        }set{
            print("Set")
        }
    }
    
    func instanceMethod() -> String{
        print("Instance Method")
        return "instanceMethod"
    }
    
    static func myStaticMethod() {
        print("Static Method")
    }
    func method2() {
        print("Method 2")
    }
    
}

var obj = MyStruct()
obj.instanceMethod()
obj.method2()
print(obj.fullName)
MyStruct.myStaticMethod()



