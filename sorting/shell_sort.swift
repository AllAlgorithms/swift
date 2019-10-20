
/**
* Created by : Bill Tanthowi Jauhari
* Date : 20-10-2019
* Algorithm : Shell Sort
*/

let arr: [Int] = [
    34, 21, 34, 67, 12, 10, 45, 90, 50, 76, 78
]

class ShellSort {

    var arr = [Int]()
    var interval: Int = 0
    var is_odd: Bool = false

    init(arr: [Int])
    {
        self.arr = arr
    }

    public func generateInterval()
    {
        let total_arr = arr.count

        if total_arr % 2 == 0 {
            self.interval = total_arr / 2
            self.is_odd = false
        } else {
            self.interval = Int( total_arr / 2 )
            self.is_odd = true
        }
    }

    public func firstPairingArr(interval: Int)
    {
        for n in 0 ..< interval {
            
            var indexPaired = interval + n
            
            if is_odd {
                if n < interval {
                    swap(first: n, second: indexPaired)
                }
            } else {
                swap(first: n, second: indexPaired)
            }
        }
    }
    
    public func secondPairingArr(interval: Int)
    {
        
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

let sorting = ShellSort(arr: arr)
sorting.generateInterval()
print(sorting.interval)
print(sorting.arr)
sorting.pairingArr(interval: sorting.interval)
print(sorting.arr)

