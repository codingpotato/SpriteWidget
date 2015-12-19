//
//  SWLabel.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SWLabel: SKLabelNode {
    
    override func layoutInRect(rect: CGRect) {
        let x = rect.origin.x + rect.width / 2
        let y = rect.origin.y + rect.height / 2 - frame.height / 2 + position.y - frame.origin.y
        position = CGPoint(x: x, y: y)
    }
    
}
