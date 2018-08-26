//
//  UIView_Layer.swift
//  BELKA
//
//  Created by Yaroslav Tsepkov on 15.08.2018.
//  Copyright © 2018 Yaroslav Tsepkov. All rights reserved.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            return layer.cornerRadius = newValue
        }
    }
}

class Button: UIButton {
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initial()
    }
    
    func initial() {
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 3
        layer.borderColor = nil
    }
}

