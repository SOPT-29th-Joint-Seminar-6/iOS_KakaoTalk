//
//  UIColor.swift
//  iOS_KakaoTalk
//
//  Created by Yi Joon Choi on 2021/11/13.
//

import UIKit

extension UIColor {
    static var systemGrayBrightness: CGFloat {
        let grayColor: UIColor = UIColor.systemGray
        var brightness: CGFloat = CGFloat.zero

        grayColor.getHue(nil, saturation: nil, brightness: &brightness, alpha: nil)
        return brightness
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

internal extension UIColor {
    @nonobjc class var darkGray: UIColor {
        return UIColor(rgb: 0x191919)
    }
    
    @nonobjc class var gray4: UIColor {
        return UIColor(rgb: 0x747474)
    }
    
    @nonobjc class var gray3: UIColor {
        return UIColor(rgb: 0xA3A3A3)
    }
    
    @nonobjc class var gray2: UIColor {
        return UIColor(rgb: 0xB9B9B9)
    }
    
    @nonobjc class var gray1: UIColor {
        return UIColor(rgb: 0xC4C4C4)
    }
    
    @nonobjc class var pointColor: UIColor {
        return UIColor(rgb: 0xEA6039)
    }
}
