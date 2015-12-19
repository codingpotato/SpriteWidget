//
//  HorizontalLayout.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

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
    
    func layoutWidgets(widgets: [SpriteWidget], parent: SpriteWidget) {
        var totalSpacing: CGFloat = 0
        for index in 0..<widgets.count - 1 {
            totalSpacing += spacings[index % spacings.count]
        }
        let width = parent.size.width * (1 - insets.left - insets.right - totalSpacing)
        let height = parent.size.height * (1 - insets.top - insets.bottom)
        var x = (insets.left - parent.anchorPoint.x) * parent.size.width
        let y = (insets.bottom - parent.anchorPoint.y) * parent.size.height
        for index in 0..<widgets.count {
            let widget = widgets[index]
            widget.position = CGPoint(x: x + widget.anchorPoint.x * width, y: y + widget.anchorPoint.y * height)
            widget.size = CGSize(width: width, height: height)
            x += width + parent.size.width * spacings[index % spacings.count]
        }
    }
    
}
