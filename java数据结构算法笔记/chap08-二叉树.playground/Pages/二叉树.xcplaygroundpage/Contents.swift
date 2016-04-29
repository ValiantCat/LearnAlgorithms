//: Playground - noun: a place where people can play

import UIKit

//二叉树的效率是 O(log2(N+1))
// O(logN) 除了遍历比较慢


//MARK: - help Class Stack
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

class Node {
    
    private var data:Int
    private var leftChild:Node?
    private var rightChild:Node?
    init(aData:Int){
        data = aData;
    }
    func disPlayLink() {
        print("{ data is \(data)}")
    }
}
enum Traverse {
    case PreOrder // 前序
    case InOrder // 中序
    case PostOrder // 后续
}
//MARK: - tree
class Tree {
    private var root:Node?
    //MARK: - 查找节点
    func find(key:Int) -> Node? {
        var current = root
        while current?.data != key {
            if key < current?.data  { // 往左子树偏移
                current = current?.leftChild
            }else {
                current = current?.rightChild
            }
            if current == nil {
                return nil
            }
        }
        return current
    }
    // 插入新节点
    func insert(key:Int) {
        let newNode = Node(aData: key)
        if root == nil { // 树为空
            root = newNode
            return
        }
        
        
        //     插入操作
        var current = root
        var parent:Node?
        while true {
            parent = current
            if key < current?.data { // 去左边
                current = current?.leftChild
                if  current == nil  {
                    parent?.leftChild = newNode
                    return
                }
            }else { // 右边
                current = current?.rightChild
                if  current == nil {
                    parent?.rightChild = newNode
                    return
                }
            }
            
        }
        
        
        // end
    }
    //MARK:  遍历树
    func traverseTree(tra:Traverse) {
        switch tra {
        case .PreOrder:
            preOrder(root)
        case .InOrder:
            inOrder(root)
        case .PostOrder:
            postOrder(root)
        }
        
    }
    func preOrder(localRoot:Node?) {
        if localRoot != nil {
            print("(前序遍历中:当前数据为 \(localRoot!.data))")
            preOrder(localRoot?.leftChild)
            preOrder(localRoot?.rightChild)
        }
    }
    func inOrder(localRoot:Node?) {
        if localRoot != nil {
            
            inOrder(localRoot?.leftChild)
            print("(中序遍历中: 当前数据为 \(localRoot!.data))")
            inOrder(localRoot?.rightChild)
        }
        
    }
    func postOrder(localRoot:Node?) {
        if localRoot != nil {
            
            postOrder(localRoot?.leftChild)
            postOrder(localRoot?.rightChild)
            print("(后序遍历中:当前数据为 \(localRoot!.data))")
        }
        
    }
    //MARK: 打印树
    func displayTree() {
        var globalStack = Stack<Node?>(size: 100,t: nil)
        globalStack.push(root)
        var  nBlanks = 32
        var isRowEmpty = false
        print("...........................................................................................")
        while isRowEmpty == false {
            var localStack = Stack<Node?>(size: 100,t: nil)
            isRowEmpty = true
            (0..<nBlanks).forEach{ _ in print(" ",terminator:"")}
            while globalStack.isEmpty == false {
                let temp = globalStack.pop()
                if temp != nil {
                    print("\(temp!.data)",terminator:"")
                    localStack.push(temp?.leftChild)
                    localStack.push(temp?.rightChild)
                    if temp?.leftChild != nil || temp?.rightChild != nil {
                        isRowEmpty = false
                    }
                } else {
                    print("--",terminator:"")
                    localStack.push(nil)
                    localStack.push(nil)
                }
                (0..<(nBlanks*2-2)).forEach{_ in print(" ",terminator:"")}
            }
            print("")
            nBlanks /= 2
            while localStack.isEmpty == false {
                globalStack.push(localStack.pop())
            }
            print("...........................................................................................")
            
        }
        
    }
    
    
    
    // MARK: - 求删除节点的后继
    private func getSuccessor(delNode:Node?) -> Node?{
        var  successorParent = delNode
        var  successor = delNode
        var  current = delNode?.rightChild   // go to right child
        while(current != nil)               // until no more
        {                                 // left children,
            successorParent = successor
            successor = current
            current = current?.leftChild      // go to left child
        }
        // if successor not
        if(successor !== delNode?.rightChild)  // right child,
        {                                 // make connections
            successorParent?.leftChild = successor?.rightChild
            successor?.rightChild = delNode?.rightChild
        }
        return successor
        
    }
    func delete(key:Int) -> Bool {
        var current = root
        var parient = root
        var isLeftChild = true
        // MARK: - find
        while current?.data != key {
            parient = current
            if key < current?.data {
                isLeftChild = true
                current = current?.leftChild
            }else {
                isLeftChild = false
                current = current?.rightChild
            }
            if current == nil {
                return false
            }
        }
        
        // 被删除的是叶子节点
        if current?.leftChild == nil && current?.rightChild == nil  {
            if current === root  {
                root = nil
            }else if isLeftChild {
                parient?.leftChild = nil
            }else {
                parient?.rightChild = nil
            }
            
        }
        else if current?.rightChild == nil { // 被删除的节点只有一个子节点
            
            if current === root {
                root = current?.leftChild
            }else if isLeftChild {
                parient?.leftChild = current?.leftChild
                
            }else {
                parient?.rightChild = current?.rightChild
            }
            
        }
            
        else if current?.leftChild == nil {
            if current === root {
                root = current?.rightChild
            }else if isLeftChild {
                parient?.leftChild = current?.rightChild
            }else {
                parient?.rightChild = current?.leftChild
            }
            
            
        }
        else{ // 被删除的节点又2个孩子
            let successor = getSuccessor(current) //先求后继
            if current === root {
                root = successor
            }else if isLeftChild{
                parient?.leftChild = successor
            }else {
                parient?.rightChild = successor
            }
            successor?.leftChild = current?.leftChild
            
        }
        
        
        return false
    }
    
    
    
    
    
}




var theTree = Tree()
theTree.insert(50)
theTree.insert(25)
theTree.insert(75)
theTree.insert(12)
theTree.insert(37)
theTree.insert(43)
theTree.insert(30)
theTree.insert(33)
theTree.insert(87)
theTree.insert(93)
theTree.insert(97)
theTree.displayTree()
print("delete key  25 ")
theTree.delete(25)
theTree.displayTree()


