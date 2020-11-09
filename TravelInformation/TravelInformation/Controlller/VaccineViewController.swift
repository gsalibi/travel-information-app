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
        let frame = CGRect(x: 0, y: 0, width: self.stackView.frame.width, height: 100)
        let testView = VaccineCodeView(frame: frame, name: "Febre Amarela", demand: "Sim", text: "Vamosdhaos aoidhja daoisdjaon dadhoiashjda dahdoiashda dandoihaoidhaiodhoad dasoidhijoaishdoiasd asdoiahsdoiahd adhoaihdoa daidhasd asodasoid asdoaishd")
        
        self.stackView.addArrangedSubview(testView)
    }
    
}
