//
//  Scene.swift
//  SpriteWidget
//
//  Created by wangyw on 12/19/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget

class Scene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let mask = SpriteWidget(color: SKColor.brownColor(), size: size)
        mask.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(mask)
        
        let panel = SpriteWidget(color: SKColor.blueColor(), size: CGSizeZero)
        mask.addChildren([panel], layout: HorizontalLayout(insets: Insets(inset: 0.3), spacings: []))
    }
    
}
