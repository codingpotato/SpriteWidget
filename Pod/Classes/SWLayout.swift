//
//  SWLayout.swift
//  Pods
//
//  Created by wangyw on 12/20/15.
//
//

import SpriteKit

public struct SWInsets {
    
    private let left: CGFloat
    private let right: CGFloat
    private let top: CGFloat
    private let bottom: CGFloat
    
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

public class SWLayout {
    
    private var nodes: [SKNode]
    
    init(nodes: [SKNode]) {
        self.nodes = nodes
    }
    
    func addNodesIntoParent(parent: SWContainer) {
        for node in nodes {
            parent.addChild(node)
        }
    }
    
    func layout() {}
    
}

public class SWSingleLayout: SWLayout {
    
    private let insets: SWInsets
    
    public convenience init(node: SKNode, insets: SWInsets) {
        self.init(nodes: [node], insets: insets)
    }
    
    init(nodes: [SKNode], insets: SWInsets) {
        self.insets = insets
        super.init(nodes: nodes)
    }
    
    override func layout() {
        assert(nodes.count == 1)
        let parent = nodes[0].parent as! SWContainer
        nodes[0].layoutInRect(boundsOfParent(parent))
    }
    
    private func boundsOfParent(parent: SWContainer) -> CGRect {
        let x = parent.frame.width * insets.left
        let y = parent.frame.height * insets.bottom
        let width = parent.frame.width * (1 - insets.left - insets.right)
        let height = parent.frame.height * (1 - insets.top - insets.bottom)
        let bounds = CGRect(x: x, y: y, width: width, height: height)
        return bounds.offsetBy(dx: parent.frame.origin.x - parent.position.x, dy: parent.frame.origin.y - parent.position.y)
    }
    
}

public class SWHorizontalLayout: SWSingleLayout {
    
    private let spacings: [CGFloat]
    
    public init(nodes: [SKNode], insets: SWInsets, spacings: [CGFloat]) {
        self.spacings = spacings
        super.init(nodes: nodes, insets: insets)
    }
    
    override func layout() {
        assert(nodes.count > 0)
        let parent = nodes[0].parent as! SWContainer
        let bounds = boundsOfParent(parent)
        var totalSpacing: CGFloat = 0
        for index in 0..<nodes.count - 1 {
            totalSpacing += spacings[index % spacings.count]
        }
        var x = bounds.origin.x
        let width = (bounds.width - totalSpacing * parent.size.width) / CGFloat(nodes.count)
        for index in 0..<nodes.count {
            let node = nodes[index]
            node.layoutInRect(CGRect(x: x, y: bounds.origin.y, width: width, height: bounds.height))
            x += width + parent.size.width * spacings[index % spacings.count]
        }
    }
    
}
