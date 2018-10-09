
func binarySearch(list: [Int], value: Int) -> Int? {
    var right = list.count - 1
    var left = 0
    while left <= right {
        let mid = (left + right) / 2
        if list[mid] == value {
            return mid
        }
        if list[mid] < value {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return nil
}

print(binarySearch(list: [1,2,3,4,5], value: 0))
print(binarySearch(list: [1,2,3,4,5], value: 1))
print(binarySearch(list: [1,2,3,4,5], value: 2))
print(binarySearch(list: [1,2,3,4,5], value: 3))
print(binarySearch(list: [1,2,3,4,5], value: 4))
print(binarySearch(list: [1,2,3,4,5], value: 5))
print(binarySearch(list: [1,2,3,4,5], value: 6))
