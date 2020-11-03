//
//  ViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 13/10/20.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "countryCell")
        
        NetworkManager.shared.fetchCountries { [weak self] (countries) in
            self?.countries = countries
            
            //Ordering countries by name
            self?.countries = self?.countries.sorted(by: { $0.name.lowercased() < $1.name.lowercased()}) ?? countries
        }
        
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        
    }
    
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

