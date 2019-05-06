import Foundation

func swap (a : inout Int, b : inout Int)
{
    var temp : Int;
    temp = a;
    a = b;
    b = temp;
}

var a = 1;
var b = 2;

swap(&a, &b);
print("Value of a is: ",a);
print("Value of b is: ",b);