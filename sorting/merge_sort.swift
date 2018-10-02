func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
    let leftSubarray = Array(array[startIndex...middleIndex])
    let rightSubarray = Array(array[middleIndex+1...endIndex])
    
    var index = startIndex
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
            array[index] = leftSubarray[leftIndex]
            leftIndex += 1
        }
        else {
            array[index] = rightSubarray[rightIndex]
            rightIndex += 1
        }
        index += 1
    }
    
    while leftIndex < leftSubarray.count {
        array[index] = leftSubarray[leftIndex]
        index += 1
        leftIndex += 1
    }
    
    while rightIndex < rightSubarray.count {
        array[index] = rightSubarray[rightIndex]
        index += 1
        rightIndex += 1
    }
}

func mergeSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
    // Base case
    if startIndex >= endIndex {
        return
    }
    
    let middleIndex = (startIndex + endIndex) / 2
    mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
    mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
    merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
}

func mergeSort<T: Comparable>(array: inout [T]) {
    mergeSort(array: &array, startIndex: 0, endIndex: array.count-1)
}

var arr = [46, 24, 33, 10, 2, 81, 50]
print("Unsorted Array")
print(arr)

mergeSort(array: &arr)

print("Sorted Array")
print(arr)
