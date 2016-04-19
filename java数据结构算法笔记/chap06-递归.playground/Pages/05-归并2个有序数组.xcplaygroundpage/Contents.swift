//: [Previous](@previous)

import Foundation

func merge(arrayA:[Int],_ sizeA:Int,_ arrayB:[Int], _ sizeB:Int ) -> [Int] {
    var arrayC = Array<Int>(count: sizeA + sizeB , repeatedValue:  0)
    var aDex = 0 , bDex = 0, cDex = 0
    while aDex < sizeA && bDex < sizeB{
        if arrayA[aDex] < arrayB[bDex] {
            
            arrayC[cDex] = arrayA[aDex]
            cDex += 1
            aDex += 1
        }else {
            arrayC[cDex] = arrayB[bDex]
            cDex += 1
            bDex += 1
        }
    }
    while aDex < sizeA {
        arrayC[cDex] = arrayA[aDex]
        cDex += 1
        aDex += 1
    }
    while bDex < sizeB {
        arrayC[cDex] = arrayB[bDex]
        cDex += 1
        bDex += 1
    }
    
    return arrayC
}

print(merge([23,47,81,95], 4, [7,14,39,55,62,74], 6))


//: [Next](@next)
