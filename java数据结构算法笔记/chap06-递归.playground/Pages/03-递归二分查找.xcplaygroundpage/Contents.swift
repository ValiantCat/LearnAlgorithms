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
//: [Next](@next)
