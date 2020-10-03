// swift implementation of slow sort
//
// Author: Mehmet KOCA

func slowsort(_ i: Int, _ j: Int) {
    if i >= j {
        return
    }
    let m = (i+j) / 2
    slowsort(i, m)
    slowsort(m+1, j)
    if numberList[j] < numberList[m] {
        let temp = numberList[j]
        numberList[j] = numberList[m]
        numberList[m] = temp
    }
    slowsort(i, j-1)
}