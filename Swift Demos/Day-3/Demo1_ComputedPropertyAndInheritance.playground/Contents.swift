import UIKit

var str = "Hello, playground"

class Parent {
    var myStored : Int = 0
    var myComputed : Double{
        get{
            return 5 * 6
        }
        set{
            print("Setted")
        }
    }
    
    func sayHi() {
        print("Hi Parent")
    }
    
    init(){
        print("Parent init")
    }
}


class child : Parent{
    override var myStored : Int {
        didSet{
            print("Did Set")
        }
        willSet{
            myStored = newValue
            print("Will Set")
        }
    }
    
    override var myComputed : Double{
        get{
            return 10
        }
        set{
            print("From Child: Setted")
        }

    }
    //var myComputed : Double = 10 //Cannot override with stored property
    
    override func sayHi() {
        print("Hi Child")
    }
    
    override init(){
        //super.init()
        print("Child init")
    }
}

var obj = Parent()
//obj.myComputed = 10 //Since we have a setter in the computed property
print(obj.myComputed)
var objChild = child()
objChild.sayHi()
print(objChild.myComputed)
//objChild.myStored = 100
