func insert<T: Comparable>(array: inout [T], rightIndex: Int, value: T) {
    var index = rightIndex
    
    while index >= 0 && value < array[index] {
        array[index+1] = array[index]
        index -= 1
    }
    array[index+1] = value
}

func insertionSort<T: Comparable>(array: inout [T]) {
    if array.isEmpty {
        return
    }
    
    for index in 1..<array.count {
        insert(array: &array, rightIndex: index-1, value: array[index])
    }
}

var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
insertionSort(array: &numbers)

print(numbers)

