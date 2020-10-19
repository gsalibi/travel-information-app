//
//  Country.swift
//  TravelInformation
//
//  Created by João Vitor Lopes Capi on 14/10/20.
//

//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - Country
class Country: Codable {
    let name: String
    let capital, currency, language, passportValidity: String?
    let entryCurrency, exitCurrency: String?
    let touristVisa, businessVisa: Visa?

    enum CodingKeys: String, CodingKey {
        case name, capital, currency, language
        case passportValidity = "passport_validity"
        case entryCurrency = "entry_currency"
        case exitCurrency = "exit_currency"
        case touristVisa = "tourist_visa"
        case businessVisa = "business_visa"
    }

    init(name: String, capital: String?, currency: String?, language: String?, passportValidity: String?, entryCurrency: String?, exitCurrency: String?, touristVisa: Visa?, businessVisa: Visa?) {
        self.name = name
        self.capital = capital
        self.currency = currency
        self.language = language
        self.passportValidity = passportValidity
        self.entryCurrency = entryCurrency
        self.exitCurrency = exitCurrency
        self.touristVisa = touristVisa
        self.businessVisa = businessVisa
    }
}

enum Visa: String, Codable {
    case dispensaDeVistoPorAté180Dias = "Dispensa de visto por até 180  dias"
    case dispensaDeVistoPorAté30Dias = "Dispensa de visto por até 30  dias"
    case dispensaDeVistoPorAté59Dias = "Dispensa de visto por até 59  dias"
    case dispensaDeVistoPorAté60Dias = "Dispensa de visto por até 60  dias"
    case dispensaDeVistoPorAté90Dias = "Dispensa de visto por até 90  dias"
    case dispensaDeVistoPorAtéUmAno = "Dispensa de visto, por até um ano."
    case vistoEmitidoÀChegadaMediantePagamentoDeTaxaDeUSD8000 = "Visto emitido à chegada, mediante pagamento de taxa de USD 80,00"
    case vistoExigido = "Visto exigido"
}

struct CountrySummary: Codable {
    var results: [Country]?
}
