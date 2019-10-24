//
//  AlgorithmBasedHandle.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/23.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class AlgorithmBasedHandle: NSObject {
    
    static func getAllHandle()
    {
        AlgorithmBasedConfig.regiserHandle(handle: DataAnswerHandle.self)
        AlgorithmBasedConfig.regiserHandle(handle: TheListViewHandle.self)
        AlgorithmBasedConfig.regiserHandle(handle: StackAndQueueHandle.self)
        AlgorithmBasedConfig.regiserHandle(handle: TreeNodeHandle.self)
        AlgorithmBasedConfig.regiserHandle(handle: SortAndSearchHandle.self)
        AlgorithmBasedConfig.regiserHandle(handle: DepthAndBreadthHandle.self)
    }

}
