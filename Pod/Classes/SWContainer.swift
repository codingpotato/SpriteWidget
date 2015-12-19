//
//  SWContainer.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SWContainer: SKSpriteNode {

    public func addChildren(nodes: [SKNode], layout: HorizontalLayout) {
        for node in nodes {
            addChild(node)
        }
        layout.layoutNodes(nodes, parent: self)
    }
    
    override func layoutInRect(rect: CGRect) {
        position = CGPoint(x: rect.origin.x + anchorPoint.x * rect.width, y: rect.origin.y + anchorPoint.y * rect.height)
        size = CGSize(width: rect.width, height: rect.height)
    }
    
}
