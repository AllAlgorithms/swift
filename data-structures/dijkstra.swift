
struct Constants {
    static let numVertices:Int = 9
}

func minimumDistance(_ distances: [Int], _ shortestPathSet: [Bool]) -> Int {
    var minimum = Int.max
    var minimumIndex = -1
    for vertex in 0..<Constants.numVertices {
        if !shortestPathSet[vertex] && distances[vertex] <= minimum {
            minimum = distances[vertex]
            minimumIndex = vertex
            
        }
    }
    return minimumIndex
}

func dijkstra(graph: [[Int]], source: Int) {
    var distances: [Int] = Array(repeating: Int.max, count: Constants.numVertices)
    
    var shortestPathSet: [Bool] = Array(repeating: false, count: Constants.numVertices)
    
    distances[source] = 0
    for _ in 0..<Constants.numVertices-1 {
        let u = minimumDistance(distances, shortestPathSet)
        
        shortestPathSet[u] = true
        for vertex in 0..<Constants.numVertices {
            if !shortestPathSet[vertex] && graph[u][vertex] != 0 && distances[u] != Int.max && distances[u] + graph[u][vertex] < distances[vertex] {
                distances[vertex] = distances[u] + graph[u][vertex]
            }
        }
    }
    
    print("Vertex    Distance from Source")
    for i in 0..<Constants.numVertices {
        print("\(i)         \(distances[i])")
    }
}


dijkstra(graph: [[0, 4, 0, 0, 0, 0, 0, 8, 0],
    [4, 0, 8, 0, 0, 0, 0, 11, 0],
    [0, 8, 0, 7, 0, 4, 0, 0, 2],
    [0, 0, 7, 0, 9, 14, 0, 0, 0],
    [0, 0, 0, 9, 0, 10, 0, 0, 0],
    [0, 0, 4, 14, 10, 0, 2, 0, 0],
    [0, 0, 0, 0, 0, 2, 0, 1, 6],
    [8, 11, 0, 0, 0, 0, 1, 0, 7],
    [0, 0, 2, 0, 0, 0, 6, 7, 0]], source: 0)

//Referenced from https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/
