//: Playground - noun: a place where people can play

import UIKit

struct Anagram{
    var size:Int
    var count:Int
    var characterArr:[Character]
    init(charArr:[Character]) {
        self.characterArr = charArr
        size = charArr.count
        count = 0
    }
//    算法思想， 1 固定第一位
    mutating func doAnagram(newSize:Int) {
        if newSize == 1 {
            return
        }
        for _  in 0..<newSize {
            doAnagram( newSize - 1 ) // 2 对n-1 进行圈排列
            if newSize == 2  {
                
                print("No \(count) \(charArr)")
                count += 1
            }
            rotate(newSize) // 所有数据往左移动， 
        }
    }
    mutating func rotate(newSize:Int) {
        
        let  position = size - newSize // 标记位置
        let temp = characterArr[position]
        
        
        for index  in position+1..<size { // 左移动
            characterArr[index - 1 ] = characterArr[index]
        }
        characterArr[size - 1] = temp // 放在最后以为
        
    }
    mutating func disPlayWord() {
        if count < 99 {
            print("  ")
        }
        if count < 9 {
            print("" )
        }
        count += 1
        print("\(count) ")
        for i  in 0..<size {
            print(characterArr[i])
            
        }
      
    }
}
let charArr:[Character] = ["C","A","T","S"]
var ang = Anagram(charArr:charArr)
ang.doAnagram(charArr.count)













// 






import Foundation
//http://www.cnblogs.com/GoAhead/archive/2012/05/30/2526563.html  // 还有一个是求所有子集的

func Permutation_Solution1(charArr:[Character] , _ begin:Int,_ end:Int) {
    var characters  = charArr
    
    
    
    if begin == end   {
        print(characters)
    }else {
        for i in begin...end {
            
            //            如果数组有重复的需要在这里判断重复 然后return
            //            if( i equal begin) return
            
            let temp = characters[i]
            characters[i] = characters[begin]
            characters[begin] = temp
            
            Permutation_Solution1(characters, begin + 1, end)
            
            let temp2 = characters[i]
            characters[i] = characters[begin]
            characters[begin] = temp2
            
        }
    }
    
}

Permutation_Solution1([ "A","B","C"], 0, 2)

















