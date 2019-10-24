//
//  TreeNodeViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/17.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

let TreeNodeTitle = "二叉树"

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(val: Int) {
        self.val = val
    }
}

class TreeNodeHandle:
NSObject,
someOneAnswerProtocol {

    @objc func defineANode()
    {
        var node = TreeNode.init(val: 10)
        
    }
    
    @objc func maxDepth()
    {
        //给定二叉树 [3, 9, 20, nil, nil, 15, 7]  深度是3
        
        let root = TreeNode.init(val: 3)
        root.left = TreeNode.init(val: 9)
        root.right = TreeNode.init(val: 20)
        let second = root.right
        second?.left = TreeNode.init(val: 10)
        second?.right = TreeNode.init(val: 7)
        
        let result = self.p_maxDepth(root: root)
        print("二叉树的深度\(result)")
        
    }
    
    @objc func isValidBST()
    {
        
        //给定二叉树 [50, 20, 60, 15, 30,70]
        
        let root = TreeNode.init(val: 50)
        root.left = TreeNode.init(val: 20)
        root.right = TreeNode.init(val: 60)
        
        let second = root.left
        second?.left = TreeNode.init(val: 15)
        second?.right = TreeNode.init(val: 30)
        
        let thred = root.right
        thred?.right = TreeNode.init(val: 70);
        
        let result = self.p_isValidBST(root: root)
        print("判断一棵二叉树是否为二叉查找树\(result)")
        
    }
    
    @objc func preorderTravelsal()
    {
        //给定二叉树 [28, 16, 30, 13, 22,29，43]
        
        let root = TreeNode.init(val: 28)
        root.left = TreeNode.init(val: 16)
        root.right = TreeNode.init(val: 30)
        
        let second = root.left
        second?.left = TreeNode.init(val: 13)
        second?.right = TreeNode.init(val: 22)
        
        let thred = root.right
        thred?.left = TreeNode.init(val: 29)
        thred?.right = TreeNode.init(val: 43);
        
        let result = self.p_preorderTravelsal(root: root)
        print("前序遍历的结果\(result)")
    }
    
    @objc func inorderTravelsal()
    {
        //给定二叉树 [28, 16, 30, 13, 22,29，43]
        
       // 结果：[13,16,22,28,29,30,43]
        let root = TreeNode.init(val: 28)
        root.left = TreeNode.init(val: 16)
        root.right = TreeNode.init(val: 30)
        
        let second = root.left
        second?.left = TreeNode.init(val: 13)
        second?.right = TreeNode.init(val: 22)
        
        let thred = root.right
        thred?.left = TreeNode.init(val: 29)
        thred?.right = TreeNode.init(val: 43);
        
        let result = self.p_inorderTravelsal(root: root)
        print("中序遍历的结果\(result)")
    }
    
    //栈的后序遍历
    @objc func postorderTravelsal()
    {
        //给定二叉树 [28, 16, 30, 13, 22,29，43]
        
        // 结果：[13,22,16,29,43,30,28]
        let root = TreeNode.init(val: 28)
        root.left = TreeNode.init(val: 16)
        root.right = TreeNode.init(val: 30)
        
        let second = root.left
        second?.left = TreeNode.init(val: 13)
        second?.right = TreeNode.init(val: 22)
        
        let thred = root.right
        thred?.left = TreeNode.init(val: 29)
        thred?.right = TreeNode.init(val: 43);
        
        let result = self.p_postorderTravelsal(root: root)
        print("后序遍历的结果\(result)")
    }
    
    
    @objc func levelOrder()
    {
        //给定二叉树 [1, 2, 3, 4, 5, 6,7,8]
        
        let root = TreeNode.init(val: 1)
        root.left = TreeNode.init(val: 2)
        root.right = TreeNode.init(val: 3)
        
        let second = root.left
        second?.left = TreeNode.init(val: 4)
        second?.right = TreeNode.init(val: 5)
        
        let thred =  second?.right
        thred?.left = TreeNode.init(val: 7)
        thred?.right = TreeNode.init(val: 8)
        
        let four = second?.left
        four?.left = TreeNode.init(val: 6)
        
    
        let result = self.p_levelOrder(root: root)
        print("设计一棵二叉树\(result)")
    }
    
    
    
    //计算树的最大深度
    func p_maxDepth(root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        return max(p_maxDepth(root: root.left), p_maxDepth(root: root.right)) + 1
    }
    
    
    //判断一棵二叉树是否为二叉查找树
    private func p_isValidBST(root:TreeNode?) -> Bool {
        return helper(node: root, min: nil, max: nil)
    }
    
    private func helper(node: TreeNode?, min: Int?,max:Int?) -> Bool {
        guard let node = node else {
            return true
        }
        //所有右子树节点的值必须大于根几点的值
        if let min = min ,node.val <= min
        {
            return false
        }
        //所有左子树节点的值必须都小于根节点的值
        if let max = max, node.val >= max {
            return false
        }
        
        return helper(node: node.left, min: min, max: node.val) && helper(node: node.right, min: node.val, max: max)
    }
    
    //栈的前序遍历
   private func p_preorderTravelsal(root : TreeNode?) -> [Int] {
        
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root
        
        while !stack.isEmpty || node != nil {
            if node != nil {
                
                res.append(node!.val)
                stack.append(node!)
                node = node!.left
                
            }else{
                node = stack.removeLast().right
            }
        }
        return res
    }
    
    //栈的中序遍历
   private func p_inorderTravelsal(root : TreeNode?) -> [Int] {
        
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root
        
        while !stack.isEmpty || node != nil {
            if node != nil {
                
                stack.append(node!)
                node = node!.left
                
            }else{
                
                res.append(stack.last!.val)
                node =  stack.removeLast().right

            }
        }
        return res
    }
    
    //栈的后序遍历
    private func p_postorderTravelsal(root : TreeNode?) -> [Int] {
        
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root
        
        while !stack.isEmpty || node != nil {
            if node != nil {
                
                stack.append(node!)
                node = node!.left
                
            }else{
                
                res.append(stack.last!.val)
                node =  stack.last!.left
                stack.removeLast()
                
            }
        }
        return res
    }
    
    
    
    private func p_levelOrder(root:TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        //用数组来实现队列
        var queue = [TreeNode]()
        
        if let root = root {
            queue.append(root)
        }
        
        while queue.count > 0 {
            let size = queue.count
            var level = [Int]()
            
            for _ in 0..<size {
                
                let node = queue.removeFirst()
                
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            res.append(level)
            
        }
        return res
    }
    
    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }
    
    func getViewControllerTitle() -> String {
        return TreeNodeTitle
    }
    
    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: TreeNodeHandle.self),
                "problem":[
                    ["title":"定义一个节点","selName":"defineANode"],
                    ["title":"计算二叉树的深度","selName":"maxDepth"],
                    ["title":"判断一个树是否为二叉查找树","selName":"isValidBST"],
                    ["title":"用栈来实现二叉树的前序遍历","selName":"preorderTravelsal"],
                    ["title":"用栈来实现二叉树的中序遍历","selName":"inorderTravelsal"],
                    ["title":"用栈来实现二叉树的后序遍历","selName":"postorderTravelsal"],
                    ["title":"请设计一个可以展示一棵二叉树的App","selName":"levelOrder"],
                
                ]
                ] as [String : Any]
        
        
        return dict as [String : AnyObject]
    }
    

}
