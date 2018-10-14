//: Playground - noun: a place where people can play

import UIKit

func MostCommonName(array: [String]) -> String {
    
    var nameCountDict = [String: Int]()
    
    for name in array {
        if let count = nameCountDict[name] {
            nameCountDict[name] = count + 1
        } else {
            nameCountDict[name] = 1
        }
    }
    
    var mostCommonName = ""
    for key in nameCountDict.keys{
        if mostCommonName == ""{
            mostCommonName = key
        } else {
            if let count = nameCountDict[key] {
                if count > nameCountDict[mostCommonName]! {
                    mostCommonName = key
                }
            }
        }
        print("\(key): \(nameCountDict[key]!)")
    }
    return mostCommonName
}

MostCommonName(array: ["John", "Applesed", "John", "Lucas"])
