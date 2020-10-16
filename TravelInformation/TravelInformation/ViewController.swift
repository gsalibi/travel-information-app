//
//  ViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 13/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.shared.fetchCountries { [weak self] (countries) in
            self?.countries = countries
            DispatchQueue.main.async {
              self?.tableView.reloadData()
            }
        }
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellCountry = self.countries[indexPath.row]
        cell.textLabel?.text = cellCountry.name
        
        return cell
    }
    
    
    
    
    
}

