//
//  ViewController.swift
//  SpriteWidget
//
//  Created by codingpotato on 12/17/2015.
//  Copyright (c) 2015 codingpotato. All rights reserved.
//

import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        let scene = Scene(size: view.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

