//
//  EpicycleMovementType.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import UIKit

enum EpicycleMovementType {
    case fixed
    case linear(duration: TimeInterval, clockwise: Bool)
    case forwardBackward(duration: TimeInterval, angle: CGFloat)
    
    var value: (duration: TimeInterval, clockwise: Bool)? {
        switch self {
        case .fixed: return nil
        case .linear(let duration, let clockwise): return (duration, clockwise)
        case .forwardBackward(_, _): return nil
        }
    }
}
