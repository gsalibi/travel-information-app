//
//  CoredataManager.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 14/10/20.
//

import UIKit
import CoreData

class CoreDataManager {
    /// Avoid external instantiation
    private init() {}
    
    //MARK: Singleton
    static let sharedInstance = CoreDataManager()
    
    //MARK: Container
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TravelInformation")
        
        return container
    }()
    
    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    //MARK: Loading
    public func setup(completion: @escaping (_ error: Error?) -> Void){
        persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
            
            if let error = error as NSError? {
                completion(error)
            }
        })
    }
    
    deinit {
        do {
            try context.save()
        } catch {
            print("Unresolved at CoreDataStore deinit error: \(error)")
        }
    }
    
    func documentDirectory() -> String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                    .userDomainMask,
                                                                    true)
        return documentDirectory[0]
    }
    
    func append(toPath path: String, withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        
        return nil
    }
    func read(fromDocumentsWithFileName fileName: String) {
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
    func save(text: String,
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
    
}
