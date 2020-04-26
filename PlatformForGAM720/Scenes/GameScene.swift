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
    var backgroundLayer: RepeatingBackground!
    var mapNode: SKNode!
    var tileMap: SKTileMapNode!
    
    var lastTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    var gameState = GameState.ready {
        willSet {
            switch newValue {
            case .ongoing:
                player.state = .running
            case .finished:
                player.state = .idle
            default:
                break // no default is needed
            }
        }
    }
    
    var player: Player!
    
    // Override didMove Function
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -6.0)
        
        
        createLayers()
        
//        // HOPING THIS FIXES THE ERROR/BUG OF SPRITE NOT RUNNING
//        isPaused = true
//        isPaused = false 
        
    }
    
    
    func createLayers() {
        worldLayer = Layer()
        
        // Set positions
        worldLayer.zPosition = GameConstants.ZPositions.worldZ
        
        addChild(worldLayer)
        worldLayer.layerVelocity = CGPoint(x: -200, y: 0.0)
        
        backgroundLayer = RepeatingBackground()
        
        // Set positions
        backgroundLayer.zPosition = GameConstants.ZPositions.farBGZ
        
        addChild(backgroundLayer)
        
        
        // background
        for i in 0...1 {
            let backgroundImage = SKSpriteNode(imageNamed: GameConstants.StringConstants.worldBackgroundNames[0])
            backgroundImage.name = String(i)
            backgroundImage.scale(to: frame.size, width: false, multiplier: 1.0)
            // start in bottom corner
            backgroundImage.anchorPoint = CGPoint.zero
            backgroundImage.position = CGPoint(x: 0.0 + CGFloat(i) * backgroundImage.size.width, y: 0.0)
            backgroundLayer.addChild(backgroundImage)
        }
        
        // background is different speed to actual movement - more realistic
        
        backgroundLayer.layerVelocity = CGPoint(x: -100.0, y: 0.0)
        
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
        if let exampleTiles = mapNode.childNode(withName: GameConstants.StringConstants.exampleTilesName) as? SKTileMapNode {
            tileMap = exampleTiles
          tileMap.scale(to: frame.size, width: false, multiplier: 1.0)
            
            // physics properties
            // It's called ground as I just labelled the properties on the tiles on tileMap
            PhysicsHelper.addPhysicsBody(to: tileMap, and: "ground")
        }
        
        
        // called from below
        addPlayer()
        
    }
    
   // Player functions, initialise sprite

    func addPlayer() {
        player = Player(imageNamed: GameConstants.StringConstants.playerImageName)
        // scale player sprite to a 10th of scene aka 0.1
        player.scale(to: frame.size, width: false, multiplier: 0.1)
        player.name = GameConstants.StringConstants.playerName
        
        // Physics of the player
        PhysicsHelper.addPhysicsBody(to: player, with: player.name!)
        
        // position the start of the player
        player.position = CGPoint(x: frame.midX/2.0, y: frame.midY)
        player.zPosition = GameConstants.ZPositions.playerZ
      
        // animations of sprite/textures
        player.loadTextures()
        
        // start off idle sprite
        // THIS WAS CHANGED TO RUNNING TO FIX AN ERROR THAT THE SPRITE DIDN'T RUN //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        player.state = .running
        
        addChild(player)
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
            backgroundLayer.update(dt)
        }
        
    }
    
    // Physics properties continued
    
    override func didSimulatePhysics() {
        for node in tileMap[GameConstants.StringConstants.groundNodeName] {
            
            if let groundNode = node as? GroundNode {
                let groundY = (groundNode.position.y + groundNode.size.height) * tileMap.yScale
                let playerY = player.position.y - player.size.height/3
                groundNode.isBodyActivated = playerY > groundY
            }
        }
    }
    
    
    
    
    
    
}

// Fixes the error "Cannot assign value of type 'GameScene' to type 'SKPhysicsContactDelegate?'" for physicsWorld.contactDelegate = self. Needs framework gamescene shown below.
// Needed for physics elements of the game

extension GameScene: SKPhysicsContactDelegate {
    
    
}
