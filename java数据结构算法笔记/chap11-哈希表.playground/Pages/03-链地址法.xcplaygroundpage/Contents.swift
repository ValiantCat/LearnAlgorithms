//: [Previous](@previous)

import Foundation


class Link {
    private(set) var aData:Int
    private var next:Link?
    init(data:Int){
        aData = data
    }
    func displayLink() {
        print("data is \(aData)")
    }
}
class SortedList {
    private var first:Link?
    func insert(theLink:Link) {
        let key = theLink.aData
        var previous:Link? = nil
        var current = first
        while current != nil  && key > current?.aData {
            previous = current
            current = current?.next
        }
        if previous == nil {
            first = theLink
        }else {
            previous?.next = theLink
        }
        theLink.next = current
    }
    func delete(key:Int) {
        var previous:Link? = nil
        var current = first
        while current != nil && key != current?.aData {
            previous = current
            current = current?.next
        }
        if previous == nil {
            first = first?.next
        }else {
            previous?.next = current?.next
        }
    }
    
    func find(key:Int) -> Link? {
        var current = first
        while current != nil && current?.aData <= key {
            if current?.aData == key{
                return  current
            }
            current = current?.next
        }
        return nil
    }
    
    
    func displayList() {
        print("first --- > Last")
        var current = first
        while current != nil  {
            current?.displayLink()
            current = current?.next
        }
        print("end display SortedList")
    }
}
struct HashTable {
    private var hashArray:[SortedList]
    private var arraySize:Int
    init(size:Int) {
        arraySize = size
        hashArray = (0..<arraySize).map{ _ in  SortedList()}
    }
    func displayTable() {
        hashArray.forEach{$0.displayList()}
    }
    func hashFunc(key:Int) -> Int {
        return key % arraySize
    }
    func insertLink(theLink:Link) {
        let key = theLink.aData
        let hashValue = hashFunc(key)
        hashArray[hashValue].insert(theLink)
        
    }
    func delete(key:Int) {
        let hashValue = hashFunc(key)
        hashArray[hashValue].delete(key)
    }
    func find(key:Int) -> Link? {
        let hashValue = hashFunc(key)
        return hashArray[hashValue].find(key)
    }
    
}

var hashTable = HashTable(size: 20)
hashTable.insertLink(Link(data: 10))
hashTable.insertLink(Link(data: 30))
hashTable.insertLink(Link(data: 50))
hashTable.displayTable()


//: [Next](@next)
