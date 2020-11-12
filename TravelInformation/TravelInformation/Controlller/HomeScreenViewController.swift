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
    @IBOutlet weak var nameSaudationLbl: UIView!
    @IBOutlet weak var firstCuurrencyNameLabel: UILabel!
    @IBOutlet weak var firstCurrencyValueLabel: UILabel!
    
    @IBOutlet weak var secondCurrencyNameLabel: UILabel!
    @IBOutlet weak var secondCurrencyValueLabel: UILabel!
    
    var currency : CurrencyConverter? = nil
    var countries : [Country] = []
    
    override func viewDidLoad() {
        self.imageProfile.layer.cornerRadius = self.imageProfile.bounds.height/2
        self.settingName()
        self.settingCurrenciesConverter()
        self.fetchCountries()
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    func settingName(){
        print(UIDevice.current.name.replacingOccurrences(of:"iPhone", with: ""))
        print(UIDevice.current.name)
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
        manager.fetchCountries { [weak self] (countries) in
            self?.countries = countries
            
            //Ordering countries by name
            self?.countries = self?.countries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) ?? countries
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
                vc.countries = self.countries
                self.navigationController?.navigationBar.isHidden = false

            }
        }
    }
}
