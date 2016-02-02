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
        let action = SKAction.sequence([
            SKAction.scaleTo(1.05, duration: 0.05),
            SKAction.scaleTo(1.0, duration: 0.05)
            ])
        
        let frame = SWFrame()
        let startButton = childNodeWithName("StartButton") as! SKSpriteNode
        startButton.centerRect = CGRect(x: 0.5, y: 0, width: 0.0, height: 1.0)
        frame.addActionForButton(startButton, action: action) { () -> Void in
            print("Start button pressed")
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
            print("SettingButton button pressed")
        }
        addChild(frame)
    }
    
}

