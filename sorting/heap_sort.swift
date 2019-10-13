/* Algorithm: Heap Sort
* Worst Case Time Complexity: O(n*log n)
* Best Case Time Complexity: O(n*log n)
* Average Time Complexity: O(n*log n)
* Space Complexity : O(1)
*/

func heapSort(inputArray: [Int]) -> [Int] {
    var ary = inputArray
    let middle: Int = (array.count/2)-1

    // Build max heap
    // BFS traverse in tree
    // number of nodes = (n/2)-1
    for temp in stride(from: middle, through: 0, by: -1) {
        heapify(ary: &ary,n: array.count ,i: temp)
    }

    //Remove the root element and put at the end of the array (nth position)
    //Put the last item of the tree (heap) at the vacant place.
    //Reduce the size of the heap by 1 and heapify the root element again so that we have highest element at root.
    for temp in stride(from: ary.count-1, to: 0, by: -1) { //for temp in (ary.count-1)...0 {
        ary.swapAt(temp, 0)
        heapify(ary: &ary, n: temp, i: 0)
    }

    return ary
}

func heapify(ary: inout [Int],n: Int, i: Int) {
    var largestIndex = i
    let leftIndex = (2*i)+1
    let rightIndex = (2*i)+2
    //find largest element amound left, right, root

    //Check if left is greater than root
    if leftIndex < n && ary[leftIndex] > ary[largestIndex] {
        largestIndex = leftIndex
    }
    //Check if right is greater than root
    if rightIndex < n && ary[rightIndex] > ary[largestIndex] {
        largestIndex = rightIndex
    }
    //swap if root is not largest and heapify again
    if largestIndex != i {
        ary.swapAt(largestIndex, i)
        heapify(ary: &ary, n: n, i: largestIndex)
    }
}

let sortedArray = heapSort(inputArray: [121,10,130,57,36,17])
print(sortedArray)
