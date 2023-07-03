//
//  RectangularItemNode.swift
//  Pt2
//
//  Created by Mert Arıcan on 27.08.2021.
//

import UIKit
import SpriteKit

class RectangularItemNode: ItemNode {
    convenience init(tileMap: SKTileMapNode, creator: ItemCreator) {
        self.init(rectOf: creator.dimension.rectangularDimensions!, cornerRadius: 16.0)
        
        self.creator = creator
        
        if let parentID = creator.parentID {
            self.parentNode = ItemNode.allItemNodes[parentID]
        }
        
        self.position = ItemNode.getOrigin(
            accordingToSpecifier: creator.origin,
            tileMap: tileMap,
            parentNode: self.parentNode,
            offset: creator.offset
        )
        
        let color = DesignConstants.level1Colors[creator.colorIndex]
        
        if creator.isVisible {
            self.strokeColor = color ; self.fillColor = color
        } else {
            self.strokeColor = .clear
        }
        
        ItemNode.allItemNodes[creator.id] = self
        
        parentNode?.addChild(self)
        
        if creator.shouldRemoveFromParent {
            ItemNode.leaveParent(childNode: self, parentNode: tileMap.parent!)
        }
        
        if creator.hasPhi { addPhi() }
        
//        self.zPosition = -1
        createPhysicsBody()
        epicycleMovement()
    }
    
    override func epicycleMovement() {
        if let movement = creator.movement.value, creator.stopAfterPi && self.phiCollected {
            self.angularVelocity = ((movement.clockwise ? 2 : -2) * .pi) / CGFloat(movement.duration)
        } else {
            self.angularVelocity = 0.0
        }
    }
    
    private func createPhysicsBody() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.creator.dimension.rectangularDimensions!)
        guard let physicsBody = self.physicsBody else { return }
        physicsBody.pinned = true
        physicsBody.affectedByGravity = false
        physicsBody.friction = 1.0
        physicsBody.restitution = 0.0
        physicsBody.linearDamping = 0.0
        physicsBody.angularDamping = 0.0
        physicsBody.categoryBitMask = BitMaskValues.ground
        physicsBody.collisionBitMask = BitMaskValues.ptolemy
        physicsBody.contactTestBitMask = BitMaskValues.ptolemy
    }
    
    private func addPhi() {
        let phi = RewardNode(imageNamed: "phi")
        phi.groundNode = self
        phi.color = .white // DesignConstants.level1Colors[4]
        phi.colorBlendFactor = 1.0
        phi.addGlow()
        self.addChild(phi)
        phi.position = .zero.offsetBy(dx: 0.0, dy: (creator.dimension.rectangularDimensions!.height / 2.0) + 192.0)
        phi.physicsBody = SKPhysicsBody(circleOfRadius: 64.0)
        phi.physicsBody?.pinned = true
        phi.physicsBody?.mass = 0.00000001
        phi.physicsBody?.categoryBitMask = BitMaskValues.phi
        phi.physicsBody?.collisionBitMask = BitMaskValues.non
        phi.physicsBody?.contactTestBitMask = BitMaskValues.ptolemy
    }
    
    var phiCollected = false {
        didSet {
            if self.creator.stopAfterPi { self.parentNode?.angularVelocity = 0.0
                if !self.creator.dropAfterPi {
                    self.parentNode?.physicsBody?.pinned = false
                    self.parentNode?.physicsBody?.affectedByGravity = true
                }
            }
        }
    }
}
