//
//  CountryDAO.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 15/10/20.
//

import UIKit
import CoreData

class CountryDAO: DAO {
    
    /// Method responsible for saving a CountryManaged into database
    /// - parameters:
    ///     - objectToBeSaved: CountryManaged to be saved on database
    /// - throws: if an error occurs during saving an object into database
    static func create(_ objectToBeSaved: CountryManaged) throws {
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
    
    private func save(text: String,
                      toDirectory directory: String,
                      withFileName fileName: String) {
        guard let filePath = self.append(toPath: directory,
                                         withPathComponent: fileName) else {
            return
        }
        
        do {
            try text.write(toFile: filePath,
                           atomically: true,
                           encoding: .utf8)
        } catch {
            print("Error", error)
            return
        }
        
        print("Save successful")
    }
    
    private func read(fromDocumentsWithFileName fileName: String) {
        guard let filePath = self.append(toPath: self.documentDirectory(),
                                         withPathComponent: fileName) else {
                                            return
        }
        
        do {
            let savedString = try String(contentsOfFile: filePath)
            
            print(savedString)
        } catch {
            print("Error reading saved file")
        }
    }
    
    /// Method responsible for updating a CountryManaged into database
    /// - parameters:
    ///     - objectToBeUpdated: CountryManaged to be updated on database
    /// - throws: if an error occurs during updating an object into database
    static func update(_ objectToBeUpdated: CountryManaged) throws {
        do {
            // persist changes at the context
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
        }
        catch {
            throw error
        }
    }
    
    /// Method responsible for deleting a CountryManaged from database
    /// - parameters:
    ///     - objectToBeDeleted: CountryManaged to be deleted on database
    /// - throws: if an error occurs during deleting an object into database
    static func delete(_ objectToBeDeleted: CountryManaged) throws {
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
    
    /// Method responsible for getting all CountryManaged from database
    /// - returns: a list of CountryManaged from database
    /// - throws: if an error occurs during getting an object from database
    static func findAll() throws -> [CountryManaged] {
        // list of seasons to be returned
        var countryManagedList:[CountryManaged]
        
        do {
            // creating fetch request
            let request:NSFetchRequest<CountryManaged> = fetchRequest()
            
            // perform search
            countryManagedList = try CoreDataManager.sharedInstance.persistentContainer.viewContext.fetch(request)
        }
        catch {
            throw error
        }
        
        return countryManagedList
    }
}
