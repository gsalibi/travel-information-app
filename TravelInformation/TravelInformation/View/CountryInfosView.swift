//
//  CountryInfosView.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 02/11/20.
//

import UIKit

class CountryInfosView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("CountryInfosView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
