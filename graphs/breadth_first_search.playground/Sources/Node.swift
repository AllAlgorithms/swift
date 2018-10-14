import Foundation

public class Node{
	public var label: String
	public var neighbors: Array<Edge>
	
	public init(_ label: String){
		self.label = label
		self.neighbors = Array<Edge>()
	}
}
