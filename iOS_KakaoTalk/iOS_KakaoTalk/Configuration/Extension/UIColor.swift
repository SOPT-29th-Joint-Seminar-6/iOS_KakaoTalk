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
        var hue: CGFloat = CGFloat.zero, saturation: CGFloat = CGFloat.zero, brightness: CGFloat = CGFloat.zero, alpha: CGFloat = CGFloat.zero

        grayColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return brightness
    }
}
