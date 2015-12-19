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
        let alert = SWAlert(message: "This is a test message", inScene: self)
    }
    
}
