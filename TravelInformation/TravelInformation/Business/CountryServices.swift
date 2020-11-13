//
//  CountryServices.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 15/10/20.
//

import UIKit

class CountryServices {
    
    //MARK: - CoreData
    /// Function responsible for creating a Country
    /// - parameters:
    ///     - season: Country to be saved
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func createCountry(countryManaged: CountryManaged, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try CountryDAO.create(countryManaged)
            }
            catch let error {
                raisedError = error
            }
            
            // completion block execution
            if (completion != nil) {
                let blockForExecutionInMain: BlockOperation = BlockOperation(block: {completion!(raisedError)})
                
                // execute block in main
                QueueManager.sharedInstance.executeBlock(blockForExecutionInMain, queueType: QueueManager.QueueType.main)
            }
        })
        
        // execute block in background
        QueueManager.sharedInstance.executeBlock(blockForExecutionInBackground, queueType: QueueManager.QueueType.serial)
    }
    
    /// Function responsible for updating a country
    /// - parameters:
    ///     - countryManaged: countryManaged to be updated
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func updateCountry(countryManaged: CountryManaged, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try CountryDAO.update(countryManaged)
            }
            catch let error {
                raisedError = error
            }
            
            // completion block execution
            if (completion != nil) {
                let blockForExecutionInMain: BlockOperation = BlockOperation(block: {completion!(raisedError)})
                
                // execute block in main
                QueueManager.sharedInstance.executeBlock(blockForExecutionInMain, queueType: QueueManager.QueueType.main)
            }
        })
        
        // execute block in background
        QueueManager.sharedInstance.executeBlock(blockForExecutionInBackground, queueType: QueueManager.QueueType.serial)
    }
    
    /// Function responsible for deleting a country
    /// - parameters:
    ///     - countryManaged: country to be deleted
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func deleteCountry(countryManaged: CountryManaged, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try CountryDAO.delete(countryManaged)
            }
            catch let error {
                raisedError = error
            }
            
            // completion block execution
            if (completion != nil) {
                let blockForExecutionInMain: BlockOperation = BlockOperation(block: {completion!(raisedError)})
                
                // execute block in main
                QueueManager.sharedInstance.executeBlock(blockForExecutionInMain, queueType: QueueManager.QueueType.main)
            }
        })
        
        // execute block in background
        QueueManager.sharedInstance.executeBlock(blockForExecutionInBackground, queueType: QueueManager.QueueType.serial)
    }
    
    /// Function responsible for getting all seasons
    /// - parameters:
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during getting an object from database (Errors.DatabaseFailure)
    static func getAllCountries(_ completion: ((_ error: Error?, _ countryManagedList: [CountryManaged]?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            var countryManagedList: [CountryManaged]?
            
            do {
                // save information
                countryManagedList = try CountryDAO.findAll()
            }
            catch let error {
                raisedError = error
            }
            
            // completion block execution
            if (completion != nil) {
                let blockForExecutionInMain: BlockOperation = BlockOperation(block: {completion!(raisedError, countryManagedList)})
                
                // execute block in main
                QueueManager.sharedInstance.executeBlock(blockForExecutionInMain, queueType: QueueManager.QueueType.main)
            }
        })
        
        // execute block in background
        QueueManager.sharedInstance.executeBlock(blockForExecutionInBackground, queueType: QueueManager.QueueType.serial)
    }
    
    static func convertManagedFromCountry(country: Country) -> CountryManaged {
        let managed = CountryManaged(context:CoreDataManager.sharedInstance.context)
        
        managed.name = country.name
        managed.capital = country.capital
//        managed.businessVisa = country.businessVisa?.rawValue
        managed.cultural = country.culture
        managed.entryCurrency = country.entryCurrency
        managed.exitCurrency = country.exitCurrency
        managed.language = country.language
        managed.passportValidity = country.passportValidity
//        managed.touristVisa = country.touristVisa?.rawValue
        managed.currency = country.currency
//        managed.vaccines = country.vaccines
        
        return managed
    }
    
    static func convertCountryFromManaged(managed: CountryManaged) -> Country {
        
        let country = Country(name: "", capital: nil, currency: nil, language: nil, passportValidity: nil, entryCurrency: nil, exitCurrency: nil, touristVisa: nil, businessVisa: nil, vaccines: nil, culture: nil, insurance: nil)
        
        country.name = managed.name
        country.capital = managed.capital
//        country.businessVisa = managed.businessVisa
        country.culture = managed.cultural
        country.entryCurrency = managed.entryCurrency
        country.exitCurrency = managed.exitCurrency
        country.language = managed.language
        country.passportValidity = managed.passportValidity
//        country.touristVisa?.rawValue = managed.touristVisa
        country.currency = managed.currency
//        country.vaccines = managed.vaccines
        
        return country
    }
    
    static func convertCountryListToManagedList(countries: [Country]) -> [CountryManaged] {
        
        var countriesForCoreData : [CountryManaged] = []
        var managed: CountryManaged?
        for country in countries{
            managed = CountryServices.convertManagedFromCountry(country: country)
            countriesForCoreData.append(managed!)
        }
        return countriesForCoreData
    }
    
    static func convertManagedListToCountriesList(manageds: [CountryManaged]) -> [Country]{
        
        var countries : [Country] = []
        
        
        for managed in manageds{
            var country = CountryServices.convertCountryFromManaged(managed: managed)
            countries.append(country)
        }
        return countries
    }
    
    
    
}
