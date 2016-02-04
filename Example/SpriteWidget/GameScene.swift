//
//  GameScene.swift
//  SpriteWidget
//
//  Created by wangyw on 2/3/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget

class GameScene: SKScene {
    
    let action = SKAction.sequence([
        SKAction.scaleTo(1.05, duration: 0.05),
        SKAction.scaleTo(1.0, duration: 0.05)
        ])
    
    override func didMoveToView(view: SKView) {
        let gameField = childNodeWithName("GameField") as! SKSpriteNode
        gameField.centerRect = CGRect(x: 0.5, y: 0.5, width: 0, height: 0)

        let scorePanel = SWFrame(fileNamed: "ScorePanel")
        let panel = scorePanel.childNodeWithName("Panel") as! SKSpriteNode
        let scale = view.bounds.width / panel.size.width
        let height = view.bounds.height / scale
        scorePanel.position = CGPoint(x: 0, y: height - panel.size.height + (size.height - height) / 2)
        addChild(scorePanel)

        let pauseButton = scorePanel.childNodeWithName("PauseButton") as! SKSpriteNode
        scorePanel.addActionForButton(pauseButton, action: action) { () -> Void in
            self.openSettingsMenu()
        }
    }
    
    private func openSettingsMenu() {
        let frame = SWFrame(fileNamed: "PauseMenu")
        addChild(frame)
        let panel = frame.childNodeWithName("Panel") as! SKSpriteNode
        panel.centerRect = CGRect(x: 0.5, y: 0.5, width: 0, height: 0)
        let shadow = frame.childNodeWithName("Shadow") as! SKSpriteNode
        shadow.centerRect = CGRect(x: 0.5, y: 0.5, width: 0, height: 0)
        let mask = frame.childNodeWithName("Mask") as! SKSpriteNode
        mask.alpha = 0.6
        
        frame.addActionForButtonWithName("CloseButton", action: action) { () -> Void in
            let panelEndPosition = CGPoint(x: panel.position.x, y: self.size.height + shadow.size.height / 2 + panel.position.y - shadow.position.y)
            panel.runAction(SKAction.moveTo(panelEndPosition, duration: 0.2))
            let shadowEndPosition = CGPoint(x: shadow.position.x, y: self.size.height + shadow.size.height / 2)
            shadow.runAction(SKAction.moveTo(shadowEndPosition, duration: 0.2), completion: { () -> Void in
                frame.dismiss()
            })
        }
        
        let panelPosition = panel.position
        panel.position = CGPoint(x: panel.position.x, y: size.height + shadow.size.height / 2 + panel.position.y - shadow.position.y)
        panel.runAction(SKAction.moveTo(panelPosition, duration: 0.2))
        let shadowPosition = shadow.position
        shadow.position = CGPoint(x: shadow.position.x, y: size.height + shadow.size.height / 2)
        shadow.runAction(SKAction.moveTo(shadowPosition, duration: 0.2))
    }
    
}
