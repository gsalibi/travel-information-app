//
//  DAO.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 15/10/20.
//

import UIKit
import CoreData

//MARK: DAO parent class
class DAO {

    /// Helper method to build a NSFetchRequest with an entity considering that
    /// the Entity Name matches the resulting "ClassName + Managed"
    /// - Returns: Fetch Request of Result Type, is the class that represents the Request.entity
    static func fetchRequest<ResultType>() -> NSFetchRequest<ResultType>
    {
        let entityName = String(describing: ResultType.self)
        
        let request:NSFetchRequest = NSFetchRequest<ResultType>(entityName: entityName)
        
        return request
    }
}
