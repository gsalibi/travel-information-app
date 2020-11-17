//
//  CountryManaged+CoreDataProperties.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 12/11/20.
//
//

import Foundation
import CoreData


extension CountryManaged {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryManaged> {
        return NSFetchRequest<CountryManaged>(entityName: "CountryManaged")
    }

    @NSManaged public var jsonData: Data

}
