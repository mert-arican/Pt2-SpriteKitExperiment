//
//  Globals.swift
//  Pt1
//
//  Created by Mert Arıcan on 22.08.2021.
//

import UIKit

// Swift 3:
func sin(degrees: CGFloat) -> CGFloat {
    return CGFloat(__sinpi(Double(degrees)/180.0))
}

// Swift 3:
func cos(degrees: CGFloat) -> CGFloat {
    return CGFloat(__cospi(Double(degrees)/180.0))
}
