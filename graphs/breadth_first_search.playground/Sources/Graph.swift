import Foundation

public class Graph{
	public var nodes: Array<Node>
	
	public init(){
		self.nodes = Array<Node>()
	}
	
	public func addNode(_ label: String){
		let newNode = Node(label)
		nodes.append(newNode)
	}
	
	public func addEdge(from source: Node, to destination: Node){
		let newEdge = Edge(destination)
		source.neighbors.append(newEdge)
		destination.neighbors.append(Edge(source))
	}
}
