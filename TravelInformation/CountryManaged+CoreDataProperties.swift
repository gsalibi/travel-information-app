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

//    @NSManaged public var businessVisa: String?
    @NSManaged public var capital: String?
    @NSManaged public var currency: String?
    @NSManaged public var entryCurrency: String?
    @NSManaged public var exitCurrency: String?
    @NSManaged public var language: String?
    @NSManaged public var name: String
    @NSManaged public var passportValidity: String?
//    @NSManaged public var touristVisa: String?
//    @NSManaged public var vaccines: [Vaccine]?
    @NSManaged public var cultural: [String: String]?
//    @NSManaged public var insurance: Insurance?

}
