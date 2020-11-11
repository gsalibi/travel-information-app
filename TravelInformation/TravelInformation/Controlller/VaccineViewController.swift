//
//  NeedsToTravelViewController.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 27/10/20.
//

import UIKit

class VaccineViewController: UITableViewController {
    
    //Selected Country recieved from previous screen
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let vaccines = country?.vaccines {
            return vaccines.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "diseaseCell", for: indexPath) as? DiseaseCell{
            
            if let vaccines = country?.vaccines {
                cell.diseaseLabel.text = vaccines[indexPath.row].disease
                cell.vaccineLabel.text = vaccines[indexPath.row].vaccine
                if vaccines[indexPath.row].guidance != "" {
                    cell.vaccineLabel.text! += " (" + vaccines[indexPath.row].guidance + ")"
                }
                cell.descriptionLabel.text = vaccines[indexPath.row].vaccineDescription
            }
            
            return cell
        }else{
            print("Celula de vacina não instanciada")
            return UITableViewCell()
        }
    }
    
}

