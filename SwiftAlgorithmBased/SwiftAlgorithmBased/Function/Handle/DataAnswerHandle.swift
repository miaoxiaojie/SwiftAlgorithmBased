//
//  DataAnswerViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/11.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit


let DataAnswerTitle = "基本的数据结构"

//用数组实现栈
class stack {
    var stack:[AnyObject]
    var isEmpty:Bool{
        return stack.isEmpty
    }
    var peek:AnyObject?{
        return stack.last
    }
    init() {
        stack = [AnyObject]()
    }
    
    func push(object:AnyObject) -> AnyObject  {
        return stack.append(object) as AnyObject
    }
    
    func pop() -> AnyObject? {
        if (!isEmpty) {
            return stack.removeLast()
        }else{
            return nil
        }
    }
}

class DataAnswerHandle:
    NSObject,
someOneAnswerProtocol {
    //可以被修改的数组
    var nums = [3,2,1]
    
    
    @objc func declareAnarrayThatCanNotBeModified ()
    {
        let nums = [1,2,3]
        print("声明一个不可被修改的数组\(nums)")
    }
    
    @objc func declareAnarrayThatCanBeModified ()
    {
        print("声明一个可以被修改的数组\(nums)")
    }
    
    @objc func addElement()
    {
        nums.append(4)
        print("增加一个元素\(nums)")
    }
    
    @objc func ascendingArray()
    {
        nums.sort()
        print("数组升序\(nums)")
    }
    
    @objc func descendingOrderArray()
    {
        nums.sort(by:>)
        print("数组降序\(nums)")
    }
    
    @objc func toImplementTheStack()
    {
        let stakctObject = stack.init()
        
        let stackAnser =  stakctObject.push(object: "入栈" as AnyObject)
        print("实现栈\(stackAnser)")
        
    }
    
    @objc func creatNewArray()
    {
        let anotherNums = Array(nums[0 ..< nums.count - 1])
         print("将数组除最后一个外的所有元素复制给另外一个数组\(anotherNums)")
        
    }
    
    @objc func twoSum()
    {
        let result =  self.p_twoSum(nums: [4,2,6,8,9,10,1,2,7], target: 8)
        print("结果值\(result)")
    }
    
    @objc func twoSumOnly()
    {
        let result =  self.p_twoSumOnly(nums: [4,6,9,10,2,1,7], target: 8)
        print("结果值\(result)")
    }
    
    @objc func isStrNmu()
    {
        let result = self.p_isStrNum(str: "2113")
         print("字符串是否由数字构成\(result)")
        
    }
    
    @objc func sortStr()
    {
        let result = self.p_sortStr(str: "aUfdh")
        print("字符串按字母排序\(result)")
    }
    
    @objc func reverseString()
    {
        //比如 如果是 "hello" 那么反转后的结果就是 “olleh”
        let result = self.p_reverseString(s: "hello")
         print("字符串反转原字符串：[hello]结果\(result)")
    }
    
    @objc func reverseWords()
    {
        //比如 如果是 " the sky blue" 那么反转后的结果就是 “blue is sky the”
        let result = self.p_reverseWords(words: "the sky is blue")
        print("字符串单词反转：[the sky is blue]结果\(result)")
    }
   
    // MARK: - 私有方法
    private func p_twoSum(nums: [Int], target: Int) -> Bool
    {
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(target - num){
                return true
            }
            set.insert(num)
        }
        return false
    }
    
    private func p_twoSumOnly(nums: [Int], target: Int) -> [Int]
    {
        var dict = [Int : Int]()
        
        for (i,num) in nums.enumerated() {
            if let lastindex = dict[target - num]{
                return [lastindex ,i]
            }else{
                dict[num] = i
            }
        }
        fatalError("No valid output")
    }
    
    private func p_isStrNum(str : String) ->Bool
    {
        return Int(str) != nil
    }
    
    private func p_sortStr(str: String) ->String
    {
        return String(str.sorted())
    }
    
    private func p_reverseString(s:String) -> String {
       return String(s.reversed())
    }
    
    private func p_reverseWords(words: String) -> String {
        
        let wordsArr:Array = words.components(separatedBy: " ")
        let reverArray = NSMutableArray.init()
        
        for i in (0..<wordsArr.count).reversed(){
            
            let str:String = wordsArr[i]
            
            reverArray.add(str)
        }
        let result:[String] = reverArray as! Array
        
        return result.joined(separator: "  ")
    }
   
    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }

    
    func getViewControllerTitle() -> String {
        return DataAnswerTitle
    }
    
    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: DataAnswerHandle.self),
                "problem":[
                    ["title":"声明一个不可修改的数组","selName":"declareAnarrayThatCanNotBeModified"],
                    ["title":"声明一个可以被修改的数组","selName":"declareAnarrayThatCanBeModified"],
                    ["title":"增加一个元素","selName":"addElement"],
                    ["title":"数组进行升序","selName":"ascendingArray"],
                    ["title":"数组进行降序","selName":"descendingOrderArray"],
                    ["title":"实现栈","selName":"toImplementTheStack"],
                    ["title":"将数组除最后一个外的所有元素复制给另外一个数组","selName":"creatNewArray"],
                    ["title":"整形数组和一个目标值，判断数组中是否有两个数之和等于目标值","selName":"twoSum"],
                    ["title":"给定一个整型数组有且仅有两个数之和等于目标值求两个数在数组中的序号","selName":"twoSumOnly"],
                    ["title":"检测字符串是否是由数字构成","selName":"isStrNmu"],
                    ["title":"字符串按字母排序（不考虑大小写）","selName":"sortStr"],
                    ["title":"字符串反转","selName":"reverseString"],
                    ["title":"把一个字符串按照单词的顺序进行反转","selName":"reverseWords"]
                    
                ]
                ] as [String : Any]
            
        
        return dict as [String : AnyObject]
    }
    
}
