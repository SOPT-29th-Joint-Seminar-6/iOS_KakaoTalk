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
}
