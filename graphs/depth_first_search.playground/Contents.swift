/*
DFS function records when it discovers node in the discoveredTimestamp attribute
and when it finishes node in the finisihedTimestamp attribute
*/
func depthFirstSearch(graph: Graph){
	// set all nodes to init state
	for node in graph.nodes{
		node.color = "White"
		node.predecessor = nil
	}
	
	var timestamp = 0
	
	// check each undiscovered node in graph, and visit each found node
	for node in graph.nodes{
		if node.color == "White"{
			dfsVisit(node: node, timestamp: &timestamp)
		}
	}
}

func dfsVisit(node: Node, timestamp: inout Int){
	// discover provided node by setting discoveredTimestamp and color
	timestamp = timestamp + 1
	node.discoveredTimestamp = timestamp
	node.color = "Gray"
	
	// check each adjacent node and recursively visit it if it's white
	for edge in node.neighbors{
		if edge.neighbor.color == "White"{
			edge.neighbor.predecessor = node
			dfsVisit(node: edge.neighbor, timestamp: &timestamp)
		}
	}
	
	// after each edge was explored, paint node black and record finishedTimestamp
	node.color = "Black"
	timestamp = timestamp + 1
	node.finishedTimestamp = timestamp
}


func describeNodes(graph: Graph){
	for node in graph.nodes{
		print("| Node " + node.label + " |")
		
		if let parent = node.predecessor{
			print("Predecessor: " + parent.label)
		}
		
		print("Discovered timestamp: " + String(node.discoveredTimestamp!))
		print("Finished timestamp: " + String(node.finishedTimestamp!))
		print("\n\n")
	}
}

// create sample graph
var graph = Graph()

graph.addNode("A")
graph.addNode("B")
graph.addNode("C")
graph.addNode("D")
graph.addNode("E")
graph.addNode("F")

graph.addEdge(from: graph.nodes[0], to: graph.nodes[1])
graph.addEdge(from: graph.nodes[0], to: graph.nodes[2])
graph.addEdge(from: graph.nodes[0], to: graph.nodes[3])
graph.addEdge(from: graph.nodes[1], to: graph.nodes[4])
graph.addEdge(from: graph.nodes[2], to: graph.nodes[5])

depthFirstSearch(graph: graph)
describeNodes(graph: graph)
