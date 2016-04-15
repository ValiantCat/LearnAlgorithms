//: [Previous](@previous)

import Foundation
struct  Stack {
    private let maxSize:Int
    private var  stackArray:[Character];
    private var  top:Int;
    //--------------------------------------------------------------
    init(size:Int) {// constructor
        maxSize = size
        stackArray = Array<Character>(count: size ,repeatedValue: "A")
        top = -1
    }
    
    //--------------------------------------------------------------
    mutating func push(character:Character) { // put item on top of stack
        stackArray[top+1] = character
        top += 1
    }
    //--------------------------------------------------------------
    mutating func pop() -> Character {
        let result = stackArray[top]    // take item from top of stack
        top -= 1;
        return result
        
    }
    
    //--------------------------------------------------------------
    func peek() -> Character {
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
    func peek( n:Int) -> Character {  // return item at index n
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
//: [Next](@next)
