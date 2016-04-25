//: Playground - noun: a place where people can play

import UIKit



struct  Stack<T> {
    private let maxSize:Int
    private var  stackArray:[T];
    private var  top:Int;
    //--------------------------------------------------------------
    init(size:Int,t:T) {// constructor
        maxSize = size
        stackArray = Array<T>(count: size ,repeatedValue: t)
        top = -1
    }
    
    //--------------------------------------------------------------
    mutating func push(character:T) { // put item on top of stack
        stackArray[top+1] = character
        top += 1
    }
    //--------------------------------------------------------------
    mutating func pop() -> T {
        let result = stackArray[top]    // take item from top of stack
        top -= 1;
        return result
        
    }
    
    //--------------------------------------------------------------
    func peek() -> T {
        return stackArray[top]        // peek at top of stack
    }
    
    
    //--------------------------------------------------------------
    
    var isEmpty:Bool {  // true if stack is empty
        return top == -1
    }
    
    //-------------------------------------------------------------
    var size:Int {        // return size
        return top + 1
    }
    //--------------------------------------------------------------
    func peek( n:Int) -> T {  // return item at index n
        return stackArray[n]
    }
    //--------------------------------------------------------------
    func displayStack(s:String){
        print(s)
        print("Stack (bottom-->top): ")
        print("\n")
        for i in 0..<size {
            print(peek(i))
            print("  ")
        }
        print("\n")
    }
    
    //--------------------------------------------------------------
}  // end class StackX



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
    private var theStack = Stack<Int>(size:20,t:-1)
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
    //MARK: 深度优先遍历
    mutating func dfs() {
        vertexList[0]?.wasVisited = true
        displayVertex(0)
        theStack.push(0)
        while !theStack.isEmpty {
            let v = getAdjUnvisitedVertex(theStack.peek())
            if v == -1 {
                theStack.pop()
            }else {
                vertexList[v]?.wasVisited = true
                displayVertex(v)
                theStack.push(v)
            }
        }
        
        for ver in vertexList {
            var v = ver
            v?.wasVisited = false
        }
        
    }
    func getAdjUnvisitedVertex(v:Int) -> Int {
        for i in 0..<nVerts {
            
            if adjMat[v][i] == 1 && vertexList[i]!.wasVisited == false  {
                
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

graph.dfs()
