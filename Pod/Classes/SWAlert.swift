//
//  SWAlert.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import SpriteKit

public class SWAlert: SWContainer {
    
    let root: SWContainer
    
    public init(message: String, inScene scene: SKScene) {
        root = SWContainer(color: SKColor.clearColor(), size: scene.size)
        root.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.addChild(root)
        super.init(texture: nil, color: SKColor.blueColor(), size: CGSizeZero)
        
        root.addChildren([self], layout: HorizontalLayout(insets: Insets(left: 0.1, right: 0.1, top: 0.3, bottom: 0.3), spacings: []))
        
        let label = SWLabel(text: message)
        addChildren([label], layout: HorizontalLayout(insets: Insets(left: 0.1, right: 0.1, top: 0.2, bottom: 0.6), spacings: []))
        
        let buttons = [
            SWButton(color: SKColor.greenColor(), size: CGSizeZero),
            SWButton(color: SKColor.brownColor(), size: CGSizeZero),
            SWButton(color: SKColor.redColor(), size: CGSizeZero),
        ]
        addChildren(buttons, layout: HorizontalLayout(insets: Insets(left: 0.1, right: 0.1, top: 0.6, bottom: 0.2), spacings: [0.05]))
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
