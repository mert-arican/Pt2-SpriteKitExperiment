//
//  CGPoint+Offset.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import UIKit

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        .init(x: self.x + dx, y: self.y + dy)
    }
}

