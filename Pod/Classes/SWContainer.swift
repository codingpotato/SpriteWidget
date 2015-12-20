//
//  SWContainer.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SWContainer: SKSpriteNode {
    
    private var layouts: [SWLayout] = []

    public func addLayout(layout: SWLayout) {
        layouts.append(layout)
        layout.addNodesIntoParent(self)
    }
    
    public override func layoutInRect(rect: CGRect) {
        position = CGPoint(x: rect.origin.x + anchorPoint.x * rect.width, y: rect.origin.y + anchorPoint.y * rect.height)
        size = CGSize(width: rect.width, height: rect.height)
        for layout in layouts {
            layout.layout()
        }
    }
    
}
