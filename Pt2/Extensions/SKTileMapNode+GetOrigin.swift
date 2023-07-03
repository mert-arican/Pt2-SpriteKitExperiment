//
//  SKTileMapNode+GetOrigin.swift
//  BATemplate1
//
//  Created by Mert Arıcan on 9.08.2021.
//

import SpriteKit

extension SKTileMapNode {
    func getOriginInSceneCoordinates(originSpecifier: OriginSpecifier) -> CGPoint {
        var coordinate: (column: Int, row: Int, corner: CornerType)?
        switch originSpecifier {
        case .coordinate(let column, let row, let corner): coordinate = (column, row, corner)
        default: break
        }
        let offset: CGFloat
        if let camera = (self.parent?.parent as? SKScene)?.camera {
            offset = self.position.x - camera.position.x
        } else {
            offset = 0.0
        }
        precondition(coordinate != nil, "Invalid origin specifier!")
        return cornerOfTile(originSpecifier: coordinate!).offsetBy(dx: offset, dy: 0.0)
    }
}
