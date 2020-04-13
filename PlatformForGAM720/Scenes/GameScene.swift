//
//  GameScene.swift
//  PlatformForGAM720
//
//
//  Created by Rachel Saunders on 08/04/2020.
//  Copyright © 2020 Rachel Saunders. All rights reserved.
//
// THIS APP IS SOLELY FOR THE PURPOSE OF ASSIGNMENT 2 FOR GAM720 MODULE AS PART OF THE MASTERS DEGREE FOR CREATIVE APP DEVELOPMENT. ALL PROGRAMMING, NOTES AND ARTWORK BY RACHEL SAUNDERS. THIS IS A TEST TO SEE HOW 2D PLATFORMING WORKS. COPYRIGHT RACHEL SAUNDERS.
//
//

import SpriteKit

class GameScene: SKScene {
    
    // Variables
    
    var mapNode: SKNode!
    var tileMap: SKTileMapNode!
    
    // Override didMove Function
    
    override func didMove(to view: SKView) {
        load(level: "World1Level1")
    }
    
    
    func load(level: String) {
        if let levelNode = SKNode.unarchiveFromFile(file: level) {
            mapNode = levelNode
            addChild(mapNode)
            loadTileMap()
        }
    }
    
    // scale the map properly on screen
    func loadTileMap() {
        if let exampleTiles = mapNode.childNode(withName: "Example Tiles Map") as? SKTileMapNode {
            tileMap = exampleTiles
            tileMap.scale(to: frame.size, width: false, multiplier: 1.0)
        }
    }
    
    // On the tile map make sure images e.g. trees are child nodes of the floor tiles so they appear

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
