//
//  QueueProtocol.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/17.
//  Copyright © 2019 zmm. All rights reserved.
//

import Foundation


protocol Queue {
    
    //持有元素
    associatedtype Element
    
    //是否为空
    var isEmpty: Bool { get }
    
    //队列的大小
    var size: Int { get }
    
    //对首元素
    var peek: Element? { get }
    
    //入队
    mutating func enqueue (_ newElement: Element)
    
    //出队
    mutating func dequeue() -> Element?
    
}
