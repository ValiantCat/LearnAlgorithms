//: [Previous](@previous)

import Foundation

enum QueueState:ErrorType {
    case isEmpty
    case isFull
}
struct PriorityQuene {
    private let MaxSize:Int
    private var queArray:[Double]
    
    private var nItems:Int// 当前元素数
    init(size:Int){
        MaxSize = size
        queArray = Array<Double>(count: size,repeatedValue: 0.0)
        
        nItems = 0
    }//     优先级队列在插入时为了要寻找合适的位置需要移动数组元素 O（N）
    mutating func enque(element:Double) throws {
        if isFull {
            throw QueueState.isFull
        }
        if isEmpty   { // 队列为空时
            queArray[nItems] = element
        }else {
            var index = nItems - 1
            while  index >= 0 {
                if element > queArray[index]{ // 队列往上复制
                    queArray[index+1] = queArray[index]
                }else {
                    

                    break;
                }
                
                index -= 1
            }
            queArray[index+1 ] = element
            
            
        }
        
        
        
        nItems += 1
    }
    
    mutating func deque() throws -> Double {
        if isEmpty {
            throw QueueState.isEmpty
        }
        nItems -= 1
        return queArray[nItems]
    }
    
    func peek() -> Double {
        return queArray[nItems-1]
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

var quene = PriorityQuene(size: 5)

try! quene.enque(30)
try! quene.enque(50)
try! quene.enque(10)
try! quene.enque(40)
try! quene.enque(20)

quene
//: [Next](@next)
