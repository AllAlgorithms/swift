// Swift implementation of quick sort
//
// Author: Renan Freitas

var arr = [1, 5, 4, 2, 8, 6, 29]

func quicksort(arr: [Int]) -> [Int]{
    var auxArr = arr
    qs(arr: &auxArr, low: 0, high: auxArr.count-1)
    return auxArr
}

func qs(arr: inout [Int], low: Int, high: Int) {
    if low < high {
        let p = partition(arr: &arr, low: low, high: high)
        qs(arr: &arr, low: low, high: p-1)
        qs(arr: &arr, low: p+1, high: high)
    }
}

func partition(arr: inout [Int], low: Int, high: Int) -> Int {
    let pivot = arr[high]
    var i = low
    for j in low..<high {
        if arr[j] < pivot {     // Swap
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            i += 1
        }
    }
    // Swap
    let temp = arr[i]
    arr[i] = arr[high]
    arr[high] = temp
    
    return i
}

print("Unsorted Array")
print(arr)
print("\n\n")
print("Sorted Array")
print(quicksort(arr: arr))

