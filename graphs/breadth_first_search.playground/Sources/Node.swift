import Foundation

public class Node: Equatable{
	public var label: String
	public var neighbors: Array<Edge>
	public var color: String?
	public var predecessor: Node?
	public var distance: Int?
	
	public init(_ label: String){
		self.label = label
		self.neighbors = Array<Edge>()
	}
	
	public static func == (lhs: Node, rhs: Node) -> Bool{
		return lhs.label == rhs.label
	}
}
