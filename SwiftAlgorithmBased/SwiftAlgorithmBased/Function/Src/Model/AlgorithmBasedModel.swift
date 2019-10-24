//
//  AlgorithmBasedModel.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/10.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class AlgorithmBasedModel: NSObject {
    
    static func getMainRoad() -> NSArray
    {
        
        let classNames = AlgorithmBasedShareData.shared.handleNames
        var titles:[String] = NSMutableArray.init() as! [String]
        
        guard  classNames.count > 0 else {
            return classNames
        }
        
        for className in classNames  {
            let answerProtocol = AlgorithmBasedFactory.init().getJumpViewController(className: className as! String)
            let title = answerProtocol.getViewControllerTitle()
            titles.append(title)
          
        }
        
        return titles as NSArray
    }
    

}
