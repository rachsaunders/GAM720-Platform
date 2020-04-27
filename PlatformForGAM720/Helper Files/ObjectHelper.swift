//
//  ObjectHelper.swift
//  PlatformForGAM720
//
//  Created by Rachel Saunders on 27/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//
// THIS APP IS SOLELY FOR THE PURPOSE OF ASSIGNMENT 2 FOR GAM720 MODULE AS PART OF THE MASTERS DEGREE FOR CREATIVE APP DEVELOPMENT. ALL PROGRAMMING, NOTES AND ARTWORK BY RACHEL SAUNDERS. THIS IS A TEST TO SEE HOW 2D PLATFORMING WORKS. COPYRIGHT RACHEL SAUNDERS.
//
//
import SpriteKit

class ObjectHelper {
    
    static func handleChild(sprite: SKSpriteNode, with name: String!) {
        
        // "Finish Line"
        // "Enemy"
        switch name {
        case GameConstants.StringConstants.finishLineName, GameConstants.StringConstants.enemyName:
            PhysicsHelper.addPhysicsBody(to: sprite, with: name)
        default:
            break
        }
        
    }
    
}
