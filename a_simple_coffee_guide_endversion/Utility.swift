//
//  Utility.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 02.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import Foundation
import UIKit

enum Utility {
    
    static func roundedCornersAndShadowUIView(view: UIView) {
        view.layer.cornerRadius = 8;
        view.layer.masksToBounds = true;
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
                         cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 0.5
        view.layer.masksToBounds = false
    }
}
