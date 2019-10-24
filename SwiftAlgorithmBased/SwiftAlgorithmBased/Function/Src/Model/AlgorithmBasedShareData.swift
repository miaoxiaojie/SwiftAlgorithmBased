//
//  AlgorithmBasedShareData.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/23.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

fileprivate let sharedInstance = AlgorithmBasedShareData()

class AlgorithmBasedShareData: NSObject {
    //单利
    static var shared: AlgorithmBasedShareData {
        return sharedInstance
    }
    
    public var handleNames = NSMutableArray.init()
    
    fileprivate override init() { }
}
