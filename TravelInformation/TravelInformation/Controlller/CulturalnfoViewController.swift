//
//  CulturalnfoViewController.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 02/11/20.
//

import UIKit

class CulturalInfoViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    let placeholderText = "test text  ajdiasjdidaasddsajddsadsdjsandj \n asdjudjoidasdsi \n"
    let placeholderTitle = "Test Title"
    /// Country's information array.
    /// Comes in the following order: name(0), capitalCity(1), currency(2), oficialLanguage(3), entryNeeds(4), exitNeeds(5), touristVisa(6), businessVisa(7).
    var info: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        title = info[0]
        
        stackView.alignment = .leading
        
        for i in 0...3{
            let title = createTitle(text: placeholderTitle)
            stackView.addArrangedSubview(title)
            stackView.setCustomSpacing(14, after: title)
            for j in 0...2{
                let text = createText(text: placeholderText)
                stackView.addArrangedSubview(text)
                if j == 2{
                    stackView.setCustomSpacing(25, after: text)
                    
                }
            }
        }
        
    }
    
    func createTitle(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
        
    }
    
    func createText(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Roboto", size: 16)
        
        return label
    }
    
}
