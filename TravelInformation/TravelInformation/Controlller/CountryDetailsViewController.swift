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
    @IBOutlet weak var favoriteImage: UIImageView!
    
    //all CountryInfosViews in this array
    @IBOutlet var infosViews: [CountryInfosView]!
    @IBOutlet weak var nameCountryLabel: UILabel!
    @IBOutlet weak var capitalCountryLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var flagImage: UIImageView!
    var isFavorite = false
    var favorites : [String] = []
    
    /// Country's information array.
    /// Comes in the following order: name, capitalCity, currency, oficialLanguage, entryNeeds, exitNeeds, touristVisa, businessVisa.
    var info: [String] = []
    
    var country : Country?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        self.newsView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setFavoriteIcon()
    }
  
    //MARK: Set infos in views
    
    //Set heart icon
    func setFavoriteIcon(){
        self.favorites = defaults.stringArray(forKey: "favorites") ?? []
        
        guard let name = country?.name else {
            self.favoriteImage.image = Asset.heartIcon.image
            isFavorite = false
            return}
        
        if favorites.contains(name){
            self.favoriteImage.image = Asset.selectedHeartIcon.image
            isFavorite = true
        }else{
            self.favoriteImage.image = Asset.heartIcon.image
            isFavorite = false
        }
        
        
    }
    
    func setTexts() {
        //Unraping and setting name of the Country and Capital
        if let name = country?.name{
            nameCountryLabel.text = name
            let imageName = name.replacingOccurrences(of: " " , with: "").lowercased().folding(options: .diacriticInsensitive, locale: .current)
            self.flagImage.image = ImageAsset(name: imageName).image
            self.navigationItem.title = name //Navigation controller title
            let image = ImageAsset(name: "\(imageName)0").image
            self.countryImageView.image = image
            
        }else{
            //Never happen
            nameCountryLabel.text = "País desconhecido 🧐"
            
        }
        updateLabel.text = "Atualizado em " + UserDefaults.standard.string(forKey: "update")!
        
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
                if let insurance = country?.insurance{
                    switch insurance{
                    case .highlyRecommendable:
                        setCountryInfos(infoView: infosViews[i], title: "Seguro de Saúde", value: "Altamente Recomendável")
                    case .recommendable:
                        setCountryInfos(infoView: infosViews[i], title: "Seguro de Saúde", value: "Recomendável")
                        
                    case .mandatory:
                        setCountryInfos(infoView: infosViews[i], title: "Seguro de Saúde", value: "Obrigatório")
                    }
                }
            case 5:
                setCountryInfos(infoView: infosViews[i], title: "Montante máximo de dinheiro para entrar no país sem declarar", value: country?.entryCurrency )
            case 6:
                setCountryInfos(infoView: infosViews[i], title: "Montante máximo de dinheiro para sair do país sem declarar", value: country?.exitCurrency)
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
    //MARK: Actions
    
    @IBAction func favoringCountries(_ sender: Any) {
        guard let name = country?.name else {return}

        if isFavorite{
            UIView.animate(withDuration: 0.4) {
                self.favoriteImage.image = Asset.heartIcon.image

            }

            self.favorites = favorites.filter { (fav) -> Bool in
                if fav == name{
                    return false
                }else{
                    return true
                }
            }
            
            defaults.setValue(self.favorites, forKey: "favorites")
        }else{
            UIView.animate(withDuration: 0.4) {
                self.favoriteImage.image = Asset.selectedHeartIcon.image
            }

            favorites.append(name)
            defaults.setValue(favorites, forKey: "favorites")
    }
    
    
    isFavorite = !isFavorite
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

