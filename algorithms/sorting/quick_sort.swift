/* Algorithm: Quick Sort
 * Time Complexity
 * Worst Case: O(n^2)
 * Avg, Best Case: O(nlogn)
 */

var arr = [1, 5, 4, 2, 8, 6, 29]

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter{ $0 < pivot }
    let greater = array.filter{ $0 > pivot }
    let equal = array.filter{ $0 == pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

print("Unsorted Array: \(arr)")
print("Sorted Array: \(quickSort(arr))")
