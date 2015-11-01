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

class GameScene: SKScene, SKPhysicsContactDelegate {
   let objectCategory : UInt32 = 0x01 << 0
   let controlAreaCategory : UInt32 = 0x01 << 1
   
   
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
   var  colourPallete: [UIColor] = []
   var objectArray: [SKShapeNode] = []
   var selectedObjects = [UITouch:SKShapeNode]()
   

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      let background =  SKSpriteNode(imageNamed: "background")
      background.position = CGPoint(x: size.width/2, y: size.height/2)
      background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
      background.zPosition = -1
      addChild(background)
      
      //set up physics
      physicsWorld.gravity = CGVectorMake(0,-6.8)
      physicsWorld.contactDelegate = self
      
      
      newOutPort = newManager.createNewOutputToAddress(manualIP, atPort:Int32(manualPort), withLabel: "OutPort")
      makeObjectColour()
      initObjects()  
      
   }
   func initObjects() {
      
      let boxWidth: Float = 125
      let gapWidth: Float =  180
    
      for i in 0...7 {
         let object: audioObject = audioObject(radius: 75)
         object.position = CGPointMake(CGFloat(gapWidth * Float(i)+30), CGFloat(boxWidth*0.5))
         object.fillColor = colourPallete[i]
         object.strokeColor = SKColor.clearColor()
         let newString = "audioObject"
         object.name = newString
         addChild(object)
         objectArray.append(object)
      }
      
   }
   func makeObjectColour() {
     
      let colourOne = UIColor(red:67/255.0, green:245/255.0, blue:86/255.0, alpha:0.6)
      colourPallete.append(colourOne)
      let colourTwo = UIColor(red:211/255.0, green:81/255.0, blue:81/255.0, alpha:0.6)
      colourPallete.append(colourTwo)
      let colourThree = UIColor(red:48/255.0, green:118/255.0, blue:191/255.0, alpha:0.6)
       colourPallete.append(colourThree)
      let colourFour = UIColor(red: 143/255.0, green: 79/255.0, blue: 229/255.0, alpha: 0.6)
      colourPallete.append(colourFour)
      let colourFive = UIColor(red: 240/255.0, green: 229/255.0, blue: 22/255.0, alpha: 0.6)
      colourPallete.append(colourFive)
      let colourSix = UIColor(red: 75/255.0, green: 142/255.0, blue: 72/255.0, alpha: 0.6)
      colourPallete.append(colourSix)
      let colourSeven = UIColor(red: 201/255.0, green: 43/255.0, blue: 93/255.0, alpha: 0.6)
      colourPallete.append(colourSeven)
      let colourEight = UIColor(red: 15/255.0, green: 206/255.0, blue: 205/255.0, alpha: 0.6)
      colourPallete.append(colourEight)
      
   }
 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      for touch in touches {
         let location = touch.locationInNode(self)
         if let node = self.nodeAtPoint(location) as? SKShapeNode {
            // Assumes sprites are named "sprite"
            if (node.name == "audioObject") {
               selectedObjects[touch] = node
            }
         }
      }
   }
   
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      for touch in touches {
         let location = touch.locationInNode(self)
         // Update the position of the sprites
         if let node = selectedObjects[touch] {
            node.position.x = (location.x - (node.frame.size.width)/2)
            node.position.y = (location.y - (node.frame.size.height)/2)

         }
      }
   }
   
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      for touch in touches {
         if selectedObjects[touch] != nil {
            selectedObjects[touch] = nil
         }
      }
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
