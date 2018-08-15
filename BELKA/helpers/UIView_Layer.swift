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
