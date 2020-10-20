//
//  CountryDetailsViewControllwe.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 18/10/20.
//

import UIKit

class CountryDetailsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var info: [String] = []
    var cellTitles = ["País: ", "Capital: ", "Modeda: ", "Língua: ", "Exigência de entrada: ", "Exigência de saída: ", "Visto de Turismo: ",  "Visto de Negócios: "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension CountryDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0 // change the line break to WordWrap
        cell.textLabel?.text = cellTitles[indexPath.row] + info[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

