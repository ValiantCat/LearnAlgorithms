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
//precedence 优先级的意思 加减 1， 乘除2
struct InToPost {
    private var theStack:Stack
    private var input:String
    private var result = ""
    init( ins:String){
        input = ins
        theStack = Stack(size: input.characters.count)
    }
    mutating func doTrans() ->String {
        
        for i in 0..<input.characters.count {
            let character  = input[input.startIndex.advancedBy(i)]
            theStack.displayStack("For \(character)   ")
            switch character {
            case "+":
                fallthrough
            case "-":
                gotOperator(character, prec1: 1)
            case "*":
                fallthrough
            case "/":
                gotOperator(character, prec1: 2)
            case "(":
                theStack.push(character)
            case ")":
                gotParen()
                
                
            default:
                result  += "\(character)"
            }
        }
        while !theStack.isEmpty {
            theStack.displayStack("While ")
            result += "\(theStack.pop())"
        }
        theStack.displayStack("End  ")
        
        
        return result
    }
    //    读到右小括号
    mutating func gotParen() {
        while !theStack.isEmpty {
            let character  = theStack.pop()
            if character == "("{
                break
            }else {
                result += "\(character)"
            }
        }
    }
    //     读到操作符
    mutating func gotOperator(operatorThis:Character,prec1:Int) {
        while !theStack.isEmpty {
            let operatorTop = theStack.pop()
            if operatorTop == "(" {
                theStack.push(operatorTop)
                break;
            }else {
                var  prec2 = 0;
                //                 确定优先级
                if operatorTop == "+" || operatorTop == "-" {
                    prec2 = 1
                }else {
                    prec2 = 2
                }
                
                if prec2 < prec1 {
                    theStack.push(operatorTop)
                    break
                }else {
                    result += "\(operatorTop)"
                }
            }
        }
        
        theStack.push(operatorThis)
    }
}


var theTrans = InToPost(ins: "A*(B+C)");
theTrans.doTrans()
//: [Next](@next)
