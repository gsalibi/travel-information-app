//
//  UserDAO.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 13/11/20.
//

import UIKit
import CoreData

class UserFavoritesDAO: DAO {
    
    /// Method responsible for saving a UserFavorites into database
    /// - parameters:
    ///     - objectToBeSaved: UserFavorites to be saved on database
    /// - throws: if an error occurs during saving an object into database
    static func create(_ objectToBeSaved: UserFavorites) throws {
        do {
            // add object to be saved to the context
            CoreDataManager.sharedInstance.persistentContainer.viewContext.insert(objectToBeSaved)
            
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw error
        }
    }
    
    /// Method responsible for updating a UserFavorites into database
    /// - parameters:
    ///     - objectToBeUpdated: UserFavorites to be updated on database
    /// - throws: if an error occurs during updating an object into database
    static func update(_ objectToBeUpdated: UserFavorites) throws {
        do {
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw error
        }
    }
    
    /// Method responsible for deleting a UserFavorites from database
    /// - parameters:
    ///     - objectToBeDeleted: UserFavorites to be deleted on database
    /// - throws: if an error occurs during deleting an object into database
    static func delete(_ objectToBeDeleted: UserFavorites) throws {
        do {
            // delete element from context
            CoreDataManager.sharedInstance.persistentContainer.viewContext.delete(objectToBeDeleted)
            
            // persist the operation
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw error
        }
    }
    
    /// Method responsible for getting all UserFavorites from database
    /// - returns: a list of CountryManaged from database
    /// - throws: if an error occurs during getting an object from database
    static func findAll() throws -> [UserFavorites] {
        // list of seasons to be returned
        var userFavoritesList:[UserFavorites]
        
        do {
            // creating fetch request
            let request:NSFetchRequest<UserFavorites> = fetchRequest()
            
            // perform search
            userFavoritesList = try CoreDataManager.sharedInstance.persistentContainer.viewContext.fetch(request)
        }
        catch {
            throw error
        }
        
        return userFavoritesList
    }
}
