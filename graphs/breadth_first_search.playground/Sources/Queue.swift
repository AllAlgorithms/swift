import Foundation

public struct Queue<T> {
	var items: [T] = []
	
	public init(){}
	
	public mutating func enqueue(element: T){
		items.append(element)
	}
	
	public mutating func dequeue() -> T? {
		if items.isEmpty {
			return nil
		} else{
			return items.remove(at: 0)
		}
	}
	
	public var isEmpty: Bool {
		return items.isEmpty
	}
}
