import UIKit

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1Node = l1
    var l2Node = l2
    var plusVal: Int
    var reminder: Int = 0
    var carry: Int = 0
    var startNode: ListNode?
    var resultNode: ListNode?

    while l1Node != nil || l2Node != nil {
        plusVal = (l1Node?.val ?? 0) + (l2Node?.val ?? 0) + carry
        reminder = plusVal % 10
        carry = plusVal / 10

        if startNode == nil {
            startNode = ListNode(reminder)
            resultNode = startNode
        } else {
            resultNode?.next = ListNode(reminder)
            resultNode = resultNode?.next
        }

        l1Node = l1Node?.next
        l2Node = l2Node?.next
    }

    if carry > 0 {
        resultNode?.next = ListNode(carry)
    }

    return startNode
}
