//
//  HorizontalLayout.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public struct Insets {
    
    let left: CGFloat
    let right: CGFloat
    let top: CGFloat
    let bottom: CGFloat
    
    public init(inset: CGFloat) {
        left = inset
        right = inset
        top = inset
        bottom = inset
    }
    
    public init(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
    }
    
}

public struct HorizontalLayout {
    
    let insets: Insets
    let spacings: [CGFloat]
    
    public init(insets: Insets, spacings: [CGFloat]) {
        self.insets = insets
        self.spacings = spacings.count > 0 ? spacings : [0]
    }
    
    func layoutNodes(nodes: [SKNode], parent: SWContainer) {
        var totalSpacing: CGFloat = 0
        for index in 0..<nodes.count - 1 {
            totalSpacing += spacings[index % spacings.count]
        }
        let width = parent.size.width * (1 - insets.left - insets.right - totalSpacing) / CGFloat(nodes.count)
        let height = parent.size.height * (1 - insets.top - insets.bottom)
        var x = (insets.left - parent.anchorPoint.x) * parent.size.width
        let y = (insets.bottom - parent.anchorPoint.y) * parent.size.height
        for index in 0..<nodes.count {
            let node = nodes[index]
            node.layoutInRect(CGRect(x: x, y: y, width: width, height: height))
            x += width + parent.size.width * spacings[index % spacings.count]
        }
    }
    
}
