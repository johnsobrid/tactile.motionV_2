//
//  GameViewController.swift
//  tactile.motion_v2
//
//  Created by Bridget Johnson on 20/10/15.
//  Copyright (c) 2015 bdj. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
   
   var manual_IP: String = "" {
      didSet {
         
      }
   }
   
   var manual_Port: String = "" {
      didSet {
         
      }
   }

   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let scene = GameScene(size:CGSize(width: 1536, height: 2048))
      // Configure the view.
      let skView = self.view as! SKView
      skView.showsFPS = false
      skView.showsNodeCount = false
      
      /* Sprite Kit applies additional optimizations to improve rendering performance */
      skView.ignoresSiblingOrder = true
      
      /* Set the scale mode to scale to fit the window */
      scene.scaleMode = .AspectFill
      scene.manual_IP = manual_IP
      scene.manual_Port = manual_Port
      
      skView.presentScene(scene)
      
   }
   override func prefersStatusBarHidden() -> Bool {
      return true
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
