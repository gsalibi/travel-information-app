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
    
    @IBOutlet weak var heartIcon: UIImageView!
    @IBOutlet weak var favoriteCountryBtn: UIButton!
    //all CountryInfosViews in this array
    @IBOutlet var infosViews: [CountryInfosView]!
    @IBOutlet weak var nameCountryLabel: UILabel!
    @IBOutlet weak var capitalCountryLabel: UILabel!
    
    @IBOutlet weak var flagImage: UIImageView!
    
    /// Country's information array.
    /// Comes in the following order: name, capitalCity, currency, oficialLanguage, entryNeeds, exitNeeds, touristVisa, businessVisa.
    var info: [String] = []
    
    var country : Country?
    
    
    var favorites: [UserFavorites] = []
    var favorite: UserFavorites?
    var heartIsFilled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        
        
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        treatIfFavorite()
    }
    //MARK: Set infos in views
    func setTexts() {
        //Unraping and setting name of the Country and Capital
        if let name = country?.name{
            nameCountryLabel.text = name
            let imageName = name.replacingOccurrences(of: " " , with: "").lowercased().folding(options: .diacriticInsensitive, locale: .current)
            self.flagImage.image = ImageAsset(name: imageName).image
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
    
    
    func treatIfFavorite() {
        UserServices.getAllFavorites { (error, favorites) in
            if let userFavs = favorites, error == nil{
                self.favorites = userFavs
                
                for fav in self.favorites{
                    if fav.savedCountryName == self.country?.name{
                        self.heartIcon.image = UIImage(asset: Asset.heartIconActive)
                        self.heartIsFilled = true
                        
                        self.favorite = fav
                    }
                }
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
    
    //MARK: FAV ACTION
    @IBAction func favoriteCountry(_ sender: Any) {
        
        guard let heartIconImage = heartIcon.image,
              let heartIconNotFilled = (UIImage(named: "heartIcon")),
              let heartFilled = (UIImage(named: "heartIconActive")) else { return }
        
        //eh fav
        if heartIconImage.isEqual(heartFilled) {
            
            heartIcon.image = UIImage(named: "heartIcon")
            heartIsFilled = false
            var userFavorite = UserFavorites(context: CoreDataManager.sharedInstance.context)
            userFavorite.savedCountryName = country?.name ?? "no country name found"
            
            var favoritesStored: [UserFavorites] = []
            
            
            if let favorite = favorite {
                UserServices.deleteCountry(userFavorites: favorite) { (error) in
                    if error != nil{
                        print("Error deleting fav: \(error)")
                    }
                    else{
                        self.favorite = nil
                    }
                }
            }
            
        }
        else if heartIconImage.isEqual(heartIconNotFilled){
            heartIcon.image = UIImage(named: "heartIconActive")
            heartIsFilled = true
            var userFavorite = UserFavorites(context: CoreDataManager.sharedInstance.context)
            userFavorite.savedCountryName = country?.name ?? "no country name found"
            var favoritesStored: [UserFavorites] = []
            UserServices.getAllFavorites { (error, userFavs) in
                if let userFavs = userFavs, error == nil{
                    favoritesStored = userFavs
                    
                    
                    UserServices.createFavorite(userFavorites: userFavorite) { (error) in
                        if error != nil{
                            print("Error creating favorite:\(error)")
                        }
                    }
                    
                }
            }
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
    
    
    func areEqualImages(img1: UIImage, img2: UIImage) -> Bool {

        guard let data1 = img1.pngData() else { return false }
        guard let data2 = img2.pngData() else { return false }

        return data1 == data2
    }
}

