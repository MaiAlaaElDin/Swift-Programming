import UIKit

var str = "Hello, playground"

struct MyStruct{
    var name : String
    var title : String
    var age : Float
}

class ClassA{
    var name : String = ""
    var title : String = ""
    var age : Float = 0.0
    var myArray = [1,2,3,4,5,6,7,8,9,10]
    
    //Subscript
    subscript(index : Int) -> Int{
        get{
            return myArray[index]
        }
        set(x){
            myArray[index] = x
        }
    }
}

var objStruct = MyStruct(name: "Mai", title: "Hey!", age: 23.0)
var objClass = ClassA()

print(objClass[0]);
objClass[1] = 7;
print(objClass[1]);


/////////////////////////////////////////////////////////////

//Observer Variable
var myObserver : Int = 0{
    willSet{
        print("About to change to: ", newValue) //default: newValue
    }
    didSet{
        print("Did change from: ", oldValue) //default: oldValue
        print("To New Value: ", myObserver)
    }
}
myObserver = 10


