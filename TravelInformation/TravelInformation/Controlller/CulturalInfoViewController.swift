//
//  CulturalInfoViewController.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 03/11/20.
//

import UIKit

class CulturalInfoViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCulturalInfos()
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color

        
        // Do any additional setup after loading the view.
    }
    

    func setCulturalInfos(){
        let spacingView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        spacingView.backgroundColor = .clear
        self.stackView.addSubview(spacingView)
        if let cultural = country?.culture as? [String : String]{
            for info in cultural.keys{
                let title = UILabel()
                title.text = info
                title.font = UIFont(name: "Roboto-Bold", size: 20)
                title.textColor = Asset.text.color

                title.numberOfLines = 0
                
                let description = UILabel()
                description.text = cultural[info]
                description.font = UIFont(name: "Roboto-Regular", size: 16)
                description.textColor = Asset.text.color
                description.numberOfLines = 0
                
                
                stackView.addArrangedSubview(title)
                stackView.addArrangedSubview(description)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
