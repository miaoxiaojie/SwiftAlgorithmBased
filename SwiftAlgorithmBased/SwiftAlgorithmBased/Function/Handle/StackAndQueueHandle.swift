//
//  StackAndQueueViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/17.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit


let StackAndQueueTitle = "栈和队列"


class StackAndQueueHandle:
NSObject,
someOneAnswerProtocol {

    
    @objc func simplityPath()
    {
        /*
         例子：路径 /home/ 简化后为/home
         路径是“/a/./b/…/…/c/”,简化后为“/c”
         
         */
        let result = self.p_simplityPath(path: "/a/./b/../../c/")
        print("简化后的路径\(result)")
    
    }
    
    func p_simplityPath(path: String) -> String {
        //用数组来实现栈的功能
        var pathStack = [String]()
        //拆分原路径
        let paths = path.components(separatedBy: "/")
        
        for path in paths {
            //对于.我们直接跳过
            guard path != "." else {
                continue
            }
            
            //对于..使用 pop 操作
            if path == ".." {
                
                if pathStack.count > 0 {
                    pathStack.removeLast()
                }
              //对于空数的特殊情况
            }else if path != "" {
                pathStack.append(path)
            }
            
        }
        
        // 将栈中的内容转化为优化后的内容
        let result = pathStack.reduce("") { (total, dir) in
            return "\(total)/\(dir)"
        }
        // 空路径的结果是“/”
        return result.isEmpty ? "/": result
        
    }
   
    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }
    
    func getViewControllerTitle() -> String {
        return StackAndQueueTitle
    }
    
    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: StackAndQueueHandle.self),
                "problem":[
                    ["title":"给出一个文件路径要求将其简化","selName":"simplityPath"],
                ]
                ] as [String : Any]
        
        
        return dict as [String : AnyObject]
    }
    
    
}
