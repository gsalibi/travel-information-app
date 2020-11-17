//
//  HomeScreenViewController.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 29/10/20.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameSaudationLabel: UILabel!
    @IBOutlet weak var firstCuurrencyNameLabel: UILabel!
    @IBOutlet weak var firstCurrencyValueLabel: UILabel!
    
    @IBOutlet weak var secondCurrencyNameLabel: UILabel!
    @IBOutlet weak var secondCurrencyValueLabel: UILabel!
    
    var currency : CurrencyConverter? = nil
    var countries : [Country] = []
    var countriesForCoreDataData : Data?
    var countriesAlredyInCoreDataData: Data?
    var countriesAlredyInCoreData : [CountryManaged] = []{
        didSet{
            if let countriesInCoreDataFirst = countriesAlredyInCoreData.first{
                countriesAlredyInCoreDataData = countriesInCoreDataFirst.jsonData
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageProfile.layer.cornerRadius = self.imageProfile.bounds.height/2
        self.settingName()
        self.settingCurrenciesConverter()
        self.fetchCountries()
        
        
        
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.checkLatestUpdate()
    }
    
    
    func settingName(){
        if let name = UIDevice.current.name.components(separatedBy: " ").last{
            self.nameSaudationLabel.text = "Olá, \(name)"
            
        }
   
    }
    func settingCurrenciesConverter(){
        let manager = NetworkManager()
        //Fetch converter from database
        manager.fetchCurrencyConverter(completionHandler: { (currency) in
            
            self.currency = currency
            if let currencyConverter = self.currency{
                let baseValue = currencyConverter.rates["BRL"]
                
                if let baseValue = baseValue{
                    let firstName = "USD"
                    let firstValue = (baseValue / currency.rates[firstName]!)
                    let secondName = "EUR"
                    let secondValue = baseValue / currency.rates[secondName]!
                    
                    DispatchQueue.main.async {
                        self.secondCurrencyValueLabel.text = "R$ \(round(secondValue*100)/100)"
                        self.firstCurrencyValueLabel.text = "R$ \(round(firstValue*100)/100)"
                        
                    }
                }
                
                
            }
        })
        
    }
    
    func fetchCountries(){
        let manager = NetworkManager()

        //Fetch countries from database
        manager.fetchCountries { [weak self] (countries, countriesAsData) in
            self?.countries = countries
            self?.countriesForCoreDataData = countriesAsData
            
            //Ordering countries by name
            self?.countries = self?.countries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) ?? countries
                        
            CountryServices.getAllCountries{ (error, manageds) in
                
                if (error == nil) {
                    // assign country list
                    self?.countriesAlredyInCoreData = manageds!
                }
                else {
                    // display error here because it was not possible to load season list
                }
                
            }

            self?.saveCountriesToCoreData()
        }
        
    }
    
    func saveCountriesToCoreData(){
        if let savedCountries = self.countriesAlredyInCoreData.first {
            if savedCountries.jsonData != countriesForCoreDataData{
                CountryServices.deleteCountry(countryManaged: savedCountries) { (error) in
                    if error == nil {
                        let countryCD = CountryManaged(context: CoreDataManager.sharedInstance.context)
                        if let data = self.countriesForCoreDataData {
                            countryCD.jsonData = data
                        }
                        CountryServices.createCountry(countryManaged: countryCD) { (error) in
                            if error == nil{
                                print("Error saving: \(error)")
                            }
                            else{
                                
                            }
                        }
                        
                    }
                    else {
                        print("error in deleting country foor update")
                    }
                }
            }
        }
        else {
            let countryCD = CountryManaged(context: CoreDataManager.sharedInstance.context)
            if let data = self.countriesForCoreDataData {
                
                countryCD.jsonData = data
            }

            CountryServices.createCountry(countryManaged: countryCD) { (error) in
                if error == nil{
                    
                }
                else{
                    print("Error saving: \(error)")
                }
            if #available(iOS 14.0, *) {
                DispatchQueue.main.async {
                    if let vc = self.tabBarController?.viewControllers?[1].childViewControllerForPointerLock as? MyDestiniesViewController{
                        vc.allCountries = self.countries
                    }
                }
                
            }
        }
        }
    }

    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if countries.count > 0{
            return true
        }else{
            self.fetchCountries()
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countriesList"{
            if let vc = segue.destination as? CountriesViewController{

                self.navigationController?.navigationBar.isHidden = false

            }
        }
    }
}


extension HomeScreenViewController {
    func getLastUpdate() -> String {
        var last_update = ""
        if let url = URL(string: "http://ec2-3-16-29-21.us-east-2.compute.amazonaws.com:3100/update") {
            do {
                let contents = try String(contentsOf: url)
                last_update = contents
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        
        return last_update
    }
    
    func checkLatestUpdate() {
        let server_date = getLastUpdate()
        let local_date = UserDefaults.standard.string(forKey: "update")
        
        if server_date != local_date {
            self.fetchCountries()
            UserDefaults.standard.set(server_date, forKey: "update")
        }
    }
}
