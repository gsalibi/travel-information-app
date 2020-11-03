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
    @IBOutlet weak var needsToTravelBtn: UIButton!
    @IBOutlet weak var culturalInformationBtn: UIButton!
    @IBOutlet var infosViews: [CountryInfosView]!
    @IBOutlet weak var nameCountryLabel: UILabel!
    @IBOutlet weak var capitalCountryLabel: UILabel!
    
    
    /// Country's information array.
    /// Comes in the following order: name, capitalCity, currency, oficialLanguage, entryNeeds, exitNeeds, touristVisa, businessVisa.
    var info: [String] = []
    
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        
        
        
    }
    //MARK: Set infos in views

    
    func setTexts() {
        if let name = country?.name{
            nameCountryLabel.text = name
        }else{
            nameCountryLabel.text = "País desconhecido 🧐"
        }
        if let capital = country?.name{
            capitalCountryLabel.text = capital
        }else{
            capitalCountryLabel.text = "Capital desconhecida 🧐"
        }
        
        for i in 0 ..< infosViews.count {
            switch i{
            case 0:
                setCountryInfos(infoView: infosViews[i], title: "Moeda", value: country?.currency)
            case 1:
                setCountryInfos(infoView: infosViews[i], title: "Validade do passaporte", value: country?.passportValidity)
            case 2:
                setCountryInfos(infoView: infosViews[i], title: "Visto de turismo", value: country?.touristVisa?.rawValue)
            case 3:
                setCountryInfos(infoView: infosViews[i], title: "Visto de negócio", value: country?.businessVisa?.rawValue)
            default:
                print(i)
            }
        }
    }
    func setCountryInfos(infoView: CountryInfosView, title: String, value: Any?){
     
        if let value = value as? String{
            infoView.title.text = title
            
            infoView.value.text = value
     
            infoView.isHidden = false
        }else{
            infoView.isHidden = true
        }
    }
    
    //MARK: Segues Actions
    
    @IBAction func goVaccineInfo(_ sender: Any) {
    }
    @IBAction func goCultureInfo(_ sender: Any) {
        performSegue(withIdentifier: "infoCulture", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toNeeds":
            if let needsVC = segue.destination as? NeedsToTravelViewController{
                needsVC.info = self.info
                }
        case "infoCulture":
            if let vc = segue.destination as? CulturalInfoViewController{
                vc.country = self.country
            }
            
        default:
            //TODO: Change this to present alert?
            print("no segue found")
        }
    }
    
}

