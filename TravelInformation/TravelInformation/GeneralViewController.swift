//
//  GeneralViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 17/11/20.
//

import UIKit

class GeneralViewController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}
