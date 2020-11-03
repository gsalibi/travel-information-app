//
//  NeedsToTravelViewController.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 27/10/20.
//

import UIKit

class VaccineViewController: UIViewController {
    
    //Outlet of stackView
    @IBOutlet weak var stackView: UIStackView!
    
    //Selected Country recieved from previous screen
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVaccinesInformation()
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color

    }
    
    func setVaccinesInformation() {
        print(country?.vaccines)
//        if let vaccines = country?.vaccines{
//            print(vaccines)
//            for vacineInfo in vaccines.{
//
//        }
//
//        }
    }
    
}
