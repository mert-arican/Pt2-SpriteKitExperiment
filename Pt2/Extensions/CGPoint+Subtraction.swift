//
//  CGPoint+Subtraction.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import UIKit

extension CGPoint {
    static func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        return .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
