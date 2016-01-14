//
//  SWOverlay.swift
//  Pods
//
//  Created by wangyw on 1/13/16.
//
//

import Foundation
import SpriteKit

struct ButtonController {
    
    let buttonNode: SKNode
    let action: SKAction
    let block: () -> Void
    
}

public class SWOverlay: SKNode {
    
    private var buttons: [ButtonController] = []
    
    public override init() {
        super.init()
        userInteractionEnabled = true
    }
    
    public convenience init(fileName: String) {
        self.init()
        
        if let scene = SKScene(fileNamed: fileName) {
            for node in scene.children {
                node.removeFromParent()
                addChild(node)
            }
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addActionForButtonWithName(buttonName: String, action: SKAction, block: () -> Void) {
        let buttonNode = childNodeWithName(".//\(buttonName)")!
        buttons.append(ButtonController(buttonNode: buttonNode, action: action, block: block))
    }
    
    public func addActionForButton(buttonNode: SKNode, action: SKAction, block: () -> Void) {
        buttonNode.removeFromParent()
        addChild(buttonNode)
        buttons.append(ButtonController(buttonNode: buttonNode, action: action, block: block))
    }
    
    public func dismiss() {
        removeFromParent()
    }
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            for node in nodesAtPoint(touch.locationInNode(self)) {
                for buttonController in buttons {
                    if node == buttonController.buttonNode {
                        node.runAction(buttonController.action)
                        buttonController.block()
                    }
                }
                
            }
        }
    }
    
}
