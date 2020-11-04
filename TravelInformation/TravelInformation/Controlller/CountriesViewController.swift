//
//  ViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 13/10/20.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //reload the tableview every time we change the array
    var countries: [Country] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var selectedCountry: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        //Load tableview cell register
        let nib = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "countryCell")
        
        //Fetch countries from database
        NetworkManager.shared.fetchCountries { [weak self] (countries) in
            self?.countries = countries
            
            //Ordering countries by name
            self?.countries = self?.countries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) ?? countries
        }
        
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        
    }
    
    //MARK: Segues
    //Handling segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "countrySelected":
            guard (selectedCountry != nil) else { print("No selected country"); return }
            let destinationVC = segue.destination as! CountryDetailsViewController
            
            destinationVC.country = selectedCountry
            
        default:
            print("Segue id not implemented")
        }
    }
}

    //MARK: Table View Delegate and Data Source
extension CountriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell{
            let cellCountry = self.countries[indexPath.row]
            cell.name.text = cellCountry.name
            cell.flagImage.image = ImageAsset(name: cellCountry.name).image
            
            return cell
        }else{
            print("cade a ceklula")
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
        performSegue(withIdentifier: "countrySelected", sender: self)
        
    }
    
    
    
    
}

