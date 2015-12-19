//
//  SpriteWidgetTest.swift
//  SpriteWidget
//
//  Created by wangyw on 12/19/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SpriteKit
import SpriteWidget
import XCTest

class SpriteWidgetTest: XCTestCase {
    
    let CGFLOAT_ACCURACY: CGFloat = 0.0001

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let parentWidth: CGFloat = 800
        let parentHeight: CGFloat = 600
        let parent = SWContainer(color: SKColor.grayColor(), size: CGSize(width: parentWidth, height: parentHeight))
        let widgets = [
            SWContainer(color: SKColor.blueColor(), size: CGSizeZero),
            SWContainer(color: SKColor.blueColor(), size: CGSizeZero),
            SWContainer(color: SKColor.blueColor(), size: CGSizeZero)
        ]
        let leftInset: CGFloat = 0.1
        let rightInset: CGFloat = 0.2
        let topInset: CGFloat = 0.3
        let bottomInset: CGFloat = 0.4
        let spacing: CGFloat = 0.1
        let layout = HorizontalLayout(insets: Insets(left: leftInset, right: rightInset, top: topInset, bottom: bottomInset), spacings: [spacing])
        parent.addChildren(widgets, layout: layout)
        
        XCTAssertEqual(widgets, parent.children)
        let width = parentWidth * (1 - leftInset - rightInset - spacing * CGFloat(widgets.count - 1)) / CGFloat(widgets.count)
        let height = parentHeight * (1 - topInset - bottomInset)
        var x = (leftInset - 0.5) * parentWidth
        let y = (bottomInset - 0.5) * parentHeight
        for widget in widgets {
            XCTAssertEqualWithAccuracy(x + width / 2, widget.position.x, accuracy: CGFLOAT_ACCURACY)
            XCTAssertEqualWithAccuracy(y + height / 2, widget.position.y, accuracy: CGFLOAT_ACCURACY)
            XCTAssertEqualWithAccuracy(width, widget.size.width, accuracy: CGFLOAT_ACCURACY)
            XCTAssertEqualWithAccuracy(height, widget.size.height, accuracy: CGFLOAT_ACCURACY)
            x += width + parentWidth * spacing
        }
    }

}
