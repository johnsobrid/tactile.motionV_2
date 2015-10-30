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
   var  colourPallete: [UIColor] = []
   var objectArray: [SKShapeNode] = []
   var objectActive: [Bool] = [false,false,false,false,false,false,false,false]
   

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      let background =  SKSpriteNode(imageNamed: "background")
      background.position = CGPoint(x: size.width/2, y: size.height/2)
      background.anchorPoint = CGPoint(x: 0.5, y: 0.5) // default
      background.zPosition = -1
      addChild(background)
      
      newOutPort = newManager.createNewOutputToAddress(manualIP, atPort:Int32(manualPort), withLabel: "OutPort")
      makeObjectColour()
      initObjects()  
      
   }
   func initObjects() {
      
      let boxWidth: Float = 125
      let gapWidth: Float =  175
    
      for i in 0...7 {
         let object = SKShapeNode(circleOfRadius: 75)
         object.position = CGPointMake(CGFloat(gapWidth * Float(i) + gapWidth), CGFloat(boxWidth))
         object.fillColor = colourPallete[i]
         object.strokeColor = SKColor.clearColor()
         let newString = "audioObject\(i)"
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
      let touch = touches.first! as UITouch
      let touchLocation = touch.locationInNode(self)
      let touchedNode = self.nodeAtPoint(touchLocation)
      
      if let name = touchedNode.name
      {
         for i in 0...7 {
         let newString = "audioObject\(i)"
            if name == newString {
               objectActive[i] = true
            }
         }
      }
   }
   
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      for i in 0...7 {
         if objectActive[i] {
            let touch = touches.first! as UITouch
            let touchLoaction = touch.locationInNode(self)
            let previousLocation = touch.previousLocationInNode(self)
            
            if let object = childNodeWithName("audioObject\(i)") as? SKShapeNode {
               let objectX = object.position.x + (touchLoaction.x - previousLocation.x)
               let objectY = object.position.y + (touchLoaction.y - previousLocation.y)
               
               object.position = CGPointMake(objectX, objectY)

            }
         }
      }
   }
   
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      let touch = touches.first! as UITouch
      let touchLocation = touch.locationInNode(self)
      let touchedNode = self.nodeAtPoint(touchLocation)
      
      if let name = touchedNode.name
      {
         for i in 0...7 {
            let newString = "audioObject\(i)"
            if name == newString {
               objectActive[i] = false
            }
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
