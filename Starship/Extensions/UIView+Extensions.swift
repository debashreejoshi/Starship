//
//  UIView+Extensions.swift
//  Starship
//
//  Created by Debashree on 24/9/21.
//

import UIKit

extension UIView {
    
    /* for CACornerMask:
     layerMaxXMaxYCorner – bottom right corner
     layerMaxXMinYCorner – top right corner
     layerMinXMaxYCorner – bottom left corner
     layerMinXMinYCorner – top left corner
     */
    
    func roundCorners(_ corners:UIRectCorner,_ cornerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }
    
    func set(borderWidth width: CGFloat) {
        self.layer.borderWidth = width
    }
    
    func set(borderColor color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
    
    func rounded() {
        set(cornerRadius: self.frame.height / 2)
    }
    
    func set(cornerRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setCardView(){
        self.layer.shadowColor = UIColor(white: 0.5, alpha: 0.9).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
    }
    
}



