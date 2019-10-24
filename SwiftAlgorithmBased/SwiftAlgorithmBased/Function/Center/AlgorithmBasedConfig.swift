//
//  AlgorithmBasedConfig.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/23.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class AlgorithmBasedConfig: NSObject {
    
    static func regiserHandle(handle: AnyClass) {
        AlgorithmBasedCenter.registerHandleObject(handle: handle)
    }

}
