//
//  DepthAndBreadthViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/22.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

let DepthAndBreadthTitle = "深度优先搜索和广度优先搜索"

class DepthAndBreadthHandle:
NSObject,
someOneAnswerProtocol {

   

    // MARK: - AnswerProtocol
    func getViewController() -> NSObject {
        return self
    }
    
    func getViewControllerTitle() -> String {
        return DepthAndBreadthTitle
    }
    
    func getAllData() -> [String : AnyObject]  {
        
        let dict =
            [
                "answer":AlgorithmBasedFactory.init().getClassName(classObject: DepthAndBreadthHandle.self),
                "problem":[
                    ["title":"已知很多会议，如果这些会议时间有重叠，则将它们合并","selName":"merge"]
                ]
                ] as [String : Any]
        
        
        return dict as [String : AnyObject]
    }
    

}
