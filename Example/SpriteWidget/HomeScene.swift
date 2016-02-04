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
    
    let action = SKAction.sequence([
        SKAction.scaleTo(1.05, duration: 0.05),
        SKAction.scaleTo(1.0, duration: 0.05)
        ])
    
    override func didMoveToView(view: SKView) {
        let frame = SWFrame()
        let startButton = childNodeWithName("StartButton") as! SKSpriteNode
        startButton.centerRect = CGRect(x: 0.5, y: 0, width: 0, height: 1)
        frame.addActionForButton(startButton, action: action) { () -> Void in
            let gameScene = GameScene(fileNamed: "GameScene")!
            gameScene.scaleMode = .AspectFill
            self.view!.presentScene(gameScene, transition: SKTransition.pushWithDirection(.Up, duration: 0.5))
        }
        let rateButton = childNodeWithName("RateButton") as! SKSpriteNode
        frame.addActionForButton(rateButton, action: action) { () -> Void in
            print("Rate button pressed")
        }
        let leaderboardButton = childNodeWithName("LeaderboardButton") as! SKSpriteNode
        frame.addActionForButton(leaderboardButton, action: action) { () -> Void in
            print("Leaderboard button pressed")
        }
        let settingButton = childNodeWithName("SettingButton") as! SKSpriteNode
        frame.addActionForButton(settingButton, action: action) { () -> Void in
            self.openSettingsMenu()
        }
        addChild(frame)
    }
    
    private func openSettingsMenu() {
        let frame = SWFrame(fileNamed: "SettingsMenu")
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

