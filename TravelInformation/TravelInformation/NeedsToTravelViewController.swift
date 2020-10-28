//
//  NeedsToTravelViewController.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 27/10/20.
//

import UIKit

class NeedsToTravelViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var entryNeedsLbl: UILabel!
    @IBOutlet weak var exitNeedsLbl: UILabel!
    @IBOutlet weak var touristVisaLbl: UILabel!
    @IBOutlet weak var businessVisaLbl: UILabel!
    
    
    /// Country's information array.
    /// Comes in the following order: name(0), capitalCity(1), currency(2), oficialLanguage(3), entryNeeds(4), exitNeeds(5), touristVisa(6), businessVisa(7).
    var info: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        title = info[0]
        
        entryNeedsLbl.text = info[4]
        exitNeedsLbl.text = info[5]
        touristVisaLbl.text = info[6]
        businessVisaLbl.text = info[7]
        
    }
    
}
