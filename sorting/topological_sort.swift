/// Topological sort is an algorithm that orders a directed graph such that for each directed edge u→v, vertex u comes before vertex v.
///
/// In other words, a topological sort places the vertices of a directed acyclic graph on a line so that all directed edges go from left to right.

/// How does it work?

/// Step 1: Find all vertices that have in-degree of 0

/// Step 1: Find all vertices that have in-degree of 0

/// The in-degree of a vertex is the number of edges pointing at that vertex. Vertices with no incoming edges have an in-degree of 0. These vertices are the starting points for the topological sort.

/// In the context of the previous example, these starting vertices represent algorithms and data structures that don't have any prerequisites; you don't need to learn anything else first, hence the sort starts with them.

/// Step 2: Traverse the graph with depth-first search

/// Depth-first search is an algorithm that starts traversing the graph from a certain vertex and explores as far as possible along each branch before backtracking. To find out more about depth-first search, please take a look at the detailed explanation.

/// We perform a depth-first search on each vertex with in-degree 0. This tells us which vertices are connected to each of these starting vertices.

/// Step 3: Remember all visited vertices

/// As we perform the depth-first search, we maintain a list of all the vertices that have been visited. This is to avoid visiting the same vertex twice.

/// Step 4: Put it all together

/// The last step of the sort is to combine the results of the different depth-first searches and put the vertices in a sorted list.

public class Graph: CustomStringConvertible {
  public typealias Node = String

  private(set) public var adjacencyLists: [Node : [Node]]

  public init() {
    adjacencyLists = [Node: [Node]]()
  }

  public func addNode(_ value: Node) -> Node {
    adjacencyLists[value] = []
    return value
  }

  public func addEdge(fromNode from: Node, toNode to: Node) -> Bool {
    adjacencyLists[from]?.append(to)
    return adjacencyLists[from] != nil ? true : false
  }

  public var description: String {
    return adjacencyLists.description
  }

  public func adjacencyList(forNode node: Node) -> [Node]? {
    for (key, adjacencyList) in adjacencyLists {
      if key == node {
        return adjacencyList
      }
    }
    return nil
  }
}

extension Graph {
  typealias InDegree = Int

  func calculateInDegreeOfNodes() -> [Node : InDegree] {
    var inDegrees = [Node: InDegree]()

    for (node, _) in adjacencyLists {
      inDegrees[node] = 0
    }

    for (_, adjacencyList) in adjacencyLists {
      for nodeInList in adjacencyList {
        inDegrees[nodeInList] = (inDegrees[nodeInList] ?? 0) + 1
      }
    }
    return inDegrees
  }
}

extension Graph {
  private func depthFirstSearch(_ source: Node, visited: inout [Node : Bool]) -> [Node] {
    var result = [Node]()

    if let adjacencyList = adjacencyList(forNode: source) {
      for nodeInAdjacencyList in adjacencyList {
        if let seen = visited[nodeInAdjacencyList], !seen {
          result = depthFirstSearch(nodeInAdjacencyList, visited: &visited) + result
        }
      }
    }

    visited[source] = true
    return [source] + result
  }

  /* Topological sort using depth-first search. */
  public func topologicalSort() -> [Node] {

    let startNodes = calculateInDegreeOfNodes().filter({ _, indegree in
      return indegree == 0
    }).map({ node, _ in
      return node
    })

    var visited = [Node: Bool]()
    for (node, _) in adjacencyLists {
      visited[node] = false
    }

    var result = [Node]()
    for startNode in startNodes {
      result = depthFirstSearch(startNode, visited: &visited) + result
    }

    return result
  }
}
