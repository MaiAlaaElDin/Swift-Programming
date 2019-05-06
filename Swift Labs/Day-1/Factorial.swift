import Foundation

func getFactorial(number: Int) -> Int{
    var factorial : Int = 1;
    if number != 0 && number != 1 {
        for index in 1...number {
            factorial = factorial * index;
        }

    }else{
        factorial = 1;
    }
    return factorial;
}

print("Factorial of 0: ", getFactorial(number:0));
print("Factorial of 1: ", getFactorial(number:1));
print("Factorial of 5: ", getFactorial(number:5));

