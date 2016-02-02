//
//  HomeScene.swift
//  SpriteWidget
//
//  Created by wangyw on 12/19/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget

class HomeScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let startButton = childNodeWithName("StartButton") as! SKSpriteNode
        startButton.centerRect = CGRect(x: 0.5, y: 0, width: 0.0, height: 1.0)
    }
    
}

