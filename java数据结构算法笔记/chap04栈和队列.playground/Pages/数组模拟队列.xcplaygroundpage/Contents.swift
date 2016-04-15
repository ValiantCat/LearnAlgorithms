//: Playground - noun: a place where people can play

import UIKit
enum QueueState:ErrorType {
    case isEmpty
    case isFull
}
struct Quene {
    private let MaxSize:Int
    private var queArray:[Double]
    private var front:Int
    private var rear:Int
    private var nItems:Int// 当前元素数
    init(size:Int){
        MaxSize = size
        queArray = Array<Double>(count: size,repeatedValue: 0.0)
        front = 0
        rear = -1
        nItems = 0
    }
    mutating func enque(element:Double) throws {
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
    mutating func deque() throws -> Double {
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
    
    func peek() -> Double {
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

var quene = Quene(size: 5)

try! quene.enque(10)
try! quene.enque(20)
try! quene.enque(30)
try! quene.enque(40)

try! quene.deque()
try! quene.deque()
try! quene.deque()

try! quene.enque(50)
try! quene.enque(60)
try! quene.enque(70)
try! quene.enque(80)

quene







