//: Playground - noun: a place where people can play

import UIKit
struct DataItem {
    private var data:Int
    func displayItem(){
        print("\\\(data)",terminator:" ")
    }
}
class Node {
    static var NotFound = -1
    
    private static var Order = 4
    private(set) var numItems:Int = 0
    private var parient:Node?
    private var childArray:[Node?] = (0..<Node.Order).map({_ in return nil })
    private var itemArray:[DataItem?] = (0..<Node.Order-1).map{_ in return nil }
    func connectChild(childNum:Int,child:Node?){
        childArray[childNum] = child
        if child != nil {
            child?.parient = self
        }
    }
    func disConnectedChild(childNum:Int) -> Node? {
        let tempNode = childArray[childNum]
        childArray[childNum] = nil
        return tempNode
    }
    func getChild(childNum:Int) ->Node? {
        return childArray[childNum]
    }
    func getParient() -> Node? {
        return parient
    }
    
    var isLeaf:Bool {
        return childArray[0] == nil
    }
    func getItem(index:Int) -> DataItem? {
        return itemArray[index]
    }
    var isFull:Bool {
        return numItems == Node.Order - 1
    }
    func findItem(key:Int) -> Int { //indexOF
        for i in 0..<Node.Order-1 {
            if itemArray[i] == nil {
                break
            }else if itemArray[i]?.data == key {
                return i
            }
        }
        return Node.NotFound
    }
    
    func insertItem(newItem:DataItem) -> Int {
        numItems += 1
        let newKey = newItem.data
        for i in (0..<Node.Order-2).reverse() {
            if itemArray[i] == nil {
                continue
            }else {
                let itsKey = itemArray[i]!.data
                if newKey < itsKey {
                    itemArray[i + 1] = itemArray[i]
                }else {
                    itemArray[i + 1] = newItem
                    return i + 1
                }
                
                
            }
            
        }
        itemArray[0] = newItem
        return 0
    }
    func removeItem() -> DataItem? { // 删除最大的
        let temp = itemArray[numItems-1]
        itemArray[numItems-1] = nil
        numItems -= 1
        return temp
    }
    
    func displayNode() {
        itemArray.forEach({$0?.displayItem()}) //
        print("/")  // final
    }
    
}

class Tree234 {
    private var root = Node()
    func find(Key:Int) -> Int {
        var curNode = root
        var childNumer = -1
        while true {
            childNumer = curNode.findItem(Key)
            if childNumer != -1 {
                return childNumer
            }else if curNode.isLeaf {
                return -1
            }else {
                curNode = getNextChild(curNode, theValue: Key)
            }
            
        }
    }
    func insert(dValue:Int) {
        var curNode = root
        let temp = DataItem(data: dValue)
        while true {
            if curNode.isFull {
                split(curNode)
                curNode = curNode.getParient()!
                curNode = getNextChild(curNode, theValue: dValue)
            }else if curNode.isLeaf {
                break
            }else {
                curNode = getNextChild(curNode, theValue: dValue)
            }
        }
        curNode.insertItem(temp)
    }
    func getNextChild(theNode:Node,theValue:Int) -> Node {
        var index = 0
        let numItems = theNode.numItems
        for i in 0..<numItems {
            index = i
            if theValue < theNode.getItem(i)?.data {
                return theNode.getChild(i)!
                
            }
        }
        return theNode.getChild(index)!
    }
    func split(thisNode:Node){
        let ietmC = thisNode.removeItem()
        let itemB = thisNode.removeItem()
        let child2  = thisNode.disConnectedChild(2)
        let child3  = thisNode.disConnectedChild(3)
        let newRight = Node()
        var parient:Node?
        if thisNode === root {
            root = Node()
            parient = root
            root.connectChild(0, child: thisNode)
        }else {
            parient = thisNode.parient
        }
        let itemIndex = parient!.insertItem(itemB!)
        let n = parient!.numItems
        for i in (itemIndex..<n-1).reverse() {
            let temp = parient?.disConnectedChild(i)
            parient?.connectChild(i+1, child: temp)
        }
        
        parient?.connectChild(itemIndex+1, child: newRight)
        newRight.insertItem(ietmC!)
        newRight.connectChild(0, child: child2)
        newRight.connectChild(1, child: child3)
        
        
    }
    func disPlayTree() {
        recDisPlayTree(root, childNums: 0)
    }
    private static var  level = 0
    private func recDisPlayTree(thisNode:Node,childNums:Int) {
        
        print("level = \(Tree234.level)  child = \(childNums)  ",terminator:" ")
        thisNode.displayNode()
        let numItems = thisNode.numItems
        for i in 0...numItems {
            let nextNode = thisNode.getChild(i)
            
            if nextNode != nil {
                recDisPlayTree(nextNode!,  childNums: i)
            }else {
                Tree234.level += 1
                return
            }
        }
    }
    
}



let theTree = Tree234()
theTree.insert(50)
theTree.insert(40)
theTree.insert(60)
//theTree.disPlayTree()
theTree.insert(30)
theTree.insert(70)
theTree.disPlayTree()

