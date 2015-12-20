//
//  SWLayoutTests.swift
//  SpriteWidget
//
//  Created by wangyw on 12/20/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget
import XCTest

class SWLayoutTests: XCTestCase {

    let CGFLOAT_ACCURACY: CGFloat = 0.0001
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testBoundsOfParent() {
        let parentWidth: CGFloat = 800
        let parentHeight: CGFloat = 600
        let leftInset: CGFloat = 0.1
        let rightInset: CGFloat = 0.2
        let topInset: CGFloat = 0.3
        let bottomInset: CGFloat = 0.4
        let parent = SWContainer(color: SKColor.grayColor(), size: CGSizeZero)
        let child = SWContainer(color: SKColor.redColor(), size: CGSizeZero)
        let layout = SWSingleLayout(node: child, insets: SWInsets(left: leftInset, right: rightInset, top: topInset, bottom: bottomInset))
        parent.addLayout(layout)
        parent.layoutInRect(CGRect(x: 0, y: 0, width: parentWidth, height: parentHeight))
        XCTAssertEqualWithAccuracy(parentWidth * (leftInset - 0.5), child.frame.origin.x, accuracy: CGFLOAT_ACCURACY)
        XCTAssertEqualWithAccuracy(parentHeight * (bottomInset - 0.5), child.frame.origin.y, accuracy: CGFLOAT_ACCURACY)
        XCTAssertEqualWithAccuracy(parentWidth * (1 - leftInset - rightInset), child.frame.width, accuracy: CGFLOAT_ACCURACY)
        XCTAssertEqualWithAccuracy(parentHeight * (1 - topInset - bottomInset), child.frame.height, accuracy: CGFLOAT_ACCURACY)
    }

}
