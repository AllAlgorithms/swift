
import UIKit

let numbers = [1, 2, 4, 5, 8, 12, 15, 20]

func LinearSearchForSearchValue (searchValue: Int, array: [Int]) -> Bool{
    for num in array {
        if num == searchValue {
            return true
        }
    }
    return false
}

print(LinearSearchForSearchValue(searchValue: 3, array: numbers))

