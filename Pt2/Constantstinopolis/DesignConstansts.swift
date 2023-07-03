//
//  DesignConstansts.swift
//  BATemplate0
//
//  Created by Mert Arıcan on 5.08.2021.
//

import UIKit

struct DesignConstants {
    static let tileSize: CGSize = .init(width: 128.0, height: 128.0)
    static let tileLength: CGFloat = 128.0
    
//    // MARK: - SELECTED! ?
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.1254901961, green: 0.5803921569, blue: 0.5450980392, alpha: 1), #colorLiteral(red: 0.8705882353, green: 0.4784313725, blue: 0.1333333333, alpha: 1), #colorLiteral(red: 0.9568627451, green: 0.8, blue: 0.4392156863, alpha: 1), #colorLiteral(red: 0.4156862745, green: 0.6941176471, blue: 0.5294117647, alpha: 1)]
    
//    // MARK: - SELECTED!
    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.2823529412, green: 0.5411764706, blue: 0.6, alpha: 1), #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1), #colorLiteral(red: 0.2823529412, green: 0.5411764706, blue: 0.6, alpha: 1).adjust(by: -20.0)!, #colorLiteral(red: 0.3019607843, green: 0.3450980392, blue: 0.3568627451, alpha: 1), #colorLiteral(red: 0.8588235294, green: 0.6823529412, blue: 0.3450980392, alpha: 1)]//.complete()
    
//    // MARK: - SELECTED!
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.9764705882, green: 0.5333333333, blue: 0.4, alpha: 1), #colorLiteral(red: 1, green: 0.2588235294, blue: 0.05490196078, alpha: 1), #colorLiteral(red: 0.9764705882, green: 0.5333333333, blue: 0.4, alpha: 1).adjust(by: -20.0)!, #colorLiteral(red: 0.5019607843, green: 0.7411764706, blue: 0.6196078431, alpha: 1), #colorLiteral(red: 0.537254902, green: 0.8549019608, blue: 0.3490196078, alpha: 1)].complete()
    
//    // MARK: - SELECTED!
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1), #colorLiteral(red: 0.2, green: 0.4196078431, blue: 0.5294117647, alpha: 1), #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1).adjust(by: -20.0)!, #colorLiteral(red: 0.5647058824, green: 0.6862745098, blue: 0.7725490196, alpha: 1), #colorLiteral(red: 0.462745098, green: 0.2117647059, blue: 0.1490196078, alpha: 1)].complete()
    
//    // MARK: - SELECTED!
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.1803921569, green: 0.2745098039, blue: 0, alpha: 1), #colorLiteral(red: 0.2823529412, green: 0.4196078431, blue: 0, alpha: 1), #colorLiteral(red: 0.6352941176, green: 0.7725490196, blue: 0.137254902, alpha: 1), #colorLiteral(red: 0.4901960784, green: 0.2666666667, blue: 0.1529411765, alpha: 1)].complete()
    
//    // MARK: - SELECTED! !!!
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 1, green: 0.7333333333, blue: 0, alpha: 1), #colorLiteral(red: 0.2156862745, green: 0.368627451, blue: 0.5921568627, alpha: 1), #colorLiteral(red: 1, green: 0.7333333333, blue: 0, alpha: 1).adjust(by: -20.0)!, #colorLiteral(red: 0.9843137255, green: 0.3960784314, blue: 0.2588235294, alpha: 1), #colorLiteral(red: 0.4445514083, green: 0.7385429144, blue: 0.2047486305, alpha: 1)].complete()
    
//    // MARK: - SELECTED ?
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.1960784314, green: 0.2823529412, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.5254901961, green: 0.6745098039, blue: 0.2549019608, alpha: 1), #colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.4, alpha: 1), #colorLiteral(red: 0.9254901961, green: 0.5882352941, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.4, alpha: 1)].complete()
    
//    // MARK: - SELECTED
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.2039215686, green: 0.4039215686, blue: 0.3607843137, alpha: 1), #colorLiteral(red: 0.2980392157, green: 0.7098039216, blue: 0.9607843137, alpha: 1), #colorLiteral(red: 0.2039215686, green: 0.4039215686, blue: 0.3607843137, alpha: 1).adjust(by: -20.0)!, #colorLiteral(red: 0.7176470588, green: 0.7215686275, blue: 0.7137254902, alpha: 1), #colorLiteral(red: 0.7019607843, green: 0.7568627451, blue: 0, alpha: 1)].complete()
    
//    static let level1Colors: [UIColor] = [#colorLiteral(red: 0.9254901961, green: 0.5882352941, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.3647058824, green: 0.3254901961, blue: 0.368627451, alpha: 1), #colorLiteral(red: 0.8972763419, green: 0.9282776713, blue: 1, alpha: 1), #colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.4, alpha: 1)].complete()
}

extension Array where Element: UIColor {
    func complete() -> [UIColor] {
        return self + [self.first!.adjust(by: 20.0)!]
    }
}
