//
//  MyDestiniesViewController.swift
//  TravelInformation
//
//  Created by Ivan Sabino on 13/11/20.
//

import UIKit

class MyDestiniesViewController: UIViewController {
    var countries: [Country] = []
    
    enum Segment{
        case favCountry
        case checklist
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selectedCountry: Country?
    var favoritesCountries: [String] = []
    var allCountries : [Country] = []
    var segmentSelected : Segment = .favCountry
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set tableviewDelegate
        tableView.delegate = self
        tableView.dataSource = self
        
        //Load tableview cell register
        let nib = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "countryCell")
        
        self.segmentConfig()
//         self.fetchCountries()
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Asset.text.color as Any]
        filterCountries()
    }

    override func viewWillAppear(_ animated: Bool) {
        filterCountries()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.navigationController?.navigationBar.prefersLargeTitles = false

        }

    }
    
    //Filter countries by favoites
    func filterCountries(){
        self.favoritesCountries  = defaults.stringArray(forKey: "favorites") ?? []

        if !allCountries.isEmpty{
        countries = allCountries.filter({ (country) -> Bool in
            var isContain = false
            for fav in favoritesCountries{
                if country.name == fav{
                    isContain = true
                }
            }
            return isContain
        })
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        }else{
            fetchCountries()
        }
        
    }
    
    //Fetch countries if hadnt have time to load in the previous screen
    
    func fetchCountries(){
        let manager = NetworkManager()
        
        //Fetch countries from database
        manager.fetchCountries { [weak self] (countries, data) in
            self?.allCountries = countries
            //Ordering countries by name
            self?.allCountries = self?.allCountries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) ?? countries
        
            self?.filterCountries()

        }
    }
   
    
    func segmentConfig(){
        self.segmentedControl.isHidden = true
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Asset.blackSegment.color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium) ], for: UIControl.State.selected)
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Asset.text.color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium) ], for: UIControl.State.normal)
        self.segmentedControl.layer.cornerRadius = 5
        self.segmentedControl.layer.masksToBounds = false
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: UIControl.Event.valueChanged)
    }
    @objc func segmentedControlValueChanged(segment: UISegmentedControl) {
        //TODO: If the value was changed, delete searchText
        let index = segment.selectedSegmentIndex
        switch index {
        case 0:
            segmentSelected = .favCountry
            updateTableViewAnimated()
            self.tableView.reloadData()
            
        case 1:
            segmentSelected = .checklist
            self.tableView.reloadData()
        default:
            print("Error in segmented control happens. Actual index equal \(index)")
        }
        
    }
    //Update and animate TableView
    func updateTableViewAnimated(){
        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
    }
    
    
    //MARK: Segues
    //Handling segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "countrySelect":
            guard (selectedCountry != nil) else { print("No selected country"); return }
            let destinationVC = segue.destination as! CountryDetailsViewController
            
            destinationVC.country = selectedCountry
        default:
            print("Segue id not implemented")
        }
    }
}


//MARK: Table View Delegate and Data Source
extension MyDestiniesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentSelected {
        case .favCountry:
            return self.countries.count
            
        case .checklist:
            return 0
            
        }
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Case for favorites
        switch segmentSelected {
        case .favCountry:
            //Case for favorite countries
            if let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell{
                var cellCountry : Country
                
                cellCountry = self.countries[indexPath.row]
                cell.name.text = cellCountry.name
                let imageName = cellCountry.name.replacingOccurrences(of: " " , with: "").lowercased().folding(options: .diacriticInsensitive, locale: .current)
                cell.flagImage.image = ImageAsset(name: imageName).image
                
                return cell
            }
        case .checklist:
            //Case for checklist
            return UITableViewCell()
            
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedCountry = countries[indexPath.row]
        
        performSegue(withIdentifier: "countrySelect", sender: self)
        
    }
    
    
    
    
}

extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}
