import Foundation

//Calculate Power Function with loops
func calcPower(base: Int, power: Int) -> Int{
    var result : Int = 1;

    if power != 0 {
        for _ in 1...power  {
            result = result * base;    
        }
    }else{
        result = 1;
    }
    return result;
}

print("2^3 = ", calcPower(base : 2 , power : 3));

//Recursive Calculate Power Function
func recursiveCalcPower(base : Int, power : Int) -> Int {
    if power == 0{
        return 1;
    }
    else{
        return base * recursiveCalcPower(base: base,power:  power - 1);
    }
}

print("2^5 = ",recursiveCalcPower(base : 2 , power : 5));