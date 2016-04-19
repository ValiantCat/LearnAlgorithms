//: [Previous](@previous)

import Foundation


struct DArray {
    private var theArray:[Int]
    private var nElems:Int = 0 //初始化时有0个数据
    init(max:Int) {
        
        theArray = Array<Int>(count: max,repeatedValue: 0)
    }
    mutating func insert(value:Int) {
        theArray[nElems] = value
        nElems += 1
    }
    func display() {
        (0..<nElems).forEach  {
            print(" index \($0) is \(theArray[$0])")
            
        }
    }
    mutating func mergeSort() {
        var workSpace = (0..<nElems).map{ _ in 0}
        recMergeSort(&workSpace, lowerBound: 0, upperBound: nElems - 1 )
    }
    
    mutating func recMergeSort(inout workSpace:[Int], lowerBound:Int,upperBound:Int) { // 排序
        if lowerBound == upperBound {
            return
        }else {
            
            let mid = (lowerBound + upperBound) / 2
            recMergeSort(&workSpace, lowerBound: lowerBound, upperBound: mid)
            recMergeSort(&workSpace, lowerBound: mid + 1 , upperBound:upperBound)
            merge(&workSpace, lowPtrTemp: lowerBound, highPtrTemp: mid + 1, upperBound: upperBound)
        }
    }
    mutating func merge(inout workSpace:[Int], lowPtrTemp:Int,  highPtrTemp:Int ,  upperBound:Int) {
        var lowPtr = lowPtrTemp
        var highPtr = highPtrTemp
        
        let lowerBound = lowPtr
        let mid = highPtr - 1
        let n = upperBound - lowerBound + 1
        var index = 0
        while lowPtr <= mid &&  highPtr <= upperBound {
            if  theArray[lowPtr] < theArray[highPtr] {
                workSpace[index] = theArray[lowPtr]
                index += 1
                lowPtr += 1
            }else {
                workSpace[index] = theArray[highPtr]
                index += 1
                highPtr += 1
            }
        }
        while lowPtr <= mid {
            workSpace[index] = theArray[lowPtr]
            index += 1
            lowPtr += 1
            
        }
        while highPtr <= upperBound {
            workSpace[index] = theArray[highPtr]
            index += 1
            highPtr += 1
        }
        
        for i in 0..<n {
            theArray[lowerBound + i] = workSpace[i]
        }
        
    }
    
}



// 效率 OO(nlogN)




var arr = DArray(max: 100)
arr.insert(64)
arr.insert(21)
arr.insert(33)
arr.insert(70)
arr.insert(12)
arr.insert(85)
arr.insert(44)
arr.insert(3)
arr.insert(99)
arr.insert(0)
arr.insert(108)
arr.insert(36)


arr.display()
arr.mergeSort()
print("after")
arr.display()

//: [Next](@next)
