import Foundation

func isPalindrome(_ no:Int){
    print(findPalindromeOfNumber(no))
}

func isPalindrome(_ str:String){
    
    let len = str.count
    
    //empty sting and single literal string are always palindrome
    if( len > 1){
        print(findPalindromeOfString(str.lowercased()))
    }
    else{
        print(true)
    }
}

//check for palindrome of a number
func findPalindromeOfNumber(_ no:Int) -> Bool{
    
    var copy = no
    var rev = 0
    while copy != 0{
        let digit = copy % 10
        rev = (rev * 10) + digit
        copy = copy / 10
    }
    
    if( rev == no){
        return true
    }
    else{
        return false
    }
}

//extension to extract only letters from a string
extension String {
    var lettersOnly: String {
        return components(separatedBy: CharacterSet.letters.inverted).joined(separator: "")
    }
}

//check for palindrome of a string
func findPalindromeOfString(_ str:String) -> Bool{
    
    let chars = Array(str.lettersOnly)
    let count = chars.count
    for index in  0..<count/2 {
        if chars[index] != chars[count - 1 - index] {
            return false
        }
    }
    return true
    
}

//test cases
isPalindrome(145) // false
isPalindrome(212) // true
isPalindrome("acBcab") //false
isPalindrome("Dammit I'm mad") //true
