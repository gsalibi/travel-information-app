//
//  Country.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 14/10/20.
//

//   let country = try? newJSONDecoder().decode([Country].self, from: jsonData)

import Foundation

// MARK: - Country
class Country: Codable {
    
    var name: String
    var capital, currency, language, passportValidity: String?
    var entryCurrency, exitCurrency: String?
    var touristVisa: Visa?
    var businessVisa: Visa?
    var insurance: Insurance?
    var vaccines: [Vaccine]?
    var culture: [String: String]?
    

    enum CodingKeys: String, CodingKey {
        case name, capital, currency, language
        case passportValidity = "passport_validity"
        case entryCurrency = "entry_currency"
        case exitCurrency = "exit_currency"
        case touristVisa = "tourist_visa"
        case businessVisa = "business_visa"
        case insurance = "insurance"
        case vaccines, culture
    }
    

    init(name: String, capital: String?, currency: String?, language: String?, passportValidity: String?, entryCurrency: String?, exitCurrency: String?, touristVisa: Visa?, businessVisa: Visa?, vaccines: [Vaccine]?, culture: [String: String]?, insurance: Insurance?) {
        self.name = name
        self.capital = capital
        self.currency = currency
        self.language = language
        self.passportValidity = passportValidity
        self.entryCurrency = entryCurrency
        self.exitCurrency = exitCurrency
        self.touristVisa = touristVisa
        self.businessVisa = businessVisa
        self.vaccines = vaccines
        self.culture = culture
        self.insurance = insurance
    }
    
    
}

enum Insurance: String, Codable{
    case recommendable = "Recomendavel"
    case highlyRecommendable = "Altamente Recomendavel"
    case mandatory = "Obrigatorio"
}

public enum Visa: String, Codable {
    case dispensaDeVistoPorAté180Dias = "Dispensa de visto por até 180  dias"
    case dispensaDeVistoPorAté30Dias = "Dispensa de visto por até 30  dias"
    case dispensaDeVistoPorAté59Dias = "Dispensa de visto por até 59  dias"
    case dispensaDeVistoPorAté60Dias = "Dispensa de visto por até 60  dias"
    case dispensaDeVistoPorAté90Dias = "Dispensa de visto por até 90  dias"
    case dispensaDeVistoPorAtéUmAno = "Dispensa de visto, por até um ano."
    case vistoEmitidoÀChegadaMediantePagamentoDeTaxaDeUSD8000 = "Visto emitido à chegada, mediante pagamento de taxa de USD 80,00"
    case vistoExigido = "Visto exigido"
}

// MARK: - Vaccine
public class Vaccine: NSObject, Codable {
    public let disease, vaccine, guidance, source: String
    public let vaccineDescription: String

    public enum CodingKeys: String, CodingKey {
        case disease, vaccine, guidance, source
        case vaccineDescription = "description"
    }

    init(disease: String, vaccine: String, guidance: String, source: String, vaccineDescription: String) {
        self.disease = disease
        self.vaccine = vaccine
        self.guidance = guidance
        self.source = source
        self.vaccineDescription = vaccineDescription
    }
}

struct CountrySummary: Codable {
    var results: [Country]?
}
