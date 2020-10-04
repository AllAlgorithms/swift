
/**
* Created by : Bill Tanthowi Jauhari
* Date : 20-10-2019
* Algorithm : Shell Sort
* Type Sequence : Default ( D/2, D/4, ..., 1)
*/

class ShellSort {

    var arr = [Int]()
    var interval: Int = 2
    var sequence: Int = 2
    var is_odd: Bool = false
    var is_ordered: Bool = false

    init(arr: [Int])
    {
        self.arr = arr
        print("Input : ", arr)
        while !isLastSequence(sequence: sequence) {
            generateInterval(sequence: sequence)
            pairingArr(interval: interval, sequence: sequence)
            sequence = increaseSequence(lastSequence: sequence)
        }
        
        sequence = increaseSequence(lastSequence: sequence)
        generateInterval(sequence: sequence)
        pairingArr(interval: interval, sequence: sequence)
        print(result())
    }
    
    public func result() -> Any
    {
        for n in 0 ..< arr.count {
            if n < (arr.count - 1) {
                if arr[n] < arr[n+1] {
                    is_ordered = true
                } else {
                    return "Error: Array has not been ordered Yet!"
                }
            }
        }
        
        if is_ordered {
            print("Result : ", arr)
            return "Success: Array has ordered!"
        }
        
        return "Error: Array has not been ordered Yet!"
        
    }
    
    public func isLastSequence(sequence: Int) -> Bool
    {
        if Int(arr.count / sequence) <= 1 {
            return true
        }
        
        return false
    }
    
    public func increaseSequence(lastSequence: Int) -> Int
    {
        if isLastSequence(sequence: lastSequence) {
            return arr.count
        }
        
        return lastSequence * 2
    }

    public func generateInterval(sequence: Int)
    {
        let total_arr = arr.count

        if total_arr % sequence == 0 {
            interval = total_arr / sequence
            is_odd = false
        } else {
            interval = Int( total_arr / sequence )
            is_odd = true
        }
    }

    public func pairingArr(interval: Int, sequence: Int)
    {
        for n in 0 ..< interval {
            var firstIndex = n
            var secondIndex = interval + n
            for _ in 1 ..< sequence {
                if is_odd {
                    if n < interval {
                        swap(first: firstIndex, second: secondIndex)
                    }
                } else {
                    swap(first: firstIndex, second: secondIndex)
                }
                
                firstIndex = secondIndex
                secondIndex = secondIndex + interval
            }
        }
    }
    
    public func swap(first: Int, second: Int)
    {
        if arr[first] > arr[second] {
            let temp = arr[first]
            arr[first] = arr[second]
            arr[second] = temp
        }
    }
    
}


let arr: [Int] = [
    33, 21, 34, 67, 12, 10, 45, 90, 50, 76
] // input array

let sorting = ShellSort(arr: arr) // calling the shell sorting class

