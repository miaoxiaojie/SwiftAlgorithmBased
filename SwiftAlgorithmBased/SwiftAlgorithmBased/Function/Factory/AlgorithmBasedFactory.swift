//
//  AlgorithmBasedFactory.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/11.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class AlgorithmBasedFactory: NSObject {
    
    /// 通过类名创建类
    ///
    /// - Parameter className: 类名
    /// - Returns: 类遵循的协议
    func getJumpViewController(className:String) -> someOneAnswerProtocol {
        //1.这是获取命名空间
        guard let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String else {
           return DataAnswerHandle.init()
        }
        //2.命名空间和类名拼接
        let className = name + "." + className
        //3.转化为类
        let objectClass:AnyClass?  = NSClassFromString(className)
        //4.swift 中通过class创建一个对象必须告诉系统class类型
        guard let classType = objectClass as? NSObject.Type else {
            return DataAnswerHandle.init()
        }
        //4.通过Class创建对象
        let handleObject = classType.init()
        return handleObject as! someOneAnswerProtocol
    }
    
    /// 根据类获取类名
    ///
    /// - Parameter class: 类
    /// - Returns: 类名
    func getClassName(classObject: AnyClass) -> String {
        
        let className = NSStringFromClass(classObject)
        guard  className.contains(".") else {
            return className
        }
        return className.components(separatedBy: ".")[1]
        
    }
}
