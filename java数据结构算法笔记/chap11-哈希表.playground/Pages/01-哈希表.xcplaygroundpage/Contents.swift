//: Playground - noun: a place where people can play

import UIKit

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
    
    mutating func insertItem(item:DataItem) {
//        assert hashTable not full 
        let key = item.aData
        var  hashValue = hashFunc(key)
        while hashArray[hashValue] != nil && hashArray[hashValue]?.aData != HashTable.NonItemKey {// 为空且是已经删除的元素
            hashValue += 1 // 开发地址法 ，线性探测
            hashValue %= size //求余的意思是探索到达线性表尾部的时候 置为零
        }
        hashArray[hashValue] = item
    }
    
    mutating func deleteKey(key:Int) -> DataItem? {
        var hashValue = hashFunc(key)
        while  hashArray[hashValue] != nil {
            if hashArray[hashValue]?.aData == key  {
                let temp = hashArray[hashValue]
                hashArray[hashValue]?.aData = HashTable.NonItemKey
                return temp
            }
            hashValue += 1
            hashValue %= size
        }
        return nil
    
    }
    func findKey(key:Int) -> DataItem? {
        var hashValue = hashFunc(key)
        while hashArray[hashValue] != nil {
            if hashArray[hashValue]?.aData == key {
                return hashArray[hashValue]
            }
            hashValue += 1
            hashValue %= size
            
        }
        return nil
    
    }
    
    
}


var table = HashTable(asize: 60)

table.insertItem(DataItem(aData: 29))
table.insertItem(DataItem(aData: 29 + 60))
table.insertItem(DataItem(aData: 29 + 180))
table.insertItem(DataItem(aData: 29 + 240))


table.displayHashTable()



