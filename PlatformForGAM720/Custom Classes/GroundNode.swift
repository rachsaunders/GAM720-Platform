//
//  GroundNode.swift
//  PlatformForGAM720
//
//  Created by Rachel Saunders on 25/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//
// THIS APP IS SOLELY FOR THE PURPOSE OF ASSIGNMENT 2 FOR GAM720 MODULE AS PART OF THE MASTERS DEGREE FOR CREATIVE APP DEVELOPMENT. ALL PROGRAMMING, NOTES AND ARTWORK BY RACHEL SAUNDERS. THIS IS A TEST TO SEE HOW 2D PLATFORMING WORKS. COPYRIGHT RACHEL SAUNDERS.
//
//

import SpriteKit

class GroundNode: SKSpriteNode {

    var isBodyActivated: Bool = false {
        didSet {
            // if player is below platform, removes physics body
            physicsBody = isBodyActivated ? activatedBody : nil
        }
    }
    
    // private var I only want it accessed within this file
    private var activatedBody: SKPhysicsBody?
    
    init(with size: CGSize) {
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        
        // This is for edges of the ledges which aren't on this example.
        let bodyInitialPoint = CGPoint(x: 0.0, y: size.height)
        let bodyEndPoint = CGPoint(x: size.width, y: size.height)
        
        activatedBody = SKPhysicsBody(edgeFrom: bodyInitialPoint, to: bodyEndPoint)
        activatedBody!.restitution = 0.0
        
        physicsBody = isBodyActivated ? activatedBody : nil
        
        name = GameConstants.StringConstants.groundNodeName
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
