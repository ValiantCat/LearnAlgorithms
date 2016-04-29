//: [Previous](@previous)

import Foundation

//: *使用数组最右端作为枢纽
//: *但是在逆序的时候算法效率会变为O(N²) 因为每次都要为 1 和N-1个子数组排序


func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

struct ArraySh{
    private var theArray:[Int]
    private(set) var nElements:Int
    init(max:Int) {
        theArray = Array<Int>(count: max,repeatedValue: 0)
        nElements = 0
    }
    mutating func insert(value:Int) {
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
    mutating func partitionit(left:Int,right:Int,privot:Int) -> Int {
        var leftPointer = left - 1
        //: NOTE:这里修改算法的原因要把最后一个元素当做枢纽，所以没必要对枢纽划分， 划分算法的最后一点要吧枢纽交换到left指针停留的位置
        var rightPointer = right //之前为 right+1
        while true {
            repeat {
                leftPointer += 1
            }    // 遇见左侧大于 枢纽的停下来， 这样每次都能找到一个待交换的左侧的
                while  theArray[leftPointer] < privot
            //                leftPointer < rightPointer &&  这个条件可以去掉， 因为left最多移动到right
            //            当left = right 是  thearray【left】就是枢纽
            
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
        //:  最后交换左右两端
        swap(leftPointer, index2: right)
        
        return leftPointer
        
    }
    mutating func swap(index1:Int,index2:Int) {
        let temp = theArray[index1]
        theArray[index1] = theArray[index2]
        theArray[index2] = temp
        
    }
    mutating func quickSort() {
        recQuickSort(0, right: nElements-1)
    }
    mutating func recQuickSort(left:Int,right:Int) {
        if right - left <= 0 {
            return // 一个元素默认为有序的
        }else {
            let privot =  theArray[right] // 最右侧作为枢纽
            //: *              返回枢纽所在的位置， 枢纽在这一部已经确定了位置
            //: *              对于枢纽所在位置的左侧 要重新递归排序， 枢纽右侧的也要递归重新排序
            //: *             所以递归中不包括枢纽自己
            let paritition  = partitionit(left, right: right, privot: privot)
            recQuickSort(left, right: paritition-1)
            recQuickSort(paritition+1, right: right)
        }
    }
}


let count = 10
var theArray = ArraySh(max: count)

for i in 0..<count {
    theArray.insert(randomInRange(0...999))
}
theArray.display()

theArray.quickSort()
theArray.display()

//: [Next](@next)
