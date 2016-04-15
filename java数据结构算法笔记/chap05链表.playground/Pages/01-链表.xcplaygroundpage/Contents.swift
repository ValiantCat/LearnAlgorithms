//: Playground - noun: a place where people can play

import UIKit

class Link {
    
    private var data:Int
    private var next:Link?
    init(aData:Int){
        data = aData;
    }
    func disPlayLink() {
        print("current data is \(data)")
    }
}


class LinkList {
    
    
    private var first:Link?
    var isEmpty:Bool {
        return first == nil
    }
    func insertFirst(t:Int) {
        let newLink = Link(aData: t)
        newLink.next = first
        first = newLink
    }
    func deleteFirst() ->Link? {
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
let list = LinkList()
list.insertFirst(10)
list.insertFirst(20)
list.insertFirst(30)
list.insertFirst(40)
list.insertFirst(50)
//list.disPlayList()
//list.find(20)?.disPlayLink()
list.delete(20)
list.disPlayList()
