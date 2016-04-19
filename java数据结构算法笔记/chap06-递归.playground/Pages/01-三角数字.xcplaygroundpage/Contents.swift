//: [Previous](@previous)

import Foundation

func triangleLoop(n:Int) -> Int {
    var index = n
    var total = 0
    while index > 0 {
        total +=   index
        index -= 1
    }
    return total
}

triangleLoop(5)


func triangle(n:Int) -> Int {

    let  index = n
    
    if index == 1 {  // 基值状态避免无限递归
        print("return 1 ")
        return 1
    }else {
        
        let result = (index + triangle(index-1))
        print("return  \(result)")
        return result
    }
}
triangle(5)


// total(n) = (n²+n)/2
triangle(1000)


func factorial(n:Int) -> Int {

    let index = n
    if  index == 0 {
        return 1
    }else {
        return n * factorial(index - 1)
    }
}
func factorialLoop(n:Int) -> Int {
    var index = n
    var total = 1
    
    while  index  > 0 {
        total *= index
        index -= 1
    }
    return total

}
factorial(6)
factorialLoop(6)
//: [Next](@next)
