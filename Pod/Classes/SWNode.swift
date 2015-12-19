//
//  SWNode.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

protocol SWNode {
    
    func layoutInRect(rect: CGRect)
    
}

extension SKNode: SWNode {
    
    func layoutInRect(rect: CGRect) {
    }
    
}
