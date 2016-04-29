//: [Previous](@previous)

import Foundation

func rechFind(source:[Int],searchKey:Int,lowerBound:Int,upperBound:Int) -> Int {
    let NouFond = -1
    let  curIn = (lowerBound + upperBound) / 2
    if source[curIn] == searchKey {
        return curIn
    }else if lowerBound > upperBound {
        return NouFond
    }else {
        if source[curIn] < searchKey {
            return rechFind(source, searchKey: searchKey, lowerBound: curIn + 1, upperBound: upperBound)
        }else {
            return rechFind(source, searchKey: searchKey, lowerBound: lowerBound, upperBound: curIn - 1  )
        }
    }
    
}

let arr = [1,2,3,4,5,6,7,8,9,10]
rechFind(arr, searchKey: 3, lowerBound: 0, upperBound: 9)
// O(LogN)
//http://www.jianshu.com/p/30906f7014ec


//1.时间复杂度：
//每次能去掉一半即 nlogn
func binarySearch(source:[Int], withTarget target:Int) -> Int {
    guard source.count > 0 else {return -1}
    source.sort(>) // 升序排列
    var start = 0
    var end = source.count - 1
    var mid = 0
    while start + 1 < end { // 递归容易溢出 stackOverFlow
        mid = start + (end - start) / 2  // 移位
        if source[mid] < target {
            start = mid
        }else  {
            end = mid
            
        }
    }
    if source[start] == target {
        return start
    }
    if source[end] == target {
        return end
    }
    
    return  -1
}

binarySearch([9,1,2,3,5,6,7,8], withTarget: 3)



//: [Next](@next)
