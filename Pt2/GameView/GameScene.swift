//
//  GameScene.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
    }
    
    private(set) var grandParent: SKShapeNode!
    
    private var controlNodes = [SKShapeNode]()
    
    private var physicsContactDelegate: PhysicsContactDelegate!
    
    private var ptolemy: PtolemyNode! { didSet { self.lastPos = ptolemy.position } }
    
    private var theScale: CGFloat!
    
    override func didMove(to view: SKView) {
        self.physicsContactDelegate = PhysicsContactDelegate()
        physicsWorld.contactDelegate = self.physicsContactDelegate
        physicsWorld.gravity = .init(dx: 0.0, dy: -46.0) // 23.14
        self.backgroundColor = DesignConstants.level1Colors[0]
        self.grandParent = SKShapeNode(rectOf: size)
        self.addChild(grandParent)

        let up = view.convert(.init(x: 0.0, y: view.bounds.maxY), to: self).y
        let bottom = view.convert(.init(x: 0.0, y: view.bounds.minY), to: self).y
        let h = bottom - up
        let scale = h / grandParent.calculateAccumulatedFrame().height
        self.theScale = scale
        grandParent.setScale(scale)
        setupCamera()
        
        let offset = (self.calculateAccumulatedFrame().width - self.grandParent.calculateAccumulatedFrame().width) / 2.0
        grandParent.position = .zero.offsetBy(dx: -offset, dy: 0.0)
        
        let a = view.convert(.init(x: view.bounds.minX, y: 0.0), to: self).x
        let b = (-size.width) / 2.0
        self.camera!.position.x -= (a-b) / 2.0
        
        let tileMap = SKTileMapNode(tileSet: SKTileSet(), columns: 200, rows: 13, tileSize: .init(width: 128.0, height: 128.0))
        tileMap.color = .red
        tileMap.position = .init(x: 100 * 128.0 - 1180.0, y: 0.0) // MARK: TODO: Formulize
        self.grandParent.addChild(tileMap)
        
        GameplayItems.allItems.forEach {
            let itemNode = $0.typeOfItem == .rectangular ? RectangularItemNode(tileMap: tileMap, creator: $0) : CircularItemNode(tileMap: tileMap, creator: $0)
            if $0.parent == nil { self.grandParent.addChild(itemNode) }
        }
        
        let XXX = 0 // 1300456 // 0 // 13
        
        self.ptolemy = PtolemyNode(onItem: ItemNode.allItemNodes[XXX]!, parentNode: grandParent)
        // MARK: - TEMPORARY
        
        let x = self.size.width / 2.0
        let y = self.size.height / 2.0
        
        let leftNode = SKShapeNode(rectOf: .init(width: 200.0, height: 200.0))
        leftNode.name = "left"
        self.addChild(leftNode)
        leftNode.fillColor = .blue
        leftNode.position = .init(x: 16.0 + 100.0 - x, y: 196.0 - y)
        
        let rightNode = SKShapeNode(rectOf: .init(width: 200.0, height: 200.0))
        rightNode.name = "right"
        self.addChild(rightNode)
        rightNode.fillColor = .blue
        rightNode.position = .init(x: leftNode.position.x + 320.0, y: leftNode.position.y)
        
        let jumpNode = SKShapeNode(rectOf: .init(width: 200.0, height: 200.0))
        jumpNode.name = "jump"
        self.addChild(jumpNode)
        jumpNode.fillColor = .red
        jumpNode.position = .init(x: x - 120.0, y: leftNode.position.y)
        
        controlNodes.append(leftNode)
        controlNodes.append(rightNode)
        controlNodes.append(jumpNode)
        
        GameSound.playTouch()
        let dx = self.convert(ItemNode.allItemNodes[XXX]!.position, from: ItemNode.allItemNodes[XXX]!.parent!).x - ItemNode.allItemNodes[0]!.position.x
        controlNodes.forEach { $0.fillColor = .clear ; $0.position.x += dx
            
            $0.position.y += 100.0
        }
        camera?.position.x += dx
        grandParent.lineWidth = 0.0
        
        (ItemNode.allItemNodes.values).filter { $0.creator.typeOfItem == .circular }.forEach { circle in
            (circle as? CircularItemNode)?.asd()
            if circle.creator.id == 42 { print(circle.creator.thickness) }
        }
    }
    
    private func setupCamera() {
        // MARK: If there is no addChild func then camera will get cleaned by ARC. If you copy paste this content to \ -sceneDidLoad then it will work fine. Might be hint about ARC.
        let camera = SKCameraNode()
        camera.name = "camera"
        self.camera = camera
        self.addChild(camera)
    }
    
    private var lastPos = CGPoint()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let scene = scene {
                if let node = nodes(at: touch.location(in: scene)).first {
                    if node.name == "left" {
                        ptolemy.towardsLeft = true
                        print("left")
                    } else if node.name == "right" {
                        ptolemy.towardsRight = true
                        print("right")
                    } else if node.name == "jump" {
                        ptolemy.jump()
                    }
                }
            }
        }
    }
    
    private func touchEnd(_ touches: Set<UITouch>) {
        guard let scene = scene else { return }
        touches.forEach {
            if let node = nodes(at: $0.location(in: scene)).first {
                if node.name != "jump" {
                    ptolemy.towardsLeft = false
                    ptolemy.towardsRight = false
                    print("Cancel!")
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEnd(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEnd(touches)
    }
    
    private lazy var lastPoint = self.view!.convert(.init(x: 0.0, y: self.view!.frame.maxY), to: self).y
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        let dx = ptolemy.position.x - lastPos.x
//        let dy = ptolemy.position.y - lastPos.y
        
        if let camera = self.camera {
            camera.position.x += dx * theScale
//            camera.position.y += dy
        }
        
        controlNodes.forEach {
            $0.position.x += dx * theScale
//            $0.position.y += dy
        }
        
        lastPos = ptolemy.position
        
        ptolemy.update()
        
        ItemNode.allItemNodes.values.forEach {
            $0.updateAngularVelocity()
        }
        
//        print(ptolemy.positionInScene, lastPoint)
        if ptolemy.positionInScene!.y < lastPoint {
            ptolemy.rebirth()
        }
        self.lastUpdateTime = currentTime
    }
    
    
}

extension PtolemyNode {
    var positionInScene: CGPoint? {
        guard let _ = self.parent else { return nil }
        return self.parent!.convert(self.position, to: self.parent!.scene!)
    }
}
