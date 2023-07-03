//
//  OriginSpecifier.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import UIKit

enum OriginSpecifier: Equatable {
    case coordinate(column: Int, row: Int, corner: CornerType)
    case center(parentID: Int)
    case angle(angle: CGFloat)
    case angleRadius(angle: CGFloat, radius: CGFloat)
    
    init(column: Int, row: Int, corner: CornerType) {
        self = .coordinate(column: column, row: row, corner: corner)
    }
    
    init(angle: CGFloat, radius: CGFloat?=nil) {
        if let radius = radius { self = .angleRadius(angle: angle, radius: radius) }
        else { self = .angle(angle: angle) }
    }
    
    static func ==(_ lhs: OriginSpecifier, _ rhs: OriginSpecifier) -> Bool {
        switch (lhs, rhs) {
        case (let .coordinate(col0, row0, corn0), let .coordinate(col1, row1, corn1)):
            return col0 == col1 && row0 == row1 && corn0 == corn1
        case (let .center(parentID0), let .center(parentID1)):
            return parentID0 == parentID1
        case (let .angle(angle0), let .angle(angle1)):
            return angle0 == angle1
        case (let .angleRadius(angle0, radius0), let .angleRadius(angle1, radius1)):
            return angle0 == angle1 && radius0 == radius1
        default: return false
        }
    }
}
