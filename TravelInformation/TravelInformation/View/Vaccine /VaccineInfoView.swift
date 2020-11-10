//
//  CulturalInfoView.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 03/11/20.
//

import UIKit

class VaccineInfoView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("VaccineInfoView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.frame = self.stackView.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
   
}
