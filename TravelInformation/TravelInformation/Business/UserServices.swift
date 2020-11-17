//
//  UserServices.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 13/11/20.
//


import UIKit

class UserServices {
    
    //MARK: - CoreData
    /// Function responsible for creating a UserFavorite
    /// - parameters:
    ///     - season: UserFavorite to be saved
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func createFavorite(userFavorites: UserFavorites, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try UserFavoritesDAO.create(userFavorites)
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
    
    /// Function responsible for updating a UserFavorites
    /// - parameters:
    ///     - userFavorites: userFavorites to be updated
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func updateFavorite(userFavorites: UserFavorites, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try UserFavoritesDAO.update(userFavorites)
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
    
    /// Function responsible for deleting a userFavorites
    /// - parameters:
    ///     - userFavorites: userFavorites to be deleted
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during saving an object into database (Errors.DatabaseFailure)
    static func deleteCountry(userFavorites: UserFavorites, _ completion: ((_ error: Error?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            
            do {
                // save information
                try UserFavoritesDAO.delete(userFavorites)
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
    
    /// Function responsible for getting all userFavorites
    /// - parameters:
    ///     - completion: closure to be executed at the end of this method
    /// - throws: if an error occurs during getting an object from database (Errors.DatabaseFailure)
    static func getAllFavorites(_ completion: ((_ error: Error?, _ userFavoritesList: [UserFavorites]?) -> Void)?) {
        // block to be executed in background
        let blockForExecutionInBackground: BlockOperation = BlockOperation(block: {
            // error to be returned in case of failure
            var raisedError: Error? = nil
            var userFavoritesList: [UserFavorites]?
            
            do {
                // save information
                userFavoritesList = try UserFavoritesDAO.findAll()
            }
            catch let error {
                raisedError = error
            }
            
            // completion block execution
            if (completion != nil) {
                let blockForExecutionInMain: BlockOperation = BlockOperation(block: {completion!(raisedError, userFavoritesList)})
                
                // execute block in main
                QueueManager.sharedInstance.executeBlock(blockForExecutionInMain, queueType: QueueManager.QueueType.main)
            }
        })
        
        // execute block in background
        QueueManager.sharedInstance.executeBlock(blockForExecutionInBackground, queueType: QueueManager.QueueType.serial)
    }
    
    static func createCountryListFromFavorites(favorite: UserFavorites) -> [Country] {
        
        var managedCountriesAtCoreData: [CountryManaged] = []
        var countryListFromCoreData: [Country] = []
        var countryListFromFavorites: [Country] = []
        var favoriteNames: [String] = []
        
        CountryServices.getAllCountries { (error, managedCountryList) in
            if (error == nil) {
                // assign country list
                countryListFromCoreData = CountryServices.convertManagedListToCountriesList(manageds: managedCountriesAtCoreData)
                
                
                
                if let favoriteNames = favorite.savedCountryNames{
                    for countryName in favoriteNames {
                        for country in countryListFromCoreData{
                            if countryName == country.name{
                                countryListFromFavorites.append(country)
                            }
                        }
                    }
                }
                
            }
            else {
                // display error here because it was not possible to load season list
            }
        }
        return countryListFromFavorites
        
    }
    
    static func convertCountryListFromManaged(managed: CountryManaged) -> [Country] {
        
        var countryList:[Country] = []
        
        
        if let countryList = try? JSONDecoder().decode([Country].self, from: managed.jsonData){
            return countryList
        }
        
        return countryList
        
    }
    
//    static func convertCountryListToManagedList(countries: [Country]) -> [CountryManaged] {
//
//        var countriesForCoreData : [CountryManaged] = []
//        var managed: CountryManaged?
//        for country in countries{
//            managed = CountryServices.convertManagedFromCountry(country: country)
//            countriesForCoreData.append(managed!)
//        }
//        return countriesForCoreData
//    }
    
//    static func convertManagedListToCountriesList(manageds: [CountryManaged]) -> [Country]{
//
//        var countries : [Country] = []
//
//
//        for managed in manageds{
//            var country = CountryServices.convertCountryFromManaged(managed: managed)
//            countries.append(country)
//        }
//        return countries
//    }
    
    
    
}
