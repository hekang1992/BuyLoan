//
//  BBConfig.swift
//  CreditLoan
//
//  Created by apple on 2024/7/19.
//

import UIKit
import Foundation

let Heavy_Mont = "Mont-Heavy"

let Regular_Mont = "Mont-Regular"

let SESSIONID = "SESSIONID"

let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

extension Double {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension Int {
    func alpix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            self.init(white: 0.0, alpha: 0.0)
            return
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UILabel {
    static func chuangjianLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> PaddedLabel {
        let label = PaddedLabel()
        label.backgroundColor = UIColor.clear
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = font
        return label
    }
}


/* .................................................. */

class NoCopyField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) ||
            action == #selector(paste(_:)) ||
            action == #selector(cut(_:)) ||
            action == #selector(select(_:)) ||
            action == #selector(selectAll(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
