//: Playground - noun: a place where people can play

import UIKit


//http://www.jianshu.com/p/fef855ed3009
//: MARK： - 1 冒泡排序
func bubbleSort<T:Comparable>( aArr:[T]) -> [T] {
    var arr = aArr
    for outerIndex in (1...arr.count - 1).reverse() { // 从最外层开始
        
        for innerIndex in 0..<outerIndex {
            if arr[innerIndex] > arr[innerIndex + 1] {
                let temp = arr[innerIndex]
                arr[innerIndex] = arr[innerIndex + 1]
                arr[innerIndex + 1] = temp
            }
        }
    
    
    }
    

    return arr
}


//冒泡排序的时间复杂度为O ( n2 )。
print(bubbleSort([9,8,7,6,5,4,3,2,1,0]))



//
//    for outerIndex in 0..<arr.count  { // 外层循环
//        for innerIndex in outerIndex + 1..<arr.count  {
//
//            if arr[outerIndex] > arr[innerIndex] {
//                let t = arr[outerIndex]
//                arr[outerIndex] = arr[innerIndex]
//                arr[innerIndex] = t
//            }
//        }
//
//    }


//: MARK - 2 选择排序

func selectSort<T:Comparable>( aArr:[T]) -> [T] {
    var arr = aArr
    var minIndex = 0 // 记录每次遍历的最小值
    for outerIndex in 0..<arr.count {
        minIndex = outerIndex
        for innerIndex in (outerIndex + 1)..<arr.count {
            if arr[minIndex] > arr[innerIndex] {
                    minIndex = innerIndex // 判断最小值，充值选择的标记
            }
//            在每次外层遍历之后再交换
            if minIndex != outerIndex {
                let t = arr[outerIndex]
                arr[outerIndex] = arr[minIndex]
                arr[minIndex] = t
            }
        }
    }
    

    return arr
}

print(selectSort([9,8,7,6,5,4,3,2,1,0]))







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

print(insertionSort([9,8,7,6,5,4,3,2,1,0]))

// 选法的比较效率 O(N²/4) 比冒泡快一倍，比选择快一点

//对于 基本有序的序列，由于while循环总是为假，算法的效率基本达到O(N²) 对于逆序由于复制太多并没有冒泡快

