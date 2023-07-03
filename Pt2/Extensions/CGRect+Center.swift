//
//  CGRect+Center.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import UIKit

extension CGRect {
    var center: CGPoint {
        .init(x: self.origin.x + self.width / 2.0, y: self.origin.y + self.height / 2.0)
    }
}
