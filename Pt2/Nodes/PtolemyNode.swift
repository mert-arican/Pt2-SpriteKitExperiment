//
//  PtolemyNode.swift
//  Pt2
//
//  Created by Mert Arıcan on 27.08.2021.
//

import UIKit
import SpriteKit

class PtolemyNode: SKSpriteNode {
    var towardsRight = false // { didSet { print("RIGHT: \(towardsRight)") } }
    var towardsLeft = false // { didSet { print("LEFT: \(towardsLeft)") } }
    var onGround = true
    
    var lastSafeGround: RectangularItemNode!
    
    private var groundAccel: CGFloat = 0.2 * 5
    private var groundDecel: CGFloat = 0.5 * 4
    private var airAccel: CGFloat = 0.2 * 5
    private var airDecel: CGFloat = 0.05
    private var walkSpeed: CGFloat = 2.0 * 6
    private var hSpeed: CGFloat = 0.0
    
    private let jumpImpulse: CGVector = .init(dx: 0.0, dy: 32.0 / 100000.0)
    private weak var timer: Timer?
    
    func jump() {
//        guard self.onGround else { return }
        timer?.invalidate()
        self.physicsBody?.velocity.dx = 0.0
        self.physicsBody?.applyImpulse(jumpImpulse)
        self.onGround = false
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { timer in
            self.physicsBody?.applyImpulse(.init(dx: 0.0, dy: -self.jumpImpulse.dy / 3.0))
        })
    }
    
    func rebirth() {
        guard let parent = self.parent else { return }
        putOnItem(item: self.lastSafeGround, parentNode: parent)
    }
    
    private func putOnItem(item: ItemNode, parentNode: SKNode) {
        self.position = parentNode.convert(item.position, from: item.parent!).offsetBy(dx: 0.0, dy: (self.size.height + item.creator.dimension.rectangularDimensions!.height) / 2.0)
    }
    
    convenience init(onItem item: ItemNode, parentNode: SKNode) {
        self.init(texture: SKTexture(imageNamed: "Ptolemy"))
        guard let texture = self.texture else { return }
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        self.putOnItem(item: item, parentNode: parentNode)
        guard let physicsBody = self.physicsBody else { return }
        physicsBody.categoryBitMask = BitMaskValues.ptolemy
        physicsBody.collisionBitMask = BitMaskValues.ground | BitMaskValues.enemy
        physicsBody.contactTestBitMask = BitMaskValues.enemy
        physicsBody.allowsRotation = false
        physicsBody.mass = 0.0000001
        physicsBody.friction = 1.0
        physicsBody.restitution = 0.0
        physicsBody.angularDamping = 0.0
        physicsBody.linearDamping = 0.0
        physicsBody.usesPreciseCollisionDetection = true
        parentNode.addChild(self)
        self.lastSafeGround = item as? RectangularItemNode
        self.addGlow()
    }
    
    func update() {
        let aSpeed: CGFloat = self.onGround ? self.groundAccel : self.airAccel
        let dSpeed: CGFloat = self.onGround ? self.groundDecel : self.airDecel
        
        if !onGround { self.physicsBody?.velocity.dx = 0.0 }
        
        // movement
        if self.towardsLeft {
            self.hSpeed = approach(start: self.hSpeed, end: -self.walkSpeed, shift: aSpeed)
        } else if self.towardsRight {
            self.hSpeed = approach(start: self.hSpeed, end: self.walkSpeed, shift: aSpeed)
        } else {
            self.hSpeed = approach(start: self.hSpeed, end: 0.0, shift: dSpeed)
        }
        self.position.x = self.position.x + self.hSpeed
        
        if (self.physicsBody?.velocity.dy ?? 0.0) > 3200.0 {
            self.physicsBody?.velocity.dy = 3200.0
        }
    }
    
    private func approach(start: CGFloat, end: CGFloat, shift: CGFloat) -> CGFloat {
        if start < end { return min(start + shift, end) }
        else { return max(start - shift, end) }
    }
}
