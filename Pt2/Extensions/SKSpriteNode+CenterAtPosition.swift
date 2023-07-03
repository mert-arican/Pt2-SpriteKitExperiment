//
//  SKSpriteNode+CenterAtPosition.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import SpriteKit

extension SKSpriteNode {
    func centerAtPosition(position: CGPoint) {
        self.position = position.offsetBy(dx: self.size.width / 2.0, dy: self.size.height / 2.0)
    }
}
