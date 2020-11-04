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
    let insurance: Insurance?
    let vaccines: Vaccines
    let culture: [String: String]?

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

    init(name: String, capital: String?, currency: String?, language: String?, passportValidity: String?, entryCurrency: String?, exitCurrency: String?, touristVisa: Visa?, businessVisa: Visa?, vaccines: Vaccines, culture: [String: String]?, insurance: Insurance?) {
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

enum Vaccines: Codable {
    case string(String)
    case vaccineElementArray([VaccineElement])
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([VaccineElement].self) {
            self = .vaccineElementArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(Vaccines.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Vaccines"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .vaccineElementArray(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

// MARK: - VaccineElement
class VaccineElement: Codable {
    let disease: String
    let vaccine: VaccineEnum
    let guidance: Guidance
    let source: Source
    let vaccineDescription: String

    enum CodingKeys: String, CodingKey {
        case disease, vaccine, guidance, source
        case vaccineDescription = "description"
    }

    init(disease: String, vaccine: VaccineEnum, guidance: Guidance, source: Source, vaccineDescription: String) {
        self.disease = disease
        self.vaccine = vaccine
        self.guidance = guidance
        self.source = source
        self.vaccineDescription = vaccineDescription
    }
}

enum Guidance: String, Codable {
    case empty = ""
    case exigência = "Exigência"
    case recomendação = "Recomendação"
}

enum Source: String, Codable {
    case oms = "OMS"
    case sourceOMS = "-OMS"
}

enum VaccineEnum: String, Codable {
    case não = "Não"
    case sim = "Sim"
}


struct CountrySummary: Codable {
    var results: [Country]?
}
