//
//  GameScene.swift
//  tactile.motion_v2
//
//  Created by Bridget Johnson on 20/10/15.
//  Copyright (c) 2015 bdj. All rights reserved.
//

import SpriteKit

public var manualIP = String()
public var manualPort = Int()

class GameScene: SKScene {
   
   
   var manual_IP: String = "" {
      didSet {
         manualIP = manual_IP
      }
   }
   
   var manual_Port: String = "" {
      didSet {
         manualPort = Int(manual_Port)!
      }
   }
   
   var newManager = OSCManager()
   var newOutPort = OSCOutPort()
   

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      let background =  SKSpriteNode(imageNamed: "background")
      background.position = CGPoint(x: size.width/2, y: size.height/2)
      background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
      background.zPosition = -1
      addChild(background)
      
      newOutPort = newManager.createNewOutputToAddress(manualIP, atPort:Int32(manualPort), withLabel: "OutPort")
    
      
   }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      sendOSC()
        
   }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
   
   func sendOSC() {
      let newMsg: OSCMessage = OSCMessage(address: "/test")
      newMsg.addFloat(0.3)
      newMsg.addFloat(2.5)
      newOutPort.sendThisMessage(newMsg)
      
   }
}
