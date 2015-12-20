//
//  SWScreen.swift
//  Pods
//
//  Created by wangyw on 12/20/15.
//
//

import SpriteKit

class SWScreen: SWContainer {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
