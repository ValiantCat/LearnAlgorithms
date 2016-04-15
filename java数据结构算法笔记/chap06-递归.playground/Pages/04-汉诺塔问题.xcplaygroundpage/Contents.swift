//: [Previous](@previous)

import Foundation



func doTowers(topN:Int,from:Character,inter:Character,to:Character) {
    
    if topN == 1 {
        print("Disk 1 from \(from) to \(to)")
    }else {
        doTowers(topN - 1 ,from: from , inter: to  , to: inter ) // from - Inter // 将除了最底下的盘子的子树移动到中间
        print("disk \(topN) from \(from)  to \(to)")
        doTowers(topN - 1 , from: inter,inter: from , to: to )
    }
    
}

doTowers(3, from: "A", inter: "B", to: "C")
//: [Next](@next)
