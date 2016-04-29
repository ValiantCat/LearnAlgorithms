//: [Previous](@previous)

import Foundation

class Tree {
    var key: Int
    var leftTree: Tree?
    var rightTree: Tree?
    
    init(key: Int) {
        self.key = key
    }
}

func invertNonRecursive(root: Tree) {
    var nodes = [Tree]()
    nodes.append(root)
    while !nodes.isEmpty {
        if let node = nodes.first {
            nodes.removeFirst()
            let tempLeftTree = node.leftTree
            node.leftTree = node.rightTree
            node.rightTree = tempLeftTree
            
            if let leftT = node.leftTree {
                nodes.append(leftT)
            }
            if let rightT = node.rightTree {
                nodes.append(rightT)
            }
        }
    }
}
func invertBinaryTreeWithRecursive(root: Tree) {
    let tempTree = root.leftTree
    root.leftTree = root.rightTree
    root.rightTree = tempTree
    if let leftTree = root.leftTree {
        invertBinaryTreeWithRecursive(leftTree)
    }
    if let rightTree = root.rightTree {
        invertBinaryTreeWithRecursive(rightTree)
    }
}
//: [Next](@next)
