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
graph.addEdge(from: graph.nodes[1], to: graph.nodes[5])
graph.addEdge(from: graph.nodes[2], to: graph.nodes[5])
