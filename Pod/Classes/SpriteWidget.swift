//
//  SpriteWidget.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SpriteWidget: SKSpriteNode {
    
    public func addChildren(widgets: [SpriteWidget], layout: HorizontalLayout) {
        for widget in widgets {
            addChild(widget)
        }
        layout.layoutWidgets(widgets, parent: self)
    }
    
}
