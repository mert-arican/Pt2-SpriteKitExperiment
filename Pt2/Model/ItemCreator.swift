//
//  CircularItemCreator.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import Foundation

struct ItemCreator: Equatable {
    let id: Int
    let origin: OriginSpecifier
    let dimension: Dimension
    let shouldRemoveFromParent: Bool
    let isVisible: Bool
    let colorIndex: Int
    let isEnemy: Bool
    let hasPhi: Bool
    let thickness: Thickness?
    let stopAfterPi: Bool
    let dropAfterPi: Bool
    var typeOfItem: ItemType { dimension.type }
    var parent: ItemCreator? { AllItemsCreated[parentID] }
    private(set) var parentID: Int?
    private(set) var movement: EpicycleMovementType
    private(set) var offset: (dx: Double, dy: Double)?
    
    static func == (_ lhs: ItemCreator, rhs: ItemCreator) -> Bool { lhs.id == rhs.id }
    
    mutating func removeFromParent() { self.parentID = nil }
    
    init(id: Int, parentID: Int?=nil, origin: OriginSpecifier, dimension: Dimension, movement: EpicycleMovementType, colorIndex: Int, offset: (dx: Double, dy: Double)?=nil, thickness: Thickness?=nil, isVisible: Bool=true, shouldRemoveFromParent: Bool=false, isEnemy: Bool=false, hasPhi: Bool=true, stopAfterPi: Bool=false, dropAfterPi: Bool=false) {
        self.id = id
        self.parentID = parentID
        self.origin = origin
        self.dimension = dimension
        self.movement = movement
        self.offset = offset
        self.colorIndex = colorIndex
        self.isEnemy = isEnemy
        self.hasPhi = hasPhi
        self.shouldRemoveFromParent = shouldRemoveFromParent
        self.isVisible = isVisible
        self.thickness = thickness
        self.stopAfterPi = stopAfterPi
        self.dropAfterPi = dropAfterPi
        AllItemsCreated.allItemsCreated[id] = self
    }
}

struct AllItemsCreated {
    static var allItemsCreated: [Int : ItemCreator] = [:]
    
    static subscript (key: Int?) -> ItemCreator? {
        guard let key = key else { return nil }
        return AllItemsCreated.allItemsCreated[key]
    }
}
