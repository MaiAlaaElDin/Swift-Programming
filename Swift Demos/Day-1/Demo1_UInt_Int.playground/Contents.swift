import UIKit

var str = "Hello, playground"

//Compile Time Error - Overflow
//let x : UInt = -1

//Compile Time Error - Overflow
//let y : Int8 = Int8.max + 1

//Tuples
let httpstatus = (404, "Not Found");
print(httpstatus.0);
print(httpstatus.1);
//print(httpstatus.2); //Compile time error

let httpstatus2 = (code: 200, msg: "OK");
print(httpstatus2.code);
print(httpstatus2.msg);

//Optional Binding - Safe
var myOptional : Int?
myOptional = 5

//Safe Unwrapping
if let myValue = myOptional{
    print(myValue)
}else{
    print("Cannot unwrap");
}

//Forced Unwrapping - Unsafe - if you are sure the var has a value
print(myOptional!)

//Implicity Unwrapping
var myImplicity : Int! = 7 //b2olo e3mel enta unwrap
var myImplicity2 : Int = myImplicity

print(myImplicity2)


//Functions

//()->void
func temp(){
    
}

func sayHello(){
    print("Hello Swift!");
}
sayHello()

//param1 is an internal name - use it inside the method
//_ to neglect th external name during calling the method
//name is an external name - use it outside in calling the method
func sayHello2(name param1: String) -> String{
    print("Hello \(param1)");
    return "Hello ";
}
print(sayHello2(name:"Mai"))


//(String)->(String)
func defaultExternal(param1: String) -> String{
    print("Hello \(param1)");
    return "Hello";
}
defaultExternal(param1: "Mai Alaa")

//(Int,Int)->Int //Function Type
func mutiply(num1: Int, num2: Int)->Int{
    return num1 * num2;
}

var myVar : (Int,Int)->Int = mutiply

print(myVar(5,6))


