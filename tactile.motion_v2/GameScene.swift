//
//  GameScene.swift
//  tactile.motion_v2
//
//  Created by Bridget Johnson on 20/10/15.
//  Copyright (c) 2015 bdj. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      let background =  SKSpriteNode(imageNamed: "background")
      background.position = CGPoint(x: size.width/2, y: size.height/2)
      background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
      background.zPosition = -1
      addChild(background)
    
      
   }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
         }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
