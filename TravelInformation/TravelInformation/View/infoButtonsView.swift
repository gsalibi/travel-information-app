//
//  infoButtonsView.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 03/11/20.
//

import Foundation
import UIKit

class BottomButton: UIButton{
  
    
    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.titleLabel?.font = UIFont(name: "System-Bold", size: 18)
    }
    
    
    func config(text: String, color: UIColor){
        self.setNeedsLayout()
        self.setTitle(text, for: .normal)
        self.setTitleColor(Asset.text.color, for: .normal)
        self.backgroundColor = Asset.secondary.color
        self.layer.cornerRadius = 5
    
    }
    
}
