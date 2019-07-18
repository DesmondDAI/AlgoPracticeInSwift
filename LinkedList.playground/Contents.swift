import UIKit

// 节点
public class Node
{
    var value: String
    var next: Node?

    init(value: String) {
        self.value = value;
    }
}

// 链表
public class LinkedList
{
    private var head: Node?
    private var tail: Node?

    public var first: Node? {
        return head
    }

    public func add(_ string: String) {
        let newNode = Node(value: string)
        if head == nil {
            head = newNode
            head?.next = nil
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
}

// 打印
let myLinkedList = LinkedList()
myLinkedList.add("HELLO")
myLinkedList.add("你好")
myLinkedList.add("haha")
myLinkedList.add("哈哈")
myLinkedList.add("努力")

var node = myLinkedList.first
repeat {
    print("\(node!.value)")
    node = node?.next
} while node != nil

