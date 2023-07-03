//
//  CircularItemNode.swift
//  Pt2
//
//  Created by Mert Arıcan on 27.08.2021.
//

import UIKit
import SpriteKit

enum Thickness {
    case thin, normal, thick
}

class CircularItemNode: ItemNode {
    
    var thickness: Thickness!
    
    convenience init(tileMap: SKTileMapNode, creator: ItemCreator) {
        self.init(circleOfRadius: creator.dimension.radius)
        
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
            self.strokeColor = color
            if creator.isEnemy == true { self.fillColor = color }
        } else {
            self.strokeColor = .clear
        }
        
        ItemNode.allItemNodes[creator.id] = self
        
        parentNode?.addChild(self)
        
        if creator.shouldRemoveFromParent {
            ItemNode.leaveParent(childNode: self, parentNode: tileMap.parent!)
        }
        
        self.thickness = creator.thickness
        
//        self.lineWidth = creator.isEnemy ? 4.0 : 128.0
        
//        self.lineWidth = ItemNode.thisItemHasEnemyNode(thisItem: self) ? 4.0 : 128.0
        
        if ItemNode.thisItemHasEnemyNode(thisItem: self) {
//            print("HAS!", creator.id)
        }
        
        if !creator.isEnemy { self.zPosition = -2 }
        if creator.isEnemy || creator.movement.value != nil { createPhysicsBody() }
        epicycleMovement()
    }
    
    func asd() {
        var lineWidth: CGFloat
        switch self.thickness {
        case .thin: lineWidth = 4.0
        case .normal: lineWidth = 64.0
        case .thick: lineWidth = 128.0
        default: lineWidth = 128.0
        }
        self.lineWidth = lineWidth
            // (ItemNode.thisItemHasEnemyNode(thisItem: self) || creator.isEnemy) ? 4.0 : 128.0
    }
    
    private func createPhysicsBody() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.creator.dimension.radius)
        guard let physicsBody = self.physicsBody else { return }
        physicsBody.pinned = true
        physicsBody.affectedByGravity = false
        physicsBody.angularDamping = 0.0
        physicsBody.categoryBitMask = creator.isEnemy ? BitMaskValues.enemy : BitMaskValues.orbit
        physicsBody.collisionBitMask = creator.isEnemy ? BitMaskValues.ptolemy : BitMaskValues.non
        if creator.isEnemy { physicsBody.contactTestBitMask = BitMaskValues.ptolemy }
    }
}
