func countDigits(number: Double) -> Int {
    let numberAsString = "\(number)".filter("0123456789".contains) /// filter out any non-numeric characters
            
    var numberOfDigits = 0 /// number of digits, starting with 0
    for _ in numberAsString { /// loop over `numberAsString`
        numberOfDigits += 1
    }
            
    return numberOfDigits
}
        
let number = 123456.789 /// define number
let numberOfDigits = countDigits(number: number) /// call the function
print("number of digits: \(numberOfDigits)") /// result: number of digits: 9
