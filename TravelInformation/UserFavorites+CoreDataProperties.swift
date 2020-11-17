//
//  UserFavorites+CoreDataProperties.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 13/11/20.
//
//

import Foundation
import CoreData


extension UserFavorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserFavorites> {
        return NSFetchRequest<UserFavorites>(entityName: "UserFavorites")
    }

    @NSManaged public var savedCountryNames: [String]?

}
