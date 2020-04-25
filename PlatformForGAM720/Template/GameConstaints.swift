
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
              static let exampleNodeName = "Example Nodes"
              
              static let playerIdleAtlas = "Player Idle Atlas"
              static let playerRunAtlas = "Player Run Atlas"
              static let playerJumpAtlas = "Player Jump Atlas"
              static let playerDieAtlas = "Player Die Atlas"
    }
    
}
