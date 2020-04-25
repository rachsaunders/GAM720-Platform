//
//  PhysicsHelper.swift
//  PlatformForGAM720
//
//  Created by Rachel Saunders on 25/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//

import SpriteKit

class PhysicsHelper {
    
    static func addPhysicsBody(to sprite: SKSpriteNode, with name: String) {
        
        // Using switch statement to execute multiple conditions
        // specs of the physics node
        
        switch name {
        case 
        GameConstants.StringConstants.playerName:
            sprite.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sprite.size.width/2, height: sprite.size.height))
            sprite.physicsBody!.restitution = 0.0
            sprite.physicsBody!.allowsRotation = false
        default:
            sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        }
        
        
    }
}
