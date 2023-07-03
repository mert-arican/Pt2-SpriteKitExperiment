//
//  GameplayItems.swift
//  Pt0
//
//  Created by Mert Arıcan on 14.08.2021.
//

import UIKit

struct GameplayItems {
    
    
    static private var _allItems: [ItemCreator] = [
        ItemCreator(id: -1, origin: .coordinate(column: 4, row: 6, corner: .center), dimension: .circular(radius: 384), movement: .fixed, colorIndex: 2, thickness: .normal),
        ItemCreator(id: 0, origin: .coordinate(column: 6, row: 6, corner: .center), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1),
        ItemCreator(id: 1, origin: .coordinate(column: 14, row: 6, corner: .center), dimension: .circular(radius: 512.0), movement: .fixed, colorIndex: 2, thickness: .normal),
        ItemCreator(id: 2, origin: .coordinate(column: 27, row: 6, corner: .center), dimension: .circular(radius: 640.0), movement: .linear(duration: 4.0, clockwise: true), colorIndex: 2, thickness: .normal),
        
        // Yellow with 4 rectangle and 2 red enemy
        ItemCreator(id: 3, origin: .coordinate(column: 42, row: 6, corner: .center), dimension: .circular(radius: 512.0), movement: .fixed, colorIndex: 2, thickness: .thick),
        ItemCreator(id: 4, parentID: 3, origin: .angle(angle: 180.0), dimension: .circular(radius: 384.0), movement: .linear(duration: 3.0, clockwise: true), colorIndex: 3, thickness: .normal, shouldRemoveFromParent: true),
        ItemCreator(id: 5, parentID: 3, origin: .angle(angle: 0.0), dimension: .circular(radius: 384.0), movement: .linear(duration: 3.0, clockwise: true), colorIndex: 3, thickness: .normal, shouldRemoveFromParent: true),
        
        ItemCreator(id: 6, origin: .coordinate(column: 58, row: 6, corner: .center), dimension: .circular(radius: 768.0), movement: .fixed, colorIndex: 2, isVisible: false),
        
        ItemCreator(id: 7, parentID: 6, origin: .angle(angle: 0.0), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.8, clockwise: false), colorIndex: 2, offset: (-256.0, 0.0)),
        ItemCreator(id: 8, parentID: 6, origin: .angle(angle: 90.0), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.8, clockwise: true), colorIndex: 2, offset: (0.0, -256.0)),
        ItemCreator(id: 9, parentID: 6, origin: .angle(angle: 180.0), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.8, clockwise: false), colorIndex: 2, offset: (256.0, 0.0)),
        ItemCreator(id: 10, parentID: 6, origin: .angle(angle: 270.0), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.8, clockwise: true), colorIndex: 2, offset: (0.0, 256.0)),
        
        
        
        ItemCreator(id: 11, origin: .coordinate(column: 72, row: 6, corner: .center), dimension: .circular(radius: 640.0), movement: .linear(duration: 3.0, clockwise: false), colorIndex: 2),
        ItemCreator(id: 12, origin: .coordinate(column: 72, row: 6, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 3.0, clockwise: true), colorIndex: 2),
        
        
        
        ItemCreator(id: 13, origin: .coordinate(column: 82, row: 3, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: false), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1300456, parentID: 13, origin: .center(parentID: 13), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),

        ItemCreator(id: 14, origin: .coordinate(column: 82, row: 6, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1400456, parentID: 14, origin: .center(parentID: 14), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),

        ItemCreator(id: 15, origin: .coordinate(column: 82, row: 9, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: false), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1500456, parentID: 15, origin: .center(parentID: 15), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),
        
        ItemCreator(id: 16, origin: .coordinate(column: 88, row: 3, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: false), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1600456, parentID: 16, origin: .center(parentID: 16), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),

        ItemCreator(id: 17, origin: .coordinate(column: 88, row: 6, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1700456, parentID: 17, origin: .center(parentID: 17), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),

        ItemCreator(id: 18, origin: .coordinate(column: 88, row: 9, corner: .center), dimension: .circular(radius: 320.0), movement: .linear(duration: 3.0, clockwise: false), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 1800456, parentID: 18, origin: .center(parentID: 18), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, offset: (0.0, 0.0)),
        
        ItemCreator(id: 19, origin: .coordinate(column: 93, row: 4, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        ItemCreator(id: 20, origin: .coordinate(column: 93, row: 8, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        
        ItemCreator(id: 21, origin: .coordinate(column: 97, row: 10, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .thin),
        ItemCreator(id: 22, origin: .coordinate(column: 97, row: 5, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .thin),
        
        ItemCreator(id: 23, origin: .coordinate(column: 101, row: 4, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        ItemCreator(id: 24, origin: .coordinate(column: 101, row: 8, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        
        ItemCreator(id: 25, origin: .coordinate(column: 105, row: 10, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .thin),
        ItemCreator(id: 26, origin: .coordinate(column: 105, row: 5, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .thin),
        
        ItemCreator(id: 27, origin: .coordinate(column: 109, row: 4, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        ItemCreator(id: 28, origin: .coordinate(column: 109, row: 8, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        
        // --------
        
        ItemCreator(id: 29, origin: .coordinate(column: 118, row: 6, corner: .center), dimension: .circular(radius: 640.0), movement: .linear(duration: 4.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 30, origin: .coordinate(column: 118, row: 6, corner: .center), dimension: .circular(radius: 256.0), movement: .linear(duration: 2.0, clockwise: false), colorIndex: 2, thickness: .normal),
        
        // --------
        
        ItemCreator(id: 31, origin: .coordinate(column: 132, row: 6, corner: .center), dimension: .circular(radius: 640.0), movement: .linear(duration: 4.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 32, origin: .coordinate(column: 132, row: 6, corner: .center), dimension: .circular(radius: 384.0), movement: .linear(duration: 2.0, clockwise: false), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 33, origin: .coordinate(column: 132, row: 6, corner: .center), dimension: .rectangular(width: 320, height: 60.0), movement: .fixed, colorIndex: 1),
        
        ItemCreator(id: 34, origin: .coordinate(column: 144, row: 6, corner: .center), dimension: .circular(radius: 512.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 35, parentID: 34, origin: .center(parentID: 34), dimension: .rectangular(width: 800.0, height: 60.0), movement: .fixed, colorIndex: 1, shouldRemoveFromParent: true, stopAfterPi: true),
        
        
        ItemCreator(id: 36, origin: .coordinate(column: 154, row: 6, corner: .center), dimension: .circular(radius: 512.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 37, parentID: 36, origin: .center(parentID: 36), dimension: .rectangular(width: 800.0, height: 60.0), movement: .fixed, colorIndex: 1, shouldRemoveFromParent: true, stopAfterPi: true),
        
        ItemCreator(id: 38, origin: .coordinate(column: 164, row: 6, corner: .center), dimension: .circular(radius: 512.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .normal),
        ItemCreator(id: 39, parentID: 38, origin: .center(parentID: 38), dimension: .rectangular(width: 800.0, height: 60.0), movement: .fixed, colorIndex: 1, shouldRemoveFromParent: true, stopAfterPi: true),
        
        ItemCreator(id: 40, origin: .coordinate(column: 172, row: 9, corner: .center), dimension: .circular(radius: 384.0), movement: .fixed, colorIndex: 2, thickness: .normal),
        ItemCreator(id: 41, parentID: 40, origin: .angle(angle: 160.0), dimension: .circular(radius: 128.0), movement: .linear(duration: 1.0, clockwise: true), colorIndex: 2, thickness: .normal, shouldRemoveFromParent: true),
        ItemCreator(id: 42, parentID: 40, origin: .center(parentID: 40), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: 1, shouldRemoveFromParent: true),
        
        ItemCreator(id: 42, origin: .coordinate(column: 180, row: 3, corner: .center), dimension: .circular(radius: 384.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .normal),
        
        ItemCreator(id: 43, origin: .coordinate(column: 188, row: 7, corner: .center), dimension: .circular(radius: 384.0), movement: .linear(duration: 2.0, clockwise: true), colorIndex: 2, thickness: .normal),
        
        ItemCreator(id: 44, origin: .coordinate(column: 200, row: 7, corner: .center), dimension: .circular(radius: 640.0), movement: .fixed, colorIndex: 2, thickness: .normal),
        ItemCreator(id: 45, parentID: 44, origin: .center(parentID: 44), dimension: .rectangular(width: 800.0, height: 60.0), movement: .fixed, colorIndex: 1, shouldRemoveFromParent: true),
    ]
    
    // 89 ile 97 arası maximum jump.
    
    static let enemies: [[ItemCreator]] = [
        addEnemyToCircle(parentID: 1, colorIndex: 1, numberOfEnemies: 4, radius: 0.0, bbb: true),
        addEnemyToCircle(parentID: 2, colorIndex: 1, numberOfEnemies: 4, radius: 0.0, bbb: true),
        addEnemyToCircle(parentID: 3, colorIndex: 1, numberOfEnemies: 4, radius: 0.0, bbb: true),
        addEnemyToCircle(parentID: 4, colorIndex: 4, numberOfEnemies: 2, radius: 48.0),
        addEnemyToCircle(parentID: 5, colorIndex: 4, numberOfEnemies: 2, radius: 48.0),
        addEnemies(parentIDs: [7, 8, 9, 10], colorIndex: 1, numberOfEnemies: 1, radius: 0.0, bbb: true),
        addEnemyToCircle(parentID: 11, colorIndex: 1, numberOfEnemies: 1, radius: 0.0, bbb: true),
        addEnemyToCircle(parentID: 12, colorIndex: 1, numberOfEnemies: 1, radius: 0.0, bbb: true),
        
        addEnemyToCircle(parentID: 13, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        addEnemyToCircle(parentID: 14, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        addEnemyToCircle(parentID: 15, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        
        addEnemyToCircle(parentID: 16, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        addEnemyToCircle(parentID: 17, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        addEnemyToCircle(parentID: 18, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        
        addEnemyToCircle(parentID: 21, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        addEnemyToCircle(parentID: 22, colorIndex: 4, numberOfEnemies: 1, radius: 48.0),
        
        addEnemyToCircle(parentID: 25, colorIndex: 4, numberOfEnemies: 2, radius: 48.0),
        addEnemyToCircle(parentID: 26, colorIndex: 4, numberOfEnemies: 2, radius: 48.0),
        
        // NEW -----
        addEnemyToCircle(parentID: 29, colorIndex: 1, numberOfEnemies: 1, radius: 48.0, bbb: true),
        addEnemyToCircle(parentID: 30, colorIndex: 1, numberOfEnemies: 1, radius: 48.0, bbb: true),
        
        // NEW -----
        addEnemyToCircle(parentID: 31, colorIndex: 1, numberOfEnemies: 1, radius: 48.0, bbb: true),
        addEnemyToCircle(parentID: 32, colorIndex: 4, numberOfEnemies: 2, radius: 48.0),
        
        // NEW -----
        addEnemyToCircle(parentID: 34, colorIndex: 4, numberOfEnemies: 6, radius: 48.0),
        addEnemyToCircle(parentID: 36, colorIndex: 4, numberOfEnemies: 6, radius: 48.0),
        addEnemyToCircle(parentID: 38, colorIndex: 4, numberOfEnemies: 6, radius: 48.0),
        
        addEnemyToCircle(parentID: 41, colorIndex: 4, numberOfEnemies: 3, radius: 48.0),
        addEnemyToCircle(parentID: 42, colorIndex: 1, numberOfEnemies: 1, radius: 48.0, bbb: true),
        
        addEnemyToCircle(parentID: 43, colorIndex: 1, numberOfEnemies: 1, radius: 48.0, bbb: true),
    ]
    
    static func addEnemies(parentIDs: [Int],  colorIndex: Int, numberOfEnemies number: Int?=nil, atAngles angles: [CGFloat]?=nil, radius: CGFloat?=nil, radiuses: [CGFloat]?=nil, bbb: Bool=false, item: ItemCreator?=nil) -> [ItemCreator] {
        var total = [ItemCreator]()
        parentIDs.forEach {
            total += addEnemyToCircle(parentID: $0, colorIndex: colorIndex, numberOfEnemies: number, atAngles: angles,radius: radius, radiuses: radiuses, bbb: bbb, item: item)
        }
        return total
    }
    
    static func getAllItems() -> [ItemCreator] {
        var allItems = self._allItems
        for items in enemies { for enemy in items { allItems.append(enemy) } }
        return allItems
    }
    
    static var allItems = getAllItems()
}

extension GameplayItems {
    static func addEnemyToCircle(parentID: Int, colorIndex: Int, numberOfEnemies number: Int?=nil, atAngles angles: [CGFloat]?=nil, radius: CGFloat?=nil, radiuses: [CGFloat]?=nil, bbb: Bool=false, item: ItemCreator?=nil) -> [ItemCreator] {
        var enemies = [ItemCreator]()
        let parentIDString = String(parentID)
        var theRadius = CGFloat()
        if let number = number, number >= 1 {
            let a = 360.0 / CGFloat(number)
            for i in 0..<number {
                if radius != nil { theRadius = radius! } else { theRadius = radiuses![i] }
                if let item = item { enemies.append(item) }
                else if bbb {
                    let item = ItemCreator(id: Int(parentIDString + String(i) + "456")!, parentID: parentID, origin: .angle(angle: CGFloat(i) * a), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: colorIndex)
                    enemies.append(item)
                }
                else {
                    let item = ItemCreator(id: Int(parentIDString + String(i) + "456")!, parentID: parentID, origin: .angle(angle: CGFloat(i) * a), dimension: .circular(radius: theRadius), movement: .fixed, colorIndex: colorIndex, thickness: .thin, isEnemy: true)
                enemies.append(item)
                }
            }
        } else if let angles = angles, angles.count > 0 {
            assert(!angles.contains { $0 < 0.0 }, "ANGLES CONTAINS NEGATIVE ANGLE!")
            for (index, angle) in angles.enumerated() {
                if radius != nil { theRadius = radius! } else { theRadius = radiuses![index] }
                if let item = item { enemies.append(item) }
                if bbb {
                    let item = ItemCreator(id: Int(parentIDString + String(index) + "123")!, parentID: parentID, origin: .angle(angle: CGFloat(index) * angle), dimension: .rectangular(width: 320.0, height: 60.0), movement: .fixed, colorIndex: colorIndex)
                    enemies.append(item)
                } else {
                    let item = ItemCreator(id: Int(parentIDString + String(index) + "123")!, parentID: parentID, origin: .angle(angle: angle), dimension: .circular(radius: theRadius), movement: .fixed, colorIndex: colorIndex, thickness: .thin, isEnemy: true)
                    enemies.append(item)
                }
            }
        }
        return enemies
    }
}






































extension GameplayItems {
    static func addTiles() {
        for (i, id) in (100...112).enumerated() {
            allItems.append(ItemCreator(id: id, origin: .coordinate(column: (id % 2 == 0) ? 0 : 1, row: i, corner: .bottomLeft), dimension: .rectangular(width: 128.0, height: 128.0), movement: .fixed, colorIndex: 1))
        }
    }
}
