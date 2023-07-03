//
//  ItemNode.swift
//  Pt2
//
//  Created by Mert Arıcan on 27.08.2021.
//

import UIKit
import SpriteKit

class ItemNode: SKShapeNode {
    var creator: ItemCreator!
    var parentNode: ItemNode?
    var rootParent: ItemNode { parentNode?.rootParent ?? self }
    
    static var allItemNodes: [Int : ItemNode] = [:]
    
    private static func getPositionOnParent(forAngle angle: CGFloat, withRadius radius: CGFloat) -> (dx: CGFloat, dy: CGFloat) {
        return (dx: radius * cos(degrees: angle), dy: radius * sin(degrees: angle))
    }
    
    static func thisItemHasEnemyNode(thisItem: ItemNode) -> Bool {
        allItemNodes.values.filter { $0.parentNode?.creator.id == thisItem.creator.id }.contains { $0.creator.isEnemy }
    }
    
    static func getOrigin(accordingToSpecifier originSpecifier: OriginSpecifier, tileMap: SKTileMapNode, parentNode: ItemNode?, offset: (dx: Double, dy: Double)?) -> CGPoint {
        let origin: CGPoint
        switch originSpecifier {
        case .angle(let angle): origin = .zero.offsetBy(getPositionOnParent(forAngle: angle, withRadius: parentNode!.creator.dimension.radius))
        case .center(_): origin = .zero
        case .angleRadius(let angle, let radius): origin = .zero.offsetBy(getPositionOnParent(forAngle: angle, withRadius: radius))
        default: origin = tileMap.getOriginInSceneCoordinates(originSpecifier: originSpecifier)
        }
        return offset != nil ? origin.offsetBy(offset!) : origin
    }
    
    static func leaveParent(childNode: ItemNode, parentNode: SKNode) {
        childNode.position = childNode.parent!.convert(childNode.position, to: parentNode)
        childNode.removeFromParent()
        parentNode.addChild(childNode)
        childNode.creator.removeFromParent()
    }
    
    var angularVelocity: CGFloat?
    
    func updateAngularVelocity() {
        guard let angularVelocity = self.angularVelocity else { return }
        self.physicsBody?.angularVelocity = angularVelocity
    }
    
    func epicycleMovement() {
        if let movement = creator.movement.value {
            self.angularVelocity = ((movement.clockwise ? 2 : -2) * .pi) / CGFloat(movement.duration)
            print("ANG", angularVelocity)
        }
    }
}
