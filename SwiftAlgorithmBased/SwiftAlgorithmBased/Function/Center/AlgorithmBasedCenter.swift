//
//  AlgorithmBasedCenter.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/23.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class AlgorithmBasedCenter: NSObject {
  
    static func registerHandleObject(handle: AnyClass) {
        let centerData = AlgorithmBasedShareData.shared
        let className = AlgorithmBasedFactory.init().getClassName(classObject: handle)
        centerData.handleNames.add(className)
    }
    
    static func findClassInfoTitle(title:String) -> someOneAnswerProtocol {
        let classNames = AlgorithmBasedShareData.shared.handleNames
        var handel:someOneAnswerProtocol?
        
        for className in classNames  {
            let answerProtocol = AlgorithmBasedFactory.init().getJumpViewController(className: className as! String)
            let titleStr = answerProtocol.getViewControllerTitle()
            if titleStr == title {
                handel = answerProtocol
            }
        }
        return handel!
    }
    
}
