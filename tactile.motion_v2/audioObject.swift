//
//  audioObject.swift
//  tactile.motion_v2
//
//  Created by Bridget Johnson on 30/10/15.
//  Copyright © 2015 bdj. All rights reserved.
//

import UIKit
import SpriteKit

class audioObject: SKShapeNode {
   required init?(coder aDecoder: NSCoder) {
      fatalError("ohhhh shiiiiiiiiit")
   }
   
   init(radius: CGFloat) {
      super.init()
      path = CGPathCreateWithEllipseInRect(CGRect(origin: CGPointZero, size: CGSize(width: radius * 2, height: radius * 2)), nil)
      
      self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
      self.physicsBody?.allowsRotation = false
      self.physicsBody?.friction = 0
      self.physicsBody?.restitution = 1
      self.physicsBody?.linearDamping = 0
      self.physicsBody?.angularDamping = 0
      self.physicsBody?.affectedByGravity = false
      self.physicsBody?.dynamic = true


   }
   
   func draggable(pan: UIPanGestureRecognizer) {
      
   }
}
