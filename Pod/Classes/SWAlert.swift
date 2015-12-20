//
//  SWAlert.swift
//  Pods
//
//  Created by wangyw on 12/19/15.
//
//

import DynamicColor
import SpriteKit

public class SWAlert: SWContainer {
    
    private let screen = SWScreen(color: SKColor.clearColor(), size: CGSizeZero)
    
    public init(message: String) {
        super.init(texture: nil, color: SKColor(hexString: "#34495e"), size: CGSizeZero)
        
        screen.addLayout(SWSingleLayout(node: self, insets: SWInsets(left: 0.1, right: 0.1, top: 0.3, bottom: 0.3)))

        let label = SWLabel(text: message)
        addLayout(SWSingleLayout(node: label, insets: SWInsets(left: 0.1, right: 0.1, top: 0.2, bottom: 0.6)))
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addButtons(buttons: [SWButton]) {
        addLayout(SWHorizontalLayout(nodes: buttons, insets: SWInsets(left: 0.1, right: 0.1, top: 0.6, bottom: 0.2), spacings: [0.05]))
    }
    
    public func presentInScene(scene: SKScene) {
        scene.addChild(screen)
        screen.layoutInRect(scene.frame)
    }
    
    public func dismiss() {
        screen.removeFromParent()
    }

}
