//: [Previous](@previous)

import Foundation

//和求后缀表达式不同的是，求值过程中，遇到操作数是入栈，操作符是计算2个操作数的值然后再入栈
extension Character {
    func toInt() -> Int {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter - 48
    }
}

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
//precedence 优先级的意思 加减 1， 乘除2
struct InToPost {
    private var theStack:Stack<Character>
    private var input:String
    private var result = ""
    init( ins:String){
        input = ins
        theStack = Stack(size: input.characters.count,t:"A")
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
struct ParsePost { // 后缀表达式求值
    private var theStack = Stack<Int>(size: 30,t:0)// 足够使用了
    private var input:String
    init(ins:String) {
        input = ins
        
    }
    mutating func doParse() -> Int {
        var result = 0;
        for i in 0..<input.characters.count {
            
            let character = input[input.startIndex.advancedBy(i)]
            theStack.displayStack("  \(character)")
            if  character >= "0" && character <= "9" { //如果是数字进栈
                
                theStack.push(character.toInt())
            }else {
                let num2 = theStack.pop() // 操作符2
                let num1 = theStack.pop() // 操作符1
                switch character {
                case "+":
                    result = num1 + num2
                case "-":
                    result = num1 - num2
                case "*":
                    result = num1 * num2
                case "/":
                    result = num1 / num2
                default:
                    result = 0
                }
                
                theStack.push(result)
            }
            
        }
//        最终只有一个结果数入栈
        
        return theStack.pop()    }
    
}

var theTrans = InToPost(ins: "2*(3+4)");
var parser = ParsePost(ins: theTrans.doTrans())
parser.doParse()



//: [Next](@next)
