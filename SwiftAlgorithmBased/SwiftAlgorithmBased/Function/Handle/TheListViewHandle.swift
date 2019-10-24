//
//  TheListViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/16.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit


let TheListTitle = "链表"

class ListNode
{
    var val:Int
    var next:ListNode?
    init( val:Int )
    {
        self.val = val
        self.next = nil
    }
    
}

class TheListViewHandle:
NSObject,
someOneAnswerProtocol{

    var head: ListNode?
    var tail: ListNode?
    
    
    @objc func defineTheNode()
    {
        let head = ListNode.init(val: 10)
        print("定义一个节点\(head)")
    
    }
    
    @objc func appendToHead()
    {
        //头插法
        self.p_appendToHead(20)
    }
    
    @objc func appendToTail()
    {
        //尾插法
        self.p_appendToTail(10)
        
    }
    
    @objc func getLeftList()
    {
        /*
         例如：1->5->3->2->4->2，给定 x=3 ，则返回为 1->2->2
         */
        let one = ListNode.init(val: 1)
        let two = ListNode.init(val: 5)
        let three = ListNode.init(val: 3)
        let four = ListNode.init(val: 2)
        let five = ListNode.init(val: 4)
        let six = ListNode.init(val: 2)
        
        one.next = two
        two.next = three
        three.next = four
        four.next = five
        five.next = six

        let result = self.p_getLeftList(one, 3)
        
        var dummy = result
        while dummy != nil {
            print("node val: \(dummy!.val)")
            dummy = dummy?.next
        }
        
    }
    
    func partition()  {
        
        /*
         例如：1->5->3->2->4->2，给定 x=3 ，则返回为 1->2->2->5->3->4
         */
        let one = ListNode.init(val: 1)
        let two = ListNode.init(val: 5)
        let three = ListNode.init(val: 3)
        let four = ListNode.init(val: 2)
        let five = ListNode.init(val: 4)
        let six = ListNode.init(val: 2)
        
        one.next = two
        two.next = three
        three.next = four
        four.next = five
        five.next = six
        
        let result = self.p_partition(one, 3)
        
        var dummy = result
        while dummy != nil {
            print("node val: \(dummy!.val)")
            dummy = dummy?.next
        }
    }
    
    @objc func hasCycle() {
        
        //检测一个链表中是否有环
        let one = ListNode.init(val: 333)
        
        let result  = self.p_hasCycle(one)
        
         print("是否有环\(result)")
        
    }
    
    @objc func removeNthFromEnd()
    {
        /*
         删除链表中倒数第n个节点 例：1->2->3->4->5,n = 2 ,返回 1->2->3->5
         */
        let one = ListNode.init(val: 1)
        let two = ListNode.init(val: 2)
        let three = ListNode.init(val: 3)
        let four = ListNode.init(val: 4)
        let five = ListNode.init(val: 5)
        
        one.next = two
        two.next = three
        three.next = four
        four.next = five
        
        let result = self.p_removeNthFromEnd(head: one, n: 2)
        
        var dummy = result
        while dummy != nil {
            print("node val: \(dummy!.val)")
            dummy = dummy?.next
        }
    }
    
     func p_appendToHead(_ val:Int) {
        if head == nil {
            head = ListNode.init(val: val)
            tail = head
            
        }else{
            let temp = ListNode.init(val: val)
            temp.next = head
            head = temp
        }
    }
    func p_appendToTail(_ val:Int) {
        if tail == nil{
            tail = ListNode.init(val: val)
            head = tail
        } else{
            tail!.next = ListNode.init(val: val)
            tail = tail!.next
        }
        
    }
    
    func p_getLeftList(_ head: ListNode?,_ x: Int) -> ListNode? {
        
        let dummy = ListNode.init(val: 0)
        var per = dummy , node = head
        while node != nil {
            if node!.val < x{
                per.next = node
                per = node!
            }
            node = node!.next
        }
        //防止构成环
        per.next = nil
        return dummy.next
        
    }
    
    func p_partition(_ head: ListNode?,_ x: Int) -> ListNode? {
        //引入Dummy 节点
        let prevDummy = ListNode.init(val: 0),postDummy = ListNode.init(val: 0)
        var prev = prevDummy, post = postDummy
        
        var node = head
        
        //用尾插法处理左边和右边
        
        while node != nil {
            if node!.val < x {
                prev.next = node
                prev = node!
            }else{
                post.next = node
                post = node!
            }
            node = node!.next
        }
        //防止循环引用
        post.next = nil
        //左右拼接
        
        prev.next = postDummy.next
        
        
        return prevDummy.next
    }
    
    
    func p_hasCycle(_ head:ListNode?) -> Bool {
        
        var slow = head
        var fast = head
        
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            
            if slow === fast{
                return true
            }
        }
        return false
        
    }
    
    func p_removeNthFromEnd(head: ListNode?, n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        let dummy = ListNode.init(val: 0)
        dummy.next = head
        var prev: ListNode? = dummy
        var post: ListNode? = dummy
        
        //设置后一个节点初始位置
        
        for _ in 0..<n{
            if post == nil{
                break
            }
            
            post = post!.next
        }
        
        //同时移动前后节点
        
        while post != nil && post!.next != nil {
            prev = prev!.next
            post = post!.next
        }
        
        //删除节点
        
        prev!.next = prev!.next!.next
        
        return dummy.next
    }
    
    
    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }
    
    
    func getViewControllerTitle() -> String {
        return TheListTitle
    }

    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: TheListViewHandle.self),
                "problem":[
                    ["title":"定义链表节点","selName":"defineTheNode"],
                    ["title":"链表的基本操作《头插法》","selName":"appendToHead"],
                    ["title":"链表的基本操作《尾插法》","selName":"appendToTail"],
                    ["title":"给出一个链表和一个X值要去只保留链表中所有小于x值，原链表的节点顺序不能变","selName":"getLeftList"],
                ["title":"给出一个链表和一个值x，要求将链表中所有小于x的值放到左边，所有大于x的值放到右边，并且原链表的节点顺序不能变？","selName":"partition"],
                    ["title":"如何检测一个链表中是否有环","selName":"hasCycle"],
                    ["title":"删除链表中倒数第n个节点","selName":"removeNthFromEnd"],
                    
                ]
                ] as [String : Any]
        
        
        return dict as [String : AnyObject]
    }
    

}
