//
//  CGPoint+OffsetByPoint.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import UIKit

extension CGPoint {
    func offsetBy(point: CGPoint) -> CGPoint {
        .init(x: self.x + point.x, y: self.y + point.y)
    }
    
    func offsetBy(_ deltaValues: (CGFloat, CGFloat)) -> CGPoint {
        self.offsetBy(dx: deltaValues.0, dy: deltaValues.1)
    }
    func offsetBy(_ deltaValues: (Double, Double)) -> CGPoint {
        self.offsetBy(dx: CGFloat(deltaValues.0), dy: CGFloat(deltaValues.1))
    }
}
