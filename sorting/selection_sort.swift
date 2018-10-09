/* Algorithm: Selection Sort
 * Time Complexity
 *  Avg, Best, Worst Cases: O(n^2)
 */


var arr = [1, 5, 4, 2, 8, 6, 29]

func selectionSort<T: Comparable>(_ a:[T]) -> [T] {
    var array = a
    guard array.count > 1 else { return array }
    
    for i in 0..<array.count {
        if let min = Array(array[i..<array.count]).min() {
            if let minIndex = array.index(of: min) {
                array.swapAt(i, minIndex)
            }
        }
    }
    return array
}

print("Unsorted Array: \(arr)")
print("Sorted Array: \(selectionSort(arr))")
