//
//  SKShapeNode+SetColor.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import SpriteKit

extension SKShapeNode {
    func setColor(_ color: UIColor) {
        self.strokeColor = color
        self.fillColor = color
    }
}
