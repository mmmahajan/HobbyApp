//
//  AppAnimation.swift
//  HobbyApp
//
//  Created by Manish Mahajan on 08/01/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class AppAnimation {
    class func transitionAnimation(component: UIView, duration: Double, image: UIImage) {
        UIView.transition(with: component, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let com = component as! UIButton
            com.setImage(image, for: .normal)
        }, completion: nil)
    }
}
