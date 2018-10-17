// Queue (FIFO)
//
// https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)


public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
}

var fifo = Queue(array: ["1", "2", "3"])

fifo.enqueue("4")

print(fifo.array)

fifo.dequeue()

print(fifo.array)
