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
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toDetails":
            guard (selectedCountry != nil) else { print("No selected country"); return }
            let destinationVC = segue.destination as! CountryDetailsViewController
            
            destinationVC.info = [] //reset info array
            
            destinationVC.info.append(selectedCountry?.name ?? "No name found")
            destinationVC.info.append(selectedCountry?.capital ?? "No Capital city found")
            destinationVC.info.append(selectedCountry?.language ?? "No language found")
            destinationVC.info.append(selectedCountry?.currency ?? "No currency found")
            destinationVC.info.append(selectedCountry?.entryCurrency ?? "No entryCurrency found")
            destinationVC.info.append(selectedCountry?.exitCurrency ?? "No exitCurrency found")
            destinationVC.info.append(selectedCountry?.passportValidity ?? "No passportValidity info found")
            destinationVC.info.append(selectedCountry?.businessVisa?.rawValue ?? "No businessVisa info found")
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

