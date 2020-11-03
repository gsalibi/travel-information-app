//
//  ViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 13/10/20.
//

import UIKit

class ViewController: UIViewController {
    
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
        
        NetworkManager.shared.fetchCountries { [weak self] (countries) in
            self?.countries = countries
            
            //Ordering countries by name
            self?.countries = self?.countries.sorted(by: { $0.name.lowercased() < $1.name.lowercased()}) ?? countries
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toDetails":
            guard (selectedCountry != nil) else { print("No selected country"); return }
            let destinationVC = segue.destination as! CountryDetailsViewController
            
            destinationVC.country = selectedCountry

        default:
            print("Segue id not implemented")
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let cellCountry = self.countries[indexPath.row]
        cell.textLabel?.text = cellCountry.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
        
        performSegue(withIdentifier: "toDetails", sender: self)
        
    }
    
    
    
    
}

