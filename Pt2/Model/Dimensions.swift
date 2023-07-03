//
//  Dimensions.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import UIKit

enum Dimension: Equatable {
    case rectangular(width: CGFloat, height: CGFloat)
    case circular(radius: CGFloat)
    
    static func ==(_ lhs: Dimension, _ rhs: Dimension) -> Bool {
        switch (lhs, rhs) {
        case (let .rectangular(width0, height0), let .rectangular(width1, height1)):
            return width0 == width1 && height0 == height1
        case (let .circular(radius0), let .circular(radius1)):
            return radius0 == radius1
        default: return false
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .rectangular(let width, _): return width / 2.0
        case .circular(let radius): return radius
        }
    }
    
    var type: ItemType {
        switch self {
        case .rectangular(_, _): return .rectangular
        case .circular(_): return .circular
        }
    }
    
    var rectangularDimensions: CGSize? {
        switch self {
        case .rectangular(let width, let height): return .init(width: width, height: height)
        default: return nil
        }
    }
}
