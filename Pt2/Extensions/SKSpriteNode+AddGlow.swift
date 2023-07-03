//
//  SKSpriteNode+AddGlow.swift
//  BATemplate2
//
//  Created by Mert Arıcan on 13.08.2021.
//

import SpriteKit

extension SKNode
{
    func addGlow(radius:CGFloat=30)
    {
        let view = SKView()
        let effectNode = SKEffectNode()
        let texture = view.texture(from: self)
        effectNode.shouldRasterize = true
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius":radius])
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
    }
}
