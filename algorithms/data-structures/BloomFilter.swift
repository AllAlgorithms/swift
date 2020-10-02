public struct BloomFilter<Element> {
    
    private var array: [Bool] = []
    private var functions: [(Element) -> Int]
    
    init(size: UInt = 1000, hashFunctions: [(Element) -> Int]) {
        self.functions = hashFunctions
        self.array = [Bool](repeating: false, count: Int(size))
    }
    
    mutating public func insert(_ element: Element) {
        for function in functions {
            array[abs(function(element) % array.count)] = true
        }
    }
    
    mutating public func insert(_ elements: [Element]) {
        elements.forEach{ insert($0) }
    }
    
    public func contains(_ element: Element) -> Bool {
        return functions.reduce(false, { (result, function) -> Bool in
            return result || array[abs(function(element) % array.count)]
        })
    }
}
