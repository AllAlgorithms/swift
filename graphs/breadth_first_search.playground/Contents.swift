func breadthFirstSearch(graph: Graph, source: Node){
	var visitedNodes = Queue<Node>()
	
	// set all nodes to init state
	for node in graph.nodes{
		node.color = "White"
		node.distance = nil
		node.predecessor = nil
	}
	
	// discover source node
	source.color = "Gray"
	source.distance = 0
	source.predecessor = nil
	
	// add source node to visitedNodes queue
	visitedNodes.enqueue(element: source)
	
	// go through each node until all nodes were visited
	while !visitedNodes.isEmpty{
		if let currentNode = visitedNodes.dequeue(){
			// go into each neighbor node and update color, distance and predecessor
			for edge in currentNode.neighbors {
				if edge.neighbor.color == "White" {
					edge.neighbor.color = "Gray"
					edge.neighbor.distance = currentNode.distance! + 1
					edge.neighbor.predecessor = currentNode
					visitedNodes.enqueue(element: edge.neighbor)
				}
			}
			
			// set node as visited by setting black color
			currentNode.color = "Black"
		}
	}
}

func describeNode(graph: Graph, sourceNode: Node){
	for node in graph.nodes{
		print("| Node " + node.label + " |")
		
		if(node == sourceNode){
			print("Source node")
		}
		
		if let parent = node.predecessor{
			print("Predecessor: " + parent.label)
			print("Distance to source node " + sourceNode.label + ": " + String(node.distance!))
		}
		print("\n\n")
	}
}

// create sample graph and do Breadth-first search
var graph = Graph()

graph.addNode("A")
graph.addNode("B")
graph.addNode("C")
graph.addNode("D")
graph.addNode("E")
graph.addNode("F")

graph.addEdge(from: graph.nodes[0], to: graph.nodes[1])
graph.addEdge(from: graph.nodes[0], to: graph.nodes[2])
graph.addEdge(from: graph.nodes[1], to: graph.nodes[3])
graph.addEdge(from: graph.nodes[1], to: graph.nodes[4])
graph.addEdge(from: graph.nodes[2], to: graph.nodes[4])
graph.addEdge(from: graph.nodes[3], to: graph.nodes[5])

breadthFirstSearch(graph: graph, source: graph.nodes[0])

describeNode(graph: graph, sourceNode: graph.nodes[0])
