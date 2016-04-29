//: Playground - noun: a place where people can play

import UIKit
//: MARK - 3 插入排序
func insertionSort<T:Comparable>(aArr:[T]) -> [T] {
    var arr = aArr
    for outerIndex in 1..<arr.count { //  在插入排序中OuterIndex左侧是有序的 ， 右侧无需，依次判断 并且向右移动给给被标记变量留出位置
        let temp = arr[outerIndex] // 标记每次需要被插入的数据
        var innerIndex = outerIndex
        
        while innerIndex > 0 && arr[innerIndex - 1 ] >= temp  { // innerIndex , 遍历到最左端也就是0结束，或者是遍历到小于被标记值
            arr[innerIndex] = arr[innerIndex - 1 ]
            innerIndex -= 1 ; // copy 操作
        }
        arr[innerIndex] = temp // 插入被标记值
        
    }
    
    
    return arr
    
}


//   以上为复习

func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

struct ArraySh{
    private var theArray:[Int]
    private var nElements:Int
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
//     算法思想 将插入排序的1  改为h即可
    mutating func shellSort() {
        var innerIndex = 0,outerIndex = 0
        var tempValue = 0
        var h = 1
        while h<=nElements/3 {
            h = h*3 + 1
        } // 求出knuth间隔序列
        while h>0 { //eg: 0-9  (0,4,8)
            for outer in h..<nElements { //外层从4-9 // 往最大排列
                outerIndex = outer
                tempValue = theArray[outer]
                innerIndex = outerIndex
                //内层是4开始 // inner - h变回到了0
                while innerIndex > h-1 && theArray[innerIndex-h] >= tempValue {
                    theArray[innerIndex] = theArray[innerIndex-h]
                    innerIndex -= h
                }
                theArray[innerIndex] = tempValue
            }
            
            h = (h-1)/3 // 减小间隔序列
            
        }
    }
    
    
}
// 效率不好估计 一般介于O(N²)和O(nLog（N）)   估计在 O(N(3/2平分))  和 O(N(7/6平分))
let count = 10
var thearray = ArraySh(max: count)
for i in 0..<count {
    thearray.insert(randomInRange(0..<count))
}
thearray.display()
thearray.shellSort()
thearray.display()
