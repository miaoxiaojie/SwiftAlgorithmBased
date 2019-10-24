//
//  StackProtocol.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/17.
//  Copyright © 2019 zmm. All rights reserved.
//

import Foundation
import UIKit

protocol Stack {
    
    //持有元素
    associatedtype Element
    
    //是否为空
    var isEmpty: Bool { get }
    
    //栈的大小
    var size: Int { get }
    
    //栈顶元素
    var peek: Element? { get }
    
    //进栈
    mutating func push (_ newElement: Element)
    
    //出栈
    mutating func pop() -> Element?
    
}
