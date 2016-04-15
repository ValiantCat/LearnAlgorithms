//: Playground - noun: a place where people can play

import UIKit

func searchStr(source:String , inTarget  target:String) -> Int {
    
    let sourceBound = source.characters.count - target.characters.count + 1  //  + 1
    let targetBound = target.characters.count
    var  searchResult = 0
    for i  in 0..<sourceBound {
        for j in 0..<targetBound {
            if source[source.startIndex.advancedBy(i+j)] != target[target.startIndex.advancedBy(j)]{
                break;
            }
            searchResult = j + 1 //  这时j还未++
        }
        if searchResult == targetBound {
            return i
        }
        
    }
    
    return -1
}

searchStr("abcdefghi", inTarget: "def")
searchStr("abcdefghi", inTarget: "cde4124")
searchStr("abcdefghi", inTarget: "ghi")
//http://www.jianshu.com/p/93a12e97048c