import Foundation

public class Edge {
	public var neighbor: Node
	public var weight: Int?
	
	public init(_ neighbor: Node){
		self.neighbor = neighbor
	}
}
