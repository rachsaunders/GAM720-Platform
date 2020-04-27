
//
//  GameConstaints.swift
//  PlatformForGAM720
//
//  Created by Rachel Saunders on 16/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//
// THIS APP IS SOLELY FOR THE PURPOSE OF ASSIGNMENT 2 FOR GAM720 MODULE AS PART OF THE MASTERS DEGREE FOR CREATIVE APP DEVELOPMENT. ALL PROGRAMMING, NOTES AND ARTWORK BY RACHEL SAUNDERS. THIS IS A TEST TO SEE HOW 2D PLATFORMING WORKS. COPYRIGHT RACHEL SAUNDERS.
//
//

import Foundation
import CoreGraphics

struct GameConstants {
    
    struct PhysicsCategories {
        static let noCategory: UInt32 = 0
        static let allCategory: UInt32 = UInt32.max
        static let playerCategory: UInt32 = 0x1
        static let groundCategory: UInt32 = 0x1 << 1
        static let finishCategory: UInt32 = 0x1 << 2
        static let collectibleCategory: UInt32 = 0x1 << 3
        static let enemyCategory:UInt32 = 0x1 << 4
        static let grameCategory:UInt32 = 0x1 << 5
        static let ceilingCategory: UInt32 = 0x1 << 6
        
    }
    
    struct ZPositions {
        static let farBGZ: CGFloat = 0
        static let closeBGZ: CGFloat = 1
        static let worldZ: CGFloat = 2
        static let objectZ: CGFloat = 3
        static let playerZ: CGFloat = 4
        static let hudZ: CGFloat = 5
    }
    
    struct StringConstants {
        static let exampleTilesName = "Example Tiles"
        static let worldBackgroundNames = ["exampleBackground", "exampleBackground2"]
        static let playerName = "Player"
        static let playerImageName = "Idle_0"
        
        // Part of physics properties, from file GroundNode.swift
        static let groundNodeName = "GroundNode"
        
        // Player Animations
        static let playerIdleAtlas = "Player Idle Atlas"
        static let playerRunAtlas = "Player Run Atlas"
        static let playerJumpAtlas = "Player Jump Atlas"
        static let playerDieAtlas = "Player Die Atlas"
        
        // The sprite files are called Idle_0, Idle_1 etc
        static let idlePrefixKey = "Idle_"
        static let runPrefixKey = "Run_"
        static let jumpPrefixKey = "Jump_"
        static let diePrefixKey = "Die_"
        
      //  static let exampleNodeName = "Example Nodes"
        
        static let jumpUpActionKey = "JumpUp"
        static let brakeDescendActionKey = "BrakeDescent"
        
    }
    
}
