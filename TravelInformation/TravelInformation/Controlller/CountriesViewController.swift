//
//  ViewController.swift
//  TravelInformation
//
//  Created by Gustavo Salibi on 13/10/20.
//

import UIKit

class CountriesViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //reload the tableview every time we change the array
    var countries: [Country] = []{
        didSet{
            self.countries = self.countries.sorted(by: { $0.name.lowercased().folding(options: .diacriticInsensitive, locale: .current) < $1.name.lowercased().folding(options: .diacriticInsensitive, locale: .current)}) 
        }
    }
    var selectedCountry: Country?
    
    var countriesFromCoreData : [CountryManaged] = []
    
    var dismissTapGesture = UITapGestureRecognizer()
    var searchCountries: ([Country]?, Int) = ([],0)
    var filteredCountries: [Country]? = nil
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set tableviewDelegate
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarConfiguration()
        
        CountryServices.getAllCountries{ (error, manageds) in
            
            if (error == nil) {
                // assign country list
                self.countriesFromCoreData = manageds!
                self.countries = CountryServices.convertManagedListToCountriesList(manageds: self.countriesFromCoreData)
                
                // reload table view with season information
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
            }
            else {
                // display error here because it was not possible to load season list
            }
            
        }
        
        
        //Load tableview cell register
        let nib = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "countryCell")
        

        
        //change back button collor of navigation bar
        self.navigationItem.backBarButtonItem?.tintColor = Asset.detail.color
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
//    func loadCountriesFromCoreData(){
//        CountryServices.getAllCountries { (error, countriesFromCoreData) in
//            if (error == nil) {
//                // assign country list
//                self.countriesFromCoreData = countriesFromCoreData!
//            }
//            else {
//                print("\(error) load")
//            }
//        }
//    }
    
    //Configuration search bar and gesture
    
    func searchBarConfiguration(){
        //Search bar
        self.searchBar.delegate = self
        if #available(iOS 13.0, *) {
            self.searchBar.searchTextField.textColor = Asset.text2.color
        } else {
            // Fallback on earlier versions
        }
        
        dismissTapGesture =  UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        
        
    }
    
    //Update and animate TableView
    func updateTableViewAnimated(){
        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
    }
    
    //MARK: Gestures Handlers
    @objc func dismissKeyboard(sender: UITapGestureRecognizer?){
        self.searchBar.endEditing(true)
        self.tableView.removeGestureRecognizer(self.dismissTapGesture)
        
    }
    
    //MARK: Segues
    //Handling segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "countrySelected":
            guard (selectedCountry != nil) else { print("No selected country"); return }
            let destinationVC = segue.destination as! CountryDetailsViewController
            
            destinationVC.country = selectedCountry
            
        default:
            print("Segue id not implemented")
        }
    }
}

//MARK: Table View Delegate and Data Source
extension CountriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let filteredCountries = filteredCountries{
            return filteredCountries.count
        }else{
            return self.countries.count
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell{
            var cellCountry : Country
            
            if let filteredCountries = filteredCountries{
                cellCountry = filteredCountries[indexPath.row]
            }else{
                cellCountry = self.countries[indexPath.row]
            }
            
            cell.name.text = cellCountry.name
            let imageName = cellCountry.name.replacingOccurrences(of: " " , with: "").lowercased().folding(options: .diacriticInsensitive, locale: .current)
            cell.flagImage.image = ImageAsset(name: imageName).image
            
            return cell
        }else{
            print("cade a ceklula")
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let filteredCountries = self.filteredCountries{
            self.selectedCountry = filteredCountries[indexPath.row]
        }else{
            self.selectedCountry = countries[indexPath.row]
        }
        performSegue(withIdentifier: "countrySelected", sender: self)
        
    }
    
    
    
    
}

//MARK: Search Bar Delegates
extension CountriesViewController: UISearchBarDelegate{
    func resetSearchBar() {
        self.filteredCountries = nil
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //Add gesture to dismiss keyboard clicking outside the keyboard
        self.tableView.addGestureRecognizer(self.dismissTapGesture)
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //When ERASE has to re-search for results, so, we have to save the count of the last string writed in the searchText to verify if was erased
        
        if searchText.count < self.searchCountries.1 {
            resetSearchBar()
        }
        
        //Update size of actual search
        self.searchCountries.1 = searchText.count
        
        //Empty case
        if searchText.isEmpty == true {
            resetSearchBar()
        }
        
        //Filter case
        if searchText.isEmpty == false {
            if let filtered = filterFor(name: searchText, allCountries: self.countries) {
                self.filteredCountries = filtered
            }
        }
        
        updateTableViewAnimated()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        self.tableView.removeGestureRecognizer(dismissTapGesture)
    }
    
    func filterFor(name: String, allCountries: [Country]) -> [Country]? {
        //Transform all in uppercased
        var name = name.uppercased()
        name = name.folding(options: .diacriticInsensitive, locale: Locale(identifier: "pt_BR"))
        var finalResult: [Country] = []
        var filteredNames: [String] = []
        
        //Filter if country name begin with search
        let filterByInitial = allCountries.filter { (countries) -> Bool in
            var countryName = countries.name.uppercased()
            countryName = countryName.folding(options: .diacriticInsensitive, locale: Locale(identifier: "pt_BR"))
    
            if countryName.hasPrefix(name){
                filteredNames.append(countryName)
                return true
            }else{
                return false
            }
        }
        
        //Filter if country name contains search
        let filterCountries = allCountries.filter({ (countries) -> Bool in
   
            var countryName = countries.name.uppercased()
            countryName = countryName.folding(options: .diacriticInsensitive, locale: Locale(identifier: "pt_BR"))
            if !filteredNames.contains(countryName){
                if countryName.contains(name) {
                    return true
                }
                return false
            }else{
                return false
            }
        })
        
        //Append arrays to display first the country that began with searched string
        finalResult.append(contentsOf: filterByInitial)
        finalResult.append(contentsOf: filterCountries)
        return finalResult
        
    }
    
}
