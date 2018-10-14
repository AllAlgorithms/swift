import Foundation

public class Node{
	public var label: String
	public var neighbors: Array<Edge>
	public var color: String?
	public var predecessor: Node?
	public var distance: Int?
	
	public init(_ label: String){
		self.label = label
		self.neighbors = Array<Edge>()
	}
}
