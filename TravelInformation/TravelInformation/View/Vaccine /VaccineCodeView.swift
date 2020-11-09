//
//  VaccineCodeView.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 09/11/20.
//

import UIKit

class VaccineCodeView: UIView {

    
    var diseaseLabel = UILabel()
    var diseaseNameLabel = UILabel()
    
    var demandLabel = UILabel()
    var demandBoolLabel = UILabel()
    
    var descriptionLabel = UILabel()
    var descriptionTextLabel = UILabel()
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
     init(frame: CGRect, name: String, demand: String, text: String) {
        super.init(frame: frame)
        commonInit(name: name, demand: demand, text: text)
        

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(name: " qualé", demand: "nao", text: "q q q rolou?")

        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(name: String, demand: String, text: String){
        self.diseaseLabel.text  = "Doença"
        self.demandLabel.text = "Exigencia de vacinação"
        self.descriptionLabel.text = "Descrição"
        self.diseaseLabel.font = UIFont.systemFont(ofSize: 12)
        self.demandLabel.font = UIFont.systemFont(ofSize: 12)
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        self.diseaseLabel.textColor = Asset.text.color
        self.demandLabel.textColor = Asset.text.color
        self.descriptionLabel.textColor = Asset.text.color
        self.diseaseLabel.alpha = 0.5
        self.demandLabel.alpha = 0.5
        self.descriptionLabel.alpha = 0.5
        
        self.diseaseNameLabel.text = name
        self.demandBoolLabel.text = demand
        self.descriptionTextLabel.text = text
        
        self.labelConfig(label: diseaseNameLabel)
        self.labelConfig(label: demandBoolLabel)
        self.labelConfig(label: descriptionTextLabel)
        
        
        self.backgroundColor = Asset.secondary.color
        self.layer.cornerRadius = 10
        
        
        let separatorVIew = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 28))
        separatorVIew.backgroundColor = .white
        separatorVIew.alpha = 0.2
        
        
        let stackView = UIStackView(arrangedSubviews: [diseaseLabel, diseaseNameLabel, separatorVIew, demandLabel, demandBoolLabel, separatorVIew, descriptionLabel, descriptionTextLabel])
        
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 2.0
        


        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: stackView.frame.width)
        

    }
    
    func labelConfig(label: UILabel){
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = Asset.text.color
        
    }
}
