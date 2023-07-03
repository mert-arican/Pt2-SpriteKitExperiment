//
//  PhysicsContactDelegate.swift
//  Pt2
//
//  Created by Mert Arıcan on 27.08.2021.
//

import UIKit
import SpriteKit

class PhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
    
    func didEnd(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == BitMaskValues.ptolemy | BitMaskValues.ground {
//            print("END", contact.collisionImpulse)
        }
    }
    
    var falseFlag = false
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == BitMaskValues.ptolemy | BitMaskValues.ground {
            if let player = contact.bodyA.node as? PtolemyNode {
                player.onGround = true
            } else if let player = contact.bodyB.node as? PtolemyNode {
                player.onGround = true
            }
//            print("BEGIN", contact.collisionImpulse)
        }
        
        if collision == BitMaskValues.ptolemy | BitMaskValues.phi {
            if let phi = contact.bodyA.node as? RewardNode, let ptolemy = contact.bodyB.node as? PtolemyNode {
                ptolemy.lastSafeGround = phi.groundNode
                phi.groundNode.phiCollected = true
                phi.removeFromParent()
            } else if let phi = contact.bodyB.node as? RewardNode, let ptolemy = contact.bodyA.node as? PtolemyNode {
                ptolemy.lastSafeGround = phi.groundNode
                phi.groundNode.phiCollected = true
                phi.removeFromParent()
            }
        }
        
        if collision == BitMaskValues.ptolemy | BitMaskValues.enemy {
        }
    }
}
