//
//  RepeatingBackground.swift
//  PlatformForGAM720
//
//  Created by Rachel Saunders on 16/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//
// THIS APP IS SOLELY FOR THE PURPOSE OF ASSIGNMENT 2 FOR GAM720 MODULE AS PART OF THE MASTERS DEGREE FOR CREATIVE APP DEVELOPMENT. ALL PROGRAMMING, NOTES AND ARTWORK BY RACHEL SAUNDERS. THIS IS A TEST TO SEE HOW 2D PLATFORMING WORKS. COPYRIGHT RACHEL SAUNDERS.
//
//

import SpriteKit

// THERE ARE TWO BACKGROUND IMAGES

class RepeatingBackground: Layer {
    
    override func updateNodes(_ delta: TimeInterval, childNode: SKNode) {
           if let node = childNode as? SKSpriteNode {
               if node.position.x <= -(node.size.width) {
                   if node.name == "0" && self.childNode(withName: "1") != nil || node.name == "1" && self.childNode(withName: "0") != nil {
                       node.position = CGPoint(x: node.position.x + node.size.width*2, y: node.position.y)
                }
            }
        }
}

}
