import Foundation

func sortArray(array :inout [Int] ) -> ([Int]) {

    let size : Int =  array.count

    for i in 0...size {
        for j in 0...size {
            if array[i] > array[j]{
               var temp = array[i]
               array[i] = array[j]
               array[j] = temp
            }
        }
        
    }
    return array;
}
var myArray : [Int] = [10,4,5,9,1,3]
print(sortArray(array : myArray ));

