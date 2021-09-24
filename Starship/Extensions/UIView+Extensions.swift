//
//  UIView+Extensions.swift
//  Starship
//
//  Created by Debashree on 24/9/21.
//

import UIKit

extension UIView {
    
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
    
    func showLoader(_ color:UIColor?){
        
        let loaderView  = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        loaderView.tag = -888754
        loaderView.backgroundColor = color
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        loader.style = .large
        loader.color = .darkGray
        loader.startAnimating()
        loaderView.addSubview(loader)
        self.addSubview(loaderView)
    }
    
    func dismissLoader(){
        self.viewWithTag(-888754)?.removeFromSuperview()
    }
}



