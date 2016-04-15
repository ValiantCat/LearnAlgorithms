//: [Previous](@previous)

import Foundation

class Link {
    
    private var data:Int
    var next:Link?
    init(aData:Int){
        data = aData;
    }
    func disPlayLink() {
        print("current data is \(data)")
    }
}


class FirstLastList {
    
    
    private var first:Link?
    private var last:Link?
    var isEmpty:Bool {
        return first == nil
    }
    func insertFirst(t:Int) {
        let newLink = Link(aData: t)
        if isEmpty {
            last = newLink
        }
        newLink.next = first
        first = newLink
    }
    func insertLast(t:Int){
        let newLink = Link(aData: t)
        if isEmpty {
            first = newLink
        }else {
            last?.next = newLink
            last = newLink
        }
        
    }
    func deleteFirst() ->Link? {
        if isEmpty {
            last = nil
            return nil
        }
        let temp = first
        first = first?.next
        return temp
    }
    func disPlayList() {
        print("List:(first --> last):")
        var current = first
        while current != nil {
            current?.disPlayLink()
            current = current?.next
        }
        print("")
    }
    func find(data:Int) -> Link? {
        var current = first
        while current != nil {
            if current?.data == data {
                return current
            }else {
                current  = current?.next
            }
        }
        return current;
    }
    func delete(data:Int) ->Link? {
        
        guard var  current = first , previous = first else {return nil }
        while current.data != data { // 寻找
            if (current.next == nil) {
                return nil
            }else {
                previous = current
                current = current.next!
            }
        }
        //        链表头
        if current === first {
            first = first?.next
            
        }else { // 表尾部
            previous.next = current.next
        }
        
        
        return current
        
    }
}

let  list  = FirstLastList()
list.insertFirst(10)
list.disPlayList()
list.insertLast(20)
list.disPlayList()
list.deleteFirst()
list.disPlayList()


//: [Next](@next)
