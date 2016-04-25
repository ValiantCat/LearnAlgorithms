//: [Previous](@previous)

import Foundation


enum QueueState:ErrorType {
    case isEmpty
    case isFull
}
struct Quene {
    private let MaxSize:Int
    private var queArray:[Int]
    private var front:Int
    private var rear:Int
    private var nItems:Int// 当前元素数
    init(size:Int){
        MaxSize = size
        queArray = Array<Int>(count: size,repeatedValue: 0)
        front = 0
        rear = -1
        nItems = 0
    }
    mutating func enque(element:Int) throws {
        if isFull {
            throw QueueState.isFull
        }
        if rear == MaxSize - 1  { // 如果队列开始出现环形
            rear = -1
            
        }
        rear += 1
        queArray[rear] = element
        nItems += 1
    }
    mutating func deque() throws -> Int {
        if isEmpty {
            throw QueueState.isEmpty
        }
        let result = queArray[front]
        front += 1
        if front == MaxSize {
            front = 0
        }
        
        nItems -= 1
        return result
    }
    
    func peek() -> Int {
        return queArray[front]
    }
    var isEmpty:Bool {
        return nItems == 0
    }
    var isFull:Bool {
        return nItems == MaxSize
    }
    
    var size:Int {
        return nItems
    }
    
    
}


struct Vertex {
    private(set) var label:String
    private var wasVisited = false
    mutating func toggleWasVistied(){
        wasVisited = !wasVisited
    }
}
struct Graph {
    private let MAX_VERTS = 20
    private var vertexList:[Vertex?]
    private var adjMat:[[Int]]
    private var nVerts:Int = 0
    private var theQueue = Quene(size: 20)
    init(){
        vertexList = Array<Vertex?>(count: MAX_VERTS,repeatedValue:nil)
        
        adjMat = Array<Array<Int>>(count: MAX_VERTS,repeatedValue: Array<Int>(count:MAX_VERTS,repeatedValue: 0))
    }
    mutating func addVertex(label:String) {
        vertexList[nVerts] = Vertex(label: label, wasVisited: false)
        nVerts += 1
    }
    mutating func addEdge(start:Int,end:Int) {
        adjMat[start][end] = 1
        adjMat[end][start] = 1
        
    }
    
    func displayVertex(v:Int){
        print(vertexList[v]?.label ?? "" ,terminator:" ")
    }
    //MARK: 广度优先遍历
    mutating func bfs() {
        vertexList[0]?.wasVisited = true
        displayVertex(0)
        try! theQueue.enque(0)
        var v2 = -1
        while !theQueue.isEmpty {
            let v1 = try! theQueue.deque()
            v2 = getAdjUnvisitedVertex(v1)
            while v2  != -1 {
                vertexList[v2]?.wasVisited = true
                displayVertex(v2)
                try! theQueue.enque(v2)
                v2 = getAdjUnvisitedVertex(v1)
            }
        }
        
        for ver in vertexList {
            var v = ver
            v?.wasVisited = false
        }
        
    }
    func getAdjUnvisitedVertex(v:Int) -> Int {
        for i in 0..<nVerts {
            
            if adjMat[v][i] == 1 && vertexList[i]?.wasVisited == false  {
                
                return i
            }
            
        }
        return -1
    }
    
    
}
var graph = Graph()
graph.addVertex("A") // 0
graph.addVertex("B")
graph.addVertex("C")
graph.addVertex("D")
graph.addVertex("E") // 5

graph.addEdge(0, end: 1) // AB
graph.addEdge(1, end: 2) // BC
graph.addEdge(0, end: 3) // AD
graph.addEdge(3, end: 4)//DE

graph.bfs()

//: [Next](@next)
