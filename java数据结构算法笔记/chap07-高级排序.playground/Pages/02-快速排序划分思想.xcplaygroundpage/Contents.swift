//: [Previous](@previous)

import Foundation

func randomInRange(_ range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return  Int(arc4random_uniform(count)) + range.lowerBound
}

struct ArraySh{
    fileprivate var theArray:[Int]
    fileprivate(set) var nElements:Int
    init(max:Int) {
        theArray = Array<Int>(repeating: 0,count: max)
        nElements = 0
    }
    mutating func insert(_ value:Int) {
        theArray[nElements] = value
        nElements += 1
    }
    func display() {
        print("A=",terminator:" ")
        for i in 0..<nElements {
            print("\(theArray[i])",terminator:" ")
        }
        print("")
    }
    
    //    【1 ， 2 ， 4，3，6，8，1，2，4】
    //    |                             |
    //leftPointer->                <-rightPointer privot
    //    算法效率为O(N)
    mutating func partitionit(_ left:Int,right:Int,privot:Int) -> Int {
        var leftPointer = left - 1
        var rightPointer = right + 1
        while true {
            repeat {
                leftPointer += 1
            }    // 遇见左侧大于 枢纽的停下来， 这样每次都能找到一个待交换的左侧的
                while leftPointer < rightPointer && theArray[leftPointer] < privot
            
            
            repeat {
                rightPointer -= 1
                // 遇见右侧小于 枢纽的停下来， 这样每次都能找到一个待交换的右侧的
            }
                
                while rightPointer > leftPointer && theArray[rightPointer] > privot
            if leftPointer >= rightPointer {
                break
            }else {
                swap(leftPointer, index2: rightPointer)
            }
        }
        
        
        return leftPointer
        
    }
    mutating func swap(_ index1:Int,index2:Int) {
        let temp = theArray[index1]
        theArray[index1] = theArray[index2]
        theArray[index2] = temp
        
    }
    
}


var theArray = ArraySh(max: 10)
for i in 0..<10 {
    theArray.insert(randomInRange(Range<Int>(0...999)))
}
theArray.display()
print(theArray.partitionit(0, right: theArray.nElements-1, privot: 200))
theArray.display()
