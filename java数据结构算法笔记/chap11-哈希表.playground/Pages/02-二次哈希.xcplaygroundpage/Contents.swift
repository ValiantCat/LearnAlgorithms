//: [Previous](@previous)

import Foundation


struct DataItem {
    private(set) var  aData:Int
}


struct HashTable {
    private var hashArray:[DataItem?]
    private var size:Int
    private var nonItem = DataItem(aData: -1)
    static var NonItemKey = -1
    init(asize:Int){
        size = asize
        hashArray = Array<DataItem?>(count:asize,repeatedValue: nil)
    }
    
    func displayHashTable() {
        print("Table:")
        for  i  in 0..<size {
            if hashArray[i] != nil {
                print("index \(i) is \(hashArray[i]!.aData)")
            }else {
                print("index \(i) is none")
            }
        }
    }
    
    func hashFunc(key:Int) -> Int {
        return key % size
    }
    func step(key:Int) -> Int {
        return 5 - key % 5
    }
    mutating func insertItem(item:DataItem) {
        //        assert hashTable not full
        let key = item.aData
        var  hashValue = hashFunc(key)
        let stepSize = step(key)
        while hashArray[hashValue] != nil && hashArray[hashValue]?.aData != HashTable.NonItemKey {// 为空且是已经删除的元素
            hashValue += stepSize // 开发地址法 ，线性探测
            hashValue %= size //求余的意思是探索到达线性表尾部的时候 置为零
        }
        hashArray[hashValue] = item
    }
    
    mutating func deleteKey(key:Int) -> DataItem? {
        var hashValue = hashFunc(key)
        let stepSize = step(key)
        while  hashArray[hashValue] != nil {
            if hashArray[hashValue]?.aData == key  {
                let temp = hashArray[hashValue]
                hashArray[hashValue]?.aData = HashTable.NonItemKey
                return temp
            }
            hashValue += stepSize
            hashValue %= size
        }
        return nil
        
    }
    func findKey(key:Int) -> DataItem? {
        var hashValue = hashFunc(key)
        let stepSize = step(key)
        while hashArray[hashValue] != nil {
            if hashArray[hashValue]?.aData == key {
                return hashArray[hashValue]
            }
            hashValue += stepSize
            hashValue %= size
            
        }
        return nil
        
    }
    
    
}
var table = HashTable(asize: 23)

table.insertItem(DataItem(aData:1))
table.insertItem(DataItem(aData: 38 ))
table.insertItem(DataItem(aData: 37 ))
table.insertItem(DataItem(aData: 20 ))
table.insertItem(DataItem(aData: 24 ))
table.insertItem(DataItem(aData: 5 ))
table.insertItem(DataItem(aData: 25 ))

table.displayHashTable()


//: [Next](@next)
