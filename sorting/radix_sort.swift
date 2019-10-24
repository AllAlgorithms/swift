// Radix Sort

///Radix sort is a sorting algorithm that takes as input an array of integers and uses a sorting subroutine( that is often another efficient sorting algorith) to sort the integers by their radix, or rather their digit. Counting Sort, and Bucket Sort are often times used as the subroutine for Radix Sort.

// Step 1:

///The first step in this algorithm is to define the digit or rather the "base" or radix that we will use to sort. For this example we will let radix = 10, since the integers we are working with in the example are of base 10.

//Step 2:

///The next step is to simply iterate n times (where n is the number of digits in the largest integer in the input array), and upon each iteration perform a sorting subroutine on the current digit in question.

// NOTE: This implementation does not handle negative numbers

func radixSort(_ array: inout [Int] ) {
  let radix = 10  //Here we define our radix to be 10
  var done = false
  var index: Int
  var digit = 1  //Which digit are we on?
  while !done {  //While our  sorting is not completed
    done = true  //Assume it is done for now
    var buckets: [[Int]] = []  //Our sorting subroutine is bucket sort, so let us predefine our buckets
    for _ in 1...radix {
      buckets.append([])
    }

    for number in array {
      index = number / digit  //Which bucket will we access?
      buckets[index % radix].append(number)
      if done && index > 0 {  //If we arent done, continue to finish, otherwise we are done
        done = false
      }
    }

    var i = 0

    for j in 0..<radix {
      let bucket = buckets[j]
      for number in bucket {
        array[i] = number
        i += 1
      }
    }

    digit *= radix  //Move to the next digit
  }
}

// Example

func radixSort1(_ arr: inout [Int]) {

    var temp = [[Int]](repeating: [], count: 10)

    for num in arr { temp[num % 10].append(num) }

    for i in 1...Int(arr.max()!.description.characters.count) {

        for index in 0..<temp.count {

            for num in temp[index] {
                temp[index].remove(at: temp[index].index(of: num)!)
                temp[(num / Int(pow(10, Double(i)))) % 10].append(num)
            }
        }
    }

    arr = temp[0]
}
