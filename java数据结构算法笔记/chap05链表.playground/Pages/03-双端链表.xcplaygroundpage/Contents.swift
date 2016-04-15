//: [Previous](@previous)

import Foundation
class Link {
    var data:String
    var next:Link?
    var previous:Link?
    init(aData:String) {
        data = aData
    }
    func disPlayLink() {
        print("current data is \(data)")
    }
}
class DoublyLinkedList {
    private var first:Link?
    private var last:Link?
    var isEmpty:Bool {
        return first == nil
    }
    
    func insertFirst(data:String) {
        let newLink = Link(aData: data)
        if isEmpty { // 链表为空
            last = newLink
        }else {
            first?.previous = newLink // 原来的首元素的前指向新元素
        }
        newLink.next = first
        first = newLink
    }
    func insertLast(data:String) {
        let newLink = Link(aData: data)
        if isEmpty {
            first = newLink
        }else {
            last?.next = newLink
            newLink.previous = last
        }
        last = newLink
        
    }
    func deleteFirst() -> Link? {
        if isEmpty {
            return nil
        }
        let temp = first
        if first?.next == nil { // 只有一个元素
            last = nil
        }else {
            first?.next?.previous = nil
        }
        
        first = first?.next
        return temp
        
    }
    func deleteLast() -> Link? {
        if isEmpty {
            return nil
        }
        let temp = last
        if first?.next == nil { // 只有一个元素
            first = nil
        }else {
            temp?.previous?.next = nil
        }
        last = last?.previous
        return temp
    }
    func insertAfter(key:String, _ data:String ) -> Bool {
        
        var  current = first
        while current?.data != key {
            current = current?.next
            if current == nil {
                return false // 没有找到
            }
        }
        let newLink = Link(aData: data)
        if current === last {
            newLink.next = nil
            last = newLink
        }else {
            newLink.previous = current?.next
            current?.next?.previous = newLink
        }
        newLink.previous = current
        current?.next = newLink
        return true
    }
    
    func deleteKey(key:String) -> Link? {
        var current = first
        while  current?.data != key {
            current = current?.next
            if current == nil {
                return nil
            }
        }
        if current === first { //只有一个
            first = current?.next
        }else {
            current?.previous?.next = current?.next
            
        }
        
        if current === last {
            last = current?.previous
        }else {
            current?.next?.previous = current?.previous
        }
        return current;
        
        
    }
    
    func displayForward() {
        print("first --->Last")
        var current = first
        while current != nil {
            current?.disPlayLink()
            current = current?.next
        }
        print("")
        
    }
    func displayBackword() {
        print("last-->first")
        var current = last
        while  current != nil {
            current?.disPlayLink()
            current = current?.previous
        }
        print("")
    }
}

let theList = DoublyLinkedList()
theList.insertLast("A")
theList.insertLast("B")
theList.insertLast("C")
theList.displayForward()
theList.displayBackword()

theList.insertLast("W")
theList.insertLast("Y")
theList.insertLast("Z")
theList
//theList.displayForward()
//theList.displayBackword()
theList.deleteFirst()
theList.deleteLast()

theList.displayForward()
theList.displayBackword()

theList.deleteKey("W")
theList.displayForward()
theList.displayBackword()
theList.insertAfter("Y", "Z")
theList.displayForward()
theList.displayBackword()


//: [Next](@next)
