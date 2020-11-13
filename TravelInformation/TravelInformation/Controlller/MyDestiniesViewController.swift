//
//  MyDestiniesViewController.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 13/11/20.
//

import UIKit

class MyDestiniesViewController: UIViewController {
    var countries: [Country] = []

    
    @IBOutlet weak var tableView: UITableView!
    var selectedCountry: Country?
    var favoritesCountries: [String] = ["Chile", "Portugal", "Argentina"]
    var allCountries : [Country] = []{
        didSet{
            countries = allCountries.filter({ (country) -> Bool in
                var isContain = false
                for fav in favoritesCountries{
                    if country.name == fav{
                        isContain = true
                    }
                }
                return isContain
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set tableviewDelegate
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //Load tableview cell register
        let nib = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "countryCell")
        

        self.fetchCountries()
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    func fetchCountries(){
        let manager = NetworkManager()

        //Fetch countries from database
        manager.fetchCountries { [weak self] (countries) in
            self?.allCountries = countries
            
            //Ordering countries by name
            self?.allCountries = self?.countries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) ?? countries
        }
    }
    
    //Update and animate TableView
    func updateTableViewAnimated(){
        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
    }
    
    
//    //MARK: Segues
//    //Handling segues
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "countrySelected":
//            guard (selectedCountry != nil) else { print("No selected country"); return }
//            let destinationVC = segue.destination as! CountryDetailsViewController
//
//            destinationVC.country = selectedCountry
//
//        default:
//            print("Segue id not implemented")
//        }
//    }
}

//MARK: Table View Delegate and Data Source
extension MyDestiniesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return self.countries.count
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell{
            var cellCountry : Country
            
            cellCountry = self.countries[indexPath.row]
            cell.name.text = cellCountry.name
            let imageName = cellCountry.name.replacingOccurrences(of: " " , with: "").lowercased().folding(options: .diacriticInsensitive, locale: .current)
            cell.flagImage.image = ImageAsset(name: imageName).image
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        self.selectedCountry = countries[indexPath.row]
        
        performSegue(withIdentifier: "countrySelected", sender: self)
        
    }
    
    
    
    
}
