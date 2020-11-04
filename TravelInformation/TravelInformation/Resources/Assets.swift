// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let detail = ColorAsset(name: "detail")
  internal static let primary = ColorAsset(name: "primary")
  internal static let secondary = ColorAsset(name: "secondary")
  internal static let text = ColorAsset(name: "text")
  internal static let abecásia = ImageAsset(name: "Abecásia")
  internal static let afeganistão = ImageAsset(name: "Afeganistão")
  internal static let albânia = ImageAsset(name: "Albânia")
  internal static let alemanha = ImageAsset(name: "Alemanha")
  internal static let andorra = ImageAsset(name: "Andorra")
  internal static let angola = ImageAsset(name: "Angola")
  internal static let antíguaEBarbuda = ImageAsset(name: "Antígua e Barbuda")
  internal static let argentina = ImageAsset(name: "Argentina")
  internal static let argélia = ImageAsset(name: "Argélia")
  internal static let armênia = ImageAsset(name: "Armênia")
  internal static let arábiaSaudita = ImageAsset(name: "Arábia Saudita")
  internal static let austrália = ImageAsset(name: "Austrália")
  internal static let azerbaijão = ImageAsset(name: "Azerbaijão")
  internal static let bahamas = ImageAsset(name: "Bahamas")
  internal static let bahrein = ImageAsset(name: "Bahrein")
  internal static let bangladesh = ImageAsset(name: "Bangladesh")
  internal static let barbados = ImageAsset(name: "Barbados")
  internal static let belarus = ImageAsset(name: "Belarus")
  internal static let belize = ImageAsset(name: "Belize")
  internal static let benim = ImageAsset(name: "Benim")
  internal static let bolívia = ImageAsset(name: "Bolívia")
  internal static let botsuana = ImageAsset(name: "Botsuana")
  internal static let brasil = ImageAsset(name: "Brasil")
  internal static let brunei = ImageAsset(name: "Brunei")
  internal static let bulgária = ImageAsset(name: "Bulgária")
  internal static let burkinaFaso = ImageAsset(name: "Burkina Faso")
  internal static let burundi = ImageAsset(name: "Burundi")
  internal static let butão = ImageAsset(name: "Butão")
  internal static let bélgica = ImageAsset(name: "Bélgica")
  internal static let bósniaEHerzegovina = ImageAsset(name: "Bósnia e Herzegovina")
  internal static let caboVerde = ImageAsset(name: "Cabo Verde")
  internal static let camarões = ImageAsset(name: "Camarões")
  internal static let camboja = ImageAsset(name: "Camboja")
  internal static let canadá = ImageAsset(name: "Canadá")
  internal static let catar = ImageAsset(name: "Catar")
  internal static let cazaquistão = ImageAsset(name: "Cazaquistão")
  internal static let chade = ImageAsset(name: "Chade")
  internal static let chile = ImageAsset(name: "Chile")
  internal static let china = ImageAsset(name: "China")
  internal static let chipre = ImageAsset(name: "Chipre")
  internal static let cingapura = ImageAsset(name: "Cingapura")
  internal static let colômbia = ImageAsset(name: "Colômbia")
  internal static let comores = ImageAsset(name: "Comores")
  internal static let congo = ImageAsset(name: "Congo")
  internal static let coréiaDoNorte = ImageAsset(name: "Coréia do Norte")
  internal static let coréiaDoSul = ImageAsset(name: "Coréia do Sul")
  internal static let costaRica = ImageAsset(name: "Costa Rica")
  internal static let costaDoMarfim = ImageAsset(name: "Costa do Marfim")
  internal static let croácia = ImageAsset(name: "Croácia")
  internal static let cuba = ImageAsset(name: "Cuba")
  internal static let dinamarca = ImageAsset(name: "Dinamarca")
  internal static let djibouti = ImageAsset(name: "Djibouti")
  internal static let dominica = ImageAsset(name: "Dominica")
  internal static let egito = ImageAsset(name: "Egito")
  internal static let elSalvador = ImageAsset(name: "El Salvador")
  internal static let emiradosÁrabesUnidos = ImageAsset(name: "Emirados Árabes Unidos")
  internal static let equador = ImageAsset(name: "Equador")
  internal static let eritréia = ImageAsset(name: "Eritréia")
  internal static let escócia = ImageAsset(name: "Escócia")
  internal static let eslováquia = ImageAsset(name: "Eslováquia")
  internal static let eslovênia = ImageAsset(name: "Eslovênia")
  internal static let espanha = ImageAsset(name: "Espanha")
  internal static let estadosUnidos = ImageAsset(name: "Estados Unidos")
  internal static let estônia = ImageAsset(name: "Estônia")
  internal static let eswatini = ImageAsset(name: "Eswatini")
  internal static let etiópia = ImageAsset(name: "Etiópia")
  internal static let fiji = ImageAsset(name: "Fiji")
  internal static let filipinas = ImageAsset(name: "Filipinas")
  internal static let finlândia = ImageAsset(name: "Finlândia")
  internal static let frança = ImageAsset(name: "França")
  internal static let gabão = ImageAsset(name: "Gabão")
  internal static let gana = ImageAsset(name: "Gana")
  internal static let geórgia = ImageAsset(name: "Geórgia")
  internal static let granada = ImageAsset(name: "Granada")
  internal static let grécia = ImageAsset(name: "Grécia")
  internal static let guatemala = ImageAsset(name: "Guatemala")
  internal static let guianaFrancesa = ImageAsset(name: "Guiana Francesa")
  internal static let guiana = ImageAsset(name: "Guiana")
  internal static let guinéEquatorial = ImageAsset(name: "Guiné Equatorial")
  internal static let guinéBissau = ImageAsset(name: "Guiné-Bissau")
  internal static let guiné = ImageAsset(name: "Guiné")
  internal static let gâmbia = ImageAsset(name: "Gâmbia")
  internal static let haiti = ImageAsset(name: "Haiti")
  internal static let holanda = ImageAsset(name: "Holanda")
  internal static let honduras = ImageAsset(name: "Honduras")
  internal static let hungria = ImageAsset(name: "Hungria")
  internal static let ilhasMarshall = ImageAsset(name: "Ilhas Marshall")
  internal static let ilhasSalomão = ImageAsset(name: "Ilhas Salomão")
  internal static let indonésia = ImageAsset(name: "Indonésia")
  internal static let inglaterra = ImageAsset(name: "Inglaterra")
  internal static let iraque = ImageAsset(name: "Iraque")
  internal static let irlandaDoNorte = ImageAsset(name: "Irlanda do Norte")
  internal static let irlanda = ImageAsset(name: "Irlanda")
  internal static let irã = ImageAsset(name: "Irã")
  internal static let islândia = ImageAsset(name: "Islândia")
  internal static let israel = ImageAsset(name: "Israel")
  internal static let itália = ImageAsset(name: "Itália")
  internal static let iêmen = ImageAsset(name: "Iêmen")
  internal static let jamaica = ImageAsset(name: "Jamaica")
  internal static let japão = ImageAsset(name: "Japão")
  internal static let jordânia = ImageAsset(name: "Jordânia")
  internal static let kiribati = ImageAsset(name: "Kiribati")
  internal static let kosovo = ImageAsset(name: "Kosovo")
  internal static let kuwait = ImageAsset(name: "Kuwait")
  internal static let laos = ImageAsset(name: "Laos")
  internal static let lesoto = ImageAsset(name: "Lesoto")
  internal static let letônia = ImageAsset(name: "Letônia")
  internal static let libéria = ImageAsset(name: "Libéria")
  internal static let liechtenstein = ImageAsset(name: "Liechtenstein")
  internal static let lituânia = ImageAsset(name: "Lituânia")
  internal static let luxemburgo = ImageAsset(name: "Luxemburgo")
  internal static let líbano = ImageAsset(name: "Líbano")
  internal static let líbia = ImageAsset(name: "Líbia")
  internal static let macedônia = ImageAsset(name: "Macedônia")
  internal static let madagascar = ImageAsset(name: "Madagascar")
  internal static let malauí = ImageAsset(name: "Malauí")
  internal static let maldivas = ImageAsset(name: "Maldivas")
  internal static let mali = ImageAsset(name: "Mali")
  internal static let malta = ImageAsset(name: "Malta")
  internal static let malásia = ImageAsset(name: "Malásia")
  internal static let marrocos = ImageAsset(name: "Marrocos")
  internal static let mauritânia = ImageAsset(name: "Mauritânia")
  internal static let maurício = ImageAsset(name: "Maurício")
  internal static let micronésia = ImageAsset(name: "Micronésia")
  internal static let moldova = ImageAsset(name: "Moldova")
  internal static let mongólia = ImageAsset(name: "Mongólia")
  internal static let montenegro = ImageAsset(name: "Montenegro")
  internal static let moçambique = ImageAsset(name: "Moçambique")
  internal static let myanmar = ImageAsset(name: "Myanmar")
  internal static let méxico = ImageAsset(name: "México")
  internal static let mônaco = ImageAsset(name: "Mônaco")
  internal static let namíbia = ImageAsset(name: "Namíbia")
  internal static let nauru = ImageAsset(name: "Nauru")
  internal static let nepal = ImageAsset(name: "Nepal")
  internal static let nicarágua = ImageAsset(name: "Nicarágua")
  internal static let nigéria = ImageAsset(name: "Nigéria")
  internal static let noruega = ImageAsset(name: "Noruega")
  internal static let novaZelândia = ImageAsset(name: "Nova Zelândia")
  internal static let níger = ImageAsset(name: "Níger")
  internal static let omã = ImageAsset(name: "Omã")
  internal static let ossétiaDoSul = ImageAsset(name: "Ossétia do Sul")
  internal static let palau = ImageAsset(name: "Palau")
  internal static let palestina = ImageAsset(name: "Palestina")
  internal static let panamá = ImageAsset(name: "Panamá")
  internal static let papuaNovaGuiné = ImageAsset(name: "Papua-Nova Guiné")
  internal static let paquistão = ImageAsset(name: "Paquistão")
  internal static let paraguai = ImageAsset(name: "Paraguai")
  internal static let paísDeGales = ImageAsset(name: "País de Gales")
  internal static let paísesBaixos = ImageAsset(name: "Países Baixos")
  internal static let peru = ImageAsset(name: "Peru")
  internal static let polônia = ImageAsset(name: "Polônia")
  internal static let portugal = ImageAsset(name: "Portugal")
  internal static let quirguistão = ImageAsset(name: "Quirguistão")
  internal static let quênia = ImageAsset(name: "Quênia")
  internal static let reinoUnido = ImageAsset(name: "Reino Unido")
  internal static let repúblicaCentroAfricana = ImageAsset(name: "República Centro-Africana")
  internal static let repúblicaDemocráticaDoCongo = ImageAsset(name: "República Democrática do Congo")
  internal static let repúblicaDominicana = ImageAsset(name: "República Dominicana")
  internal static let repúblicaTcheca = ImageAsset(name: "República Tcheca")
  internal static let repúblicaTurcaDeChipreDoNorte = ImageAsset(name: "República Turca de Chipre do Norte")
  internal static let repúblicaÁrabeSaarauiDemocrática = ImageAsset(name: "República Árabe Saaraui Democrática")
  internal static let romênia = ImageAsset(name: "Romênia")
  internal static let ruanda = ImageAsset(name: "Ruanda")
  internal static let rússia = ImageAsset(name: "Rússia")
  internal static let samoa = ImageAsset(name: "Samoa")
  internal static let sanMarino = ImageAsset(name: "San Marino")
  internal static let santaLúcia = ImageAsset(name: "Santa Lúcia")
  internal static let seicheles = ImageAsset(name: "Seicheles")
  internal static let senegal = ImageAsset(name: "Senegal")
  internal static let serraLeoa = ImageAsset(name: "Serra Leoa")
  internal static let singapura = ImageAsset(name: "Singapura")
  internal static let somália = ImageAsset(name: "Somália")
  internal static let sriLanka = ImageAsset(name: "Sri Lanka")
  internal static let sudãoDoSul = ImageAsset(name: "Sudão do Sul")
  internal static let sudão = ImageAsset(name: "Sudão")
  internal static let suriname = ImageAsset(name: "Suriname")
  internal static let suécia = ImageAsset(name: "Suécia")
  internal static let suíça = ImageAsset(name: "Suíça")
  internal static let sãoCristóvãoENévis = ImageAsset(name: "São Cristóvão e Névis")
  internal static let sãoToméEPríncipe = ImageAsset(name: "São Tomé e Príncipe")
  internal static let sãoVicenteEGranadinas = ImageAsset(name: "São Vicente e Granadinas")
  internal static let sérvia = ImageAsset(name: "Sérvia")
  internal static let síria = ImageAsset(name: "Síria")
  internal static let tadjiquistão = ImageAsset(name: "Tadjiquistão")
  internal static let tailândia = ImageAsset(name: "Tailândia")
  internal static let taiwan = ImageAsset(name: "Taiwan")
  internal static let tanzânia = ImageAsset(name: "Tanzânia")
  internal static let timorLeste = ImageAsset(name: "Timor Leste")
  internal static let togo = ImageAsset(name: "Togo")
  internal static let tonga = ImageAsset(name: "Tonga")
  internal static let trinidadETobago = ImageAsset(name: "Trinidad e Tobago")
  internal static let tunísia = ImageAsset(name: "Tunísia")
  internal static let turcomenistão = ImageAsset(name: "Turcomenistão")
  internal static let turquia = ImageAsset(name: "Turquia")
  internal static let tuvalu = ImageAsset(name: "Tuvalu")
  internal static let ucrânia = ImageAsset(name: "Ucrânia")
  internal static let uganda = ImageAsset(name: "Uganda")
  internal static let uruguai = ImageAsset(name: "Uruguai")
  internal static let uzbequistão = ImageAsset(name: "Uzbequistão")
  internal static let vanuatu = ImageAsset(name: "Vanuatu")
  internal static let vaticano = ImageAsset(name: "Vaticano")
  internal static let venezuela = ImageAsset(name: "Venezuela")
  internal static let vietnã = ImageAsset(name: "Vietnã")
  internal static let zimbábue = ImageAsset(name: "Zimbábue")
  internal static let zâmbia = ImageAsset(name: "Zâmbia")
  internal static let áfricaDoSul = ImageAsset(name: "África do Sul")
  internal static let áustria = ImageAsset(name: "Áustria")
  internal static let índia = ImageAsset(name: "Índia")
  internal static let imagemPais = ImageAsset(name: "imagemPais")
  internal static let imgHome = ImageAsset(name: "imgHome")
  internal static let infoCulturalTag = ImageAsset(name: "infoCulturalTag")
  internal static let requisitosTag = ImageAsset(name: "requisitosTag")
  internal static let selectCtryBtnTag = ImageAsset(name: "selectCtryBtnTag")
  internal static let tertiary = ColorAsset(name: "tertiary")
  internal static let usrIMG = ImageAsset(name: "usrIMG")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
