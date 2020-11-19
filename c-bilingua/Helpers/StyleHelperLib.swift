//
//  StyleHelperLib.swift
//  c-bilingua
//
//  Created by Caro Obregon on 18/11/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class StyleHelperLib: NSObject {

    override init() {
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func hexStringToCGColor (hex:String) -> CGColor {
           var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

           if (cString.hasPrefix("#")) {
               cString.remove(at: cString.startIndex)
           }

           if ((cString.count) != 6) {
            return UIColor.gray.cgColor
           }

           var rgbValue:UInt64 = 0
           Scanner(string: cString).scanHexInt64(&rgbValue)

           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
        ).cgColor
       }

    func roundBordersButton(btn: UIButton){
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
    }

    func wrapAttributedLabelInButton(btn: UIButton, msg: String, myFont: UIFont, myColor: UIColor){
        let para = NSMutableParagraphStyle()
        para.alignment = .natural
        para.lineBreakMode = .byWordWrapping
        let s = NSAttributedString(
            string: msg, attributes: [.paragraphStyle : para])
        btn.setAttributedTitle(s, for: .normal)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.font = myFont
        btn.titleLabel?.textColor = myColor
    }
}
