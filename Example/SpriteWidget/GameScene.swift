//
//  GameScene.swift
//  SpriteWidget
//
//  Created by wangyw on 2/3/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let gameField = childNodeWithName("GameField") as! SKSpriteNode
        gameField.centerRect = CGRect(x: 0.5, y: 0.5, width: 0, height: 0)
    }
    
}
