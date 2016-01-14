//
//  MainScene.swift
//  SpriteWidget
//
//  Created by wangyw on 12/19/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget

class MainScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let overlay = SWOverlay()
        addChild(overlay)
        let action1 = SKAction.sequence([
            SKAction.scaleTo(1.2, duration: 0.1),
            SKAction.scaleTo(1.0, duration: 0.1)
            ])
        let action2 = SKAction.sequence([
            SKAction.moveByX(10, y: -10, duration: 0.1),
            SKAction.moveByX(-10, y: 10, duration: 0.1),
            ])
        overlay.addActionForButton(childNodeWithName("FacebookButton")!, action: action1) { () -> Void in
            let menuOverlay = SWOverlay(fileName: "Menu")
            menuOverlay.zPosition = 100
            self.addChild(menuOverlay)
            menuOverlay.addActionForButtonWithName("GameCenterButton", action: action2, block: { () -> Void in
                menuOverlay.dismiss()
            })
        }
        overlay.addActionForButton(childNodeWithName("TwitterButton")!, action: action1) { () -> Void in
        }
    }
    
}

