//: Playground - noun: a place where people can play

import UIKit

// 一个堆的关键点
// 一个节点的父节点  (x-1)/2
// 一个节点的左子节点  2*x + 1
// 一个节点的右子节点  2*x + 2
struct Node {
    var aData:Int
    
}
class Heap {
    private var heapArray:[Node?]
    private let maxSize:Int
    private var currentSize:Int = 0
    init(mx:Int) {
        maxSize = mx
        heapArray = Array<Node?>(count: maxSize,repeatedValue: nil)
    }
    var isEmpty:Bool {
        return currentSize == 0
    }
    var isFull:Bool {
        return currentSize == maxSize
    }
    func insert(key:Int) -> Bool {
        guard !isFull else { return false }
        let newNode = Node(aData: key)
        heapArray[currentSize] = newNode
        tickleUp(currentSize)
        currentSize += 1
        return true
        
    }
    // 节点上移
    func tickleUp(i:Int) {
        var index = i
        var parient = (index - 1)/2
        let  bottom = heapArray[index] //  取出要往上冒泡的元素
        while index > 0  && heapArray[parient]?.aData < bottom?.aData {
            heapArray[index] = heapArray[parient]
            index = parient
            parient = (parient - 1 )/2
        }
        heapArray[index] = bottom
    }
    func remove() -> Node? {
        guard !isEmpty else {return nil }
        let root = heapArray[0]
        currentSize -= 1
        heapArray[0] = heapArray[currentSize]
        trickleDown(0)// 往下降
        return root
    }
    
    func trickleDown(i:Int) {
        var index = i
        var largerChild = 0
        let top = heapArray[index] // 把最外层记住
        while index < currentSize/2 { // 至少有一个子节点
            let leftChild = 2 * index + 1
            let rightChild = leftChild + 1
            // 找到最大的子借点
            if rightChild < currentSize && heapArray[leftChild]?.aData < heapArray[rightChild]?.aData  {
                largerChild = rightChild
            }else {
                largerChild = leftChild
            }
            if  top?.aData >= heapArray[largerChild]?.aData {
                break
            }
            heapArray[index] = heapArray[largerChild] // 大的往上冒泡
            index = largerChild
            
        }
        heapArray[index] = top
    }
    func change(index:Int , newValue:Int) -> Bool {
        
        if index < 0 || index >= currentSize {return false }
        let oldValue = heapArray[index]?.aData
        heapArray[index]?.aData = newValue
        if oldValue < newValue {
            tickleUp(index) // 上移
        }else {
            trickleDown(index)
        }
        return true
    }
    
    func displayHeap() -> Void {
        print("heapArray: ",terminator:"")
        for m in 0..<currentSize {
            if heapArray[m] != nil  {
                print("\(heapArray[m]!.aData)   ",terminator:"")
            }else {
                print("----",terminator:"")
            }
        }
        print("")
        var nBlanks = 32
        var itemsPerRow = 1
        var column = 0
        var j = 0
        let dots = "................................."
        print(dots + dots + dots + dots)
        while currentSize > 0 {
            if column == 0 {
                for _  in 0..<nBlanks {
                    print(" ",terminator:"")
                }
                
            }
            print("\(heapArray[j]!.aData)",terminator:"")
            
            
            j += 1
            if j == currentSize{
                break;
            }
            column += 1
            if column == itemsPerRow {
                nBlanks /= 2
                itemsPerRow *= 2
                column = 0
                print("")
                
            }else {
                
                for _  in 0..<nBlanks {
                    print("  ",terminator:"")
                }
            }
        }
        print("")
        print(dots + dots + dots + dots)
        
    }
    
    
    
}


let theHeap = Heap(mx: 31)
theHeap.insert(70)
theHeap.insert(40)
theHeap.insert(50)
theHeap.insert(20)
theHeap.insert(60)
theHeap.insert(100)
theHeap.insert(80)
theHeap.insert(30)
theHeap.insert(10)
theHeap.insert(90)
theHeap.displayHeap()
theHeap.insert(53)
theHeap.displayHeap()

