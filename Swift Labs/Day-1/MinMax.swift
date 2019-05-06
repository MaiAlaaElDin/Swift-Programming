import Foundation

func getMinAndMax (array : [Int]) ->(min : Int , max : Int){
    var min = array[0];
    var max = array[1];

    for item in array {
        if item > max{
            max = item;
        }
        else if item < min{
            min = item;  
        }  
    }
    return (min, max);
}

var myTuple = getMinAndMax(array: [-2,0,1,2,4,5,7,10,15]);
print("Minimum Value: ", myTuple.0);
print("Maximum Value: ", myTuple.1);