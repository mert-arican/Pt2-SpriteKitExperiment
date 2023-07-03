//
//  SKTileMapNode+Corner.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import SpriteKit

extension SKTileMapNode {
    func cornerOfTile(originSpecifier: (column: Int, row: Int, corner: CornerType)) -> CGPoint {
        let centerOfTile = self.centerOfTile(atColumn: originSpecifier.column, row: originSpecifier.row)
        let halfOfTheTileLenght = self.tileSize.width / 2.0
        switch originSpecifier.corner {
        case .center: return centerOfTile
        case .bottomLeft: return centerOfTile.offsetBy(dx: -halfOfTheTileLenght, dy: -halfOfTheTileLenght)
        case .topLeft: return centerOfTile.offsetBy(dx: -halfOfTheTileLenght, dy: halfOfTheTileLenght)
        case .topRight: return centerOfTile.offsetBy(dx: halfOfTheTileLenght, dy: halfOfTheTileLenght)
        case .bottomRight: return centerOfTile.offsetBy(dx: halfOfTheTileLenght, dy: halfOfTheTileLenght)
        }
    }
}
