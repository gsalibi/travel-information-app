//
//  CulturalInfoView.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 03/11/20.
//

import UIKit

class CulturalInfoView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit(){
//        Bundle.main.loadNibNamed("CulturalInfoView", owner: self, options: nil)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(contentView)
//        contentView.frame = self.stackView.bounds
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
   
    
}
