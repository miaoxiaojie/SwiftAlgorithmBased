//
//  AnswerProtocol.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/11.
//  Copyright © 2019 zmm. All rights reserved.
//

import Foundation
import UIKit

protocol someOneAnswerProtocol {
    
    func getViewControllerTitle() -> String
    func getAllData() -> [String : AnyObject]
    func getViewController() -> NSObject
    
}

