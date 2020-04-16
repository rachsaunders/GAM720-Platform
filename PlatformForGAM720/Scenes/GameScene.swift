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

// Several gamestates of the game
enum GameState {
    case ready, ongoing, paused, finished
}


class GameScene: SKScene {
    
    // Variables
    
    var worldLayer: Layer!
    var mapNode: SKNode!
    var tileMap: SKTileMapNode!
    
    var lastTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    var gameState = GameState.ready
    
    // Override didMove Function
    
    override func didMove(to view: SKView) {
        
        createLayers()
        
    }
    
    
    func createLayers() {
        worldLayer = Layer()
        addChild(worldLayer)
        worldLayer.layerVelocity = CGPoint(x: -200, y: 0.0)
        
        load(level: "World1Level1")
    }
    
    func load(level: String) {
        if let levelNode = SKNode.unarchiveFromFile(file: level) {
            mapNode = levelNode
            worldLayer.addChild(mapNode)
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
    
    // What happens when screen is touched
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // if gamestate is ready, change it to ongoing
        switch gameState {
        case .ready:
            gameState = .ongoing
        default:
            break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // // / / / / 
    
    
    // On the tile map make sure images e.g. trees are child nodes of the floor tiles so they appear

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if lastTime > 0 {
            dt = currentTime - lastTime
        } else {
            dt = 0
        }
        lastTime = currentTime
        
        if gameState == .ongoing {
            worldLayer.update(dt)
        }
        
    }
}
