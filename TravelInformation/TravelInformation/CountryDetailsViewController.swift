//
//  CountryDetailsViewControllwe.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 18/10/20.
//

import UIKit

class CountryDetailsViewController: UIViewController{
    
    @IBOutlet weak var stackView: UIStackView!
    
    //MARK: Country's outlets
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var detailTexLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalCityLbl: UILabel!
    @IBOutlet weak var currencyLbl: UILabel!
    @IBOutlet weak var oficialLanguageLbl: UILabel!
    @IBOutlet weak var needsToTravelBtn: UIButton!
    @IBOutlet weak var culturalInformationBtn: UIButton!
    
    
    /// Country's information array.
    /// Comes in the following order: name, capitalCity, currency, oficialLanguage, entryNeeds, exitNeeds, touristVisa, businessVisa.
    var info: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        title = info[0]
        stackView.backgroundColor = .white
        stackView.isLayoutMarginsRelativeArrangement = true
        
        //handles custom spacing
        stackView.setCustomSpacing(0, after: nameLbl)
        stackView.setCustomSpacing(11, after: currencyLbl)
        stackView.setCustomSpacing(26, after: oficialLanguageLbl)
        stackView.setCustomSpacing(5, after: needsToTravelBtn)
        stackView.setCustomSpacing(28, after: culturalInformationBtn)
        
        //fills data into labels
        nameLbl.text = info[0]
        capitalCityLbl.text = info[1]
        currencyLbl.text! += " \(info[2])"
        oficialLanguageLbl.text! += " \(info[3])"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toNeeds":
            let needsVC = segue.destination as! NeedsToTravelViewController
            needsVC.info = self.info
            
        default:
            //TODO: Change this to present alert?
            print("no segue found")
        }
    }

}

