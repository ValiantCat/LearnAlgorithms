//: [Previous](@previous)

import Foundation
//: 利用小数组插入排序提示效率


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
        var leftPointer = left
        //: NOTE:这里修改算法的原因要把最后一个元素当做枢纽，所以没必要对枢纽划分， 划分算法的最后一点要吧枢纽交换到left指针停留的位置
        //         因为三值1求最中指的方法  left  right   right-1(原来的center) 已经有序 ，没必要排序
        var rightPointer = right - 1  //之前为 right+1 // 后来要留出当枢纽 变成了 right  // 最后变成了 right
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
        let size = right-left + 1
        if size <= 10  {
            insertionSort(left, right: right)
        }else {
            let privot = mediaOf3(left, right: right)  // ******求三值算法已经修改完毕 最右侧作为枢纽
            //              返回枢纽所在的位置， 枢纽在这一部已经确定了位置
            //              对于枢纽所在位置的左侧 要重新递归排序， 枢纽右侧的也要递归重新排序
            //              所以递归中不包括枢纽自己
            let paritition  = partitionit(left, right: right, privot: privot)
            recQuickSort(left, right: paritition-1)
            recQuickSort(paritition+1, right: right)
        }
    }
    mutating func insertionSort(left:Int,right:Int)  {
        
        for outerIndex in left+1..<right { //  在插入排序中OuterIndex左侧是有序的 ， 右侧无需，依次判断 并且向右移动给给被标记变量留出位置
            let temp = theArray[outerIndex] // 标记每次需要被插入的数据
            var innerIndex = outerIndex
            
            while innerIndex > left && theArray[innerIndex - 1 ] >= temp  { // innerIndex , 遍历到最左端也就是0结束，或者是遍历到小于被标记值
                theArray[innerIndex] = theArray[innerIndex - 1 ]
                innerIndex -= 1 ; // copy 操作
            }
            theArray[innerIndex] = temp // 插入被标记值
            
        }
        
        
        
        
    }
    
    mutating func manualSort(left:Int,right:Int) {
        let size = right-left + 1
        if size == 1 {
            return
        }else if size == 2 {
            swap(left, index2: right)
        }else {
            let center = (left+right)/2
            if theArray[left]  > theArray[center]{
                swap(left, index2: center)
            }
            if theArray[left] > theArray[right] {
                swap(left, index2: right)
            }
            if theArray[center] > theArray[right] {
                swap(center, index2: right)
            }
            
            
        }
        
        
    }
    
    //     从三个中找出均值
    mutating func mediaOf3(left:Int,right:Int) -> Int{
        let center = (left+right)/2
        if theArray[left]  > theArray[center]{
            swap(left, index2: center)
        }
        if theArray[left] > theArray[right] {
            swap(left, index2: right)
        }
        if theArray[center] > theArray[right] {
            swap(center, index2: right)
        }
        swap(center, index2: right-1)
        return theArray[right-1]  // 这时候手动把均值放在  right -1 的位置  避免了划分算法的改动
        //        2,,,,,,,,1,,,,,,,x4
        //        1,,,,,,,,x,,,,,,,24
    }
    
}


var theArray = ArraySh(max: 10)

for i in 0..<10 {
    theArray.insert(randomInRange(0...999))
}
theArray.display()

theArray.quickSort()
theArray.display()

//: [Next](@next)
