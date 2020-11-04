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
    
    //all CountryInfosViews in this array
    @IBOutlet var infosViews: [CountryInfosView]!
    @IBOutlet weak var nameCountryLabel: UILabel!
    @IBOutlet weak var capitalCountryLabel: UILabel!
    
    @IBOutlet weak var flagImage: UIImageView!
    
    /// Country's information array.
    /// Comes in the following order: name, capitalCity, currency, oficialLanguage, entryNeeds, exitNeeds, touristVisa, businessVisa.
    var info: [String] = []
    
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
       
        
        
        
    }
    //MARK: Set infos in views

    
    func setTexts() {
        //Unraping and setting name of the Country and Capital
        if let name = country?.name{
            nameCountryLabel.text = name
            self.flagImage.image = ImageAsset(name: name).image
            self.navigationItem.title = name //Navigation controller title
        }else{
            //Never happen
            nameCountryLabel.text = "País desconhecido 🧐"
    
        }
        
        if let capital = country?.capital{
            capitalCountryLabel.text = capital
        }else{
            //Hide when we dont have the iniformation
            capitalCountryLabel.isHidden = true
        }
        
        //Populate basic information about the country
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
            case 4:
                setCountryInfos(infoView: infosViews[i], title: "Seguro de Saúde", value: "Recomendável")
            default:
                print(i)
            }
        }
    }
    
    func setCountryInfos(infoView: CountryInfosView, title: String, value: Any?){
     
        //Set values in the CountryInfosView
        if let value = value as? String{
            infoView.title.text = title
            infoView.value.text = value
            
            infoView.isHidden = false
        }else{
            //Hide the view if we dont have the information
            infoView.isHidden = true
        }
    }
    
    //MARK: Segues Actions
    
    //TODO: Remove this function and make the segues directly from the button in the storyboard
    @IBAction func goVaccineInfo(_ sender: Any) {
        performSegue(withIdentifier: "vaccineInfo", sender: nil)
        
    }
    @IBAction func goCultureInfo(_ sender: Any) {
        performSegue(withIdentifier: "infoCulture", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "infoCulture":
            if let vc = segue.destination as? CulturalInfoViewController{
                vc.country = self.country
            }
        case "vaccineInfo":
            if let vc = segue.destination as? VaccineViewController{
                vc.country = self.country
            }
            
        default:
            //TODO: Change this to present alert?
            print("no segue found")
        }
    }
    
}

