func fizzBuzz(_ number: Int) {
  for i in 1...number {
    var result = ""

    if i % 3 == 0 {
      result += "Fizz"
    }

    if i % 5 == 0 {
      result += (result.isEmpty ? "" : " ") + "Buzz"
    }

    if result.isEmpty {
      result += "\(i)"
    }

    print(result)
  }
}
