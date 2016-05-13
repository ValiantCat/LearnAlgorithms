//: [Previous](@previous)

import Foundation


func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

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
    // 插入插入到数组最后
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
    // 移除
    func remove() -> Node? {
        guard !isEmpty else {return nil }
        let root = heapArray[0]
        currentSize -= 1
        heapArray[0] = heapArray[currentSize]
        trickleDown(0)// 往下降
        return root
    }
    //     下移
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
    func displayArray() -> Void {
        for i  in 0..<heapArray.count {
            print("index:\(i) \(heapArray[i]!.aData)     ",terminator:"")
        }
        print("")
        
    }
    func incrementSize() -> Void {
        currentSize += 1
    }
    
    func insertAt(index:Int,key:Int) -> Void {
        heapArray[index] = Node(aData: key)
    }
}
let size = 10

let theHeap = Heap(mx: size)
//插入随机数据
for i in 0..<size {
    theHeap.insertAt(i, key: randomInRange(0...7896))
    theHeap.incrementSize()
}
print("随机数")
theHeap.displayArray()
theHeap.displayHeap()

var sortIndex = size/2 - 1
while sortIndex >= 0 {
    theHeap.trickleDown(sortIndex)
    sortIndex -= 1
}
print("生成树后")
theHeap.displayArray()
theHeap.displayHeap()

for i in (0...size-1).reverse() {
    let node = theHeap.remove()
    //    把这个元素放在其实已经被移除的数组最后面，  这样不用使用其他辅助空间
    theHeap.insertAt(i, key: node!.aData)
}

print("排序后")
theHeap.displayHeap()
theHeap.displayArray()



//: [Next](@next)
