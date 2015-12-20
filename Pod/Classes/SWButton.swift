//
//  SWButton.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SWButton: SWContainer {
    
    private let action: () -> Void
    
    public init(title: String, action: () -> Void) {
        self.action = action
        super.init(texture: nil, color: SKColor(hexString: "#1abc9c"), size: CGSizeZero)
        
        userInteractionEnabled = true
        let label = SWLabel(text: title)
        label.fontColor = SKColor.blackColor()
        addLayout(SWSingleLayout(nodes: [label], insets: SWInsets(inset: 0.1)))
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        runAction(SKAction.sequence([
            SKAction.moveBy(CGVector(dx: size.width / 10, dy: -size.height / 10), duration: 0.05),
            SKAction.moveBy(CGVector(dx: -size.width / 10, dy: size.height / 10), duration: 0.05)
            ]), completion: action)
    }
    
}
