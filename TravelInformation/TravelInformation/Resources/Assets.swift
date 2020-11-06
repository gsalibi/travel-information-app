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
  internal static let tertiary = ColorAsset(name: "tertiary")
  internal static let text = ColorAsset(name: "text")
  internal static let abecasia = ImageAsset(name: "abecasia")
  internal static let afeganistao = ImageAsset(name: "afeganistao")
  internal static let africadosul = ImageAsset(name: "africadosul")
  internal static let albania = ImageAsset(name: "albania")
  internal static let alemanha = ImageAsset(name: "alemanha")
  internal static let andorra = ImageAsset(name: "andorra")
  internal static let angola = ImageAsset(name: "angola")
  internal static let antiguaebarbuda = ImageAsset(name: "antiguaebarbuda")
  internal static let arabiasaudita = ImageAsset(name: "arabiasaudita")
  internal static let argelia = ImageAsset(name: "argelia")
  internal static let argentina = ImageAsset(name: "argentina")
  internal static let armenia = ImageAsset(name: "armenia")
  internal static let australia = ImageAsset(name: "australia")
  internal static let austria = ImageAsset(name: "austria")
  internal static let azerbaijao = ImageAsset(name: "azerbaijao")
  internal static let bahamas = ImageAsset(name: "bahamas")
  internal static let bahrein = ImageAsset(name: "bahrein")
  internal static let bangladesh = ImageAsset(name: "bangladesh")
  internal static let barbados = ImageAsset(name: "barbados")
  internal static let belarus = ImageAsset(name: "belarus")
  internal static let belgica = ImageAsset(name: "belgica")
  internal static let belize = ImageAsset(name: "belize")
  internal static let benim = ImageAsset(name: "benim")
  internal static let bolivia = ImageAsset(name: "bolivia")
  internal static let bosniaeherzegovina = ImageAsset(name: "bosniaeherzegovina")
  internal static let botsuana = ImageAsset(name: "botsuana")
  internal static let brasil = ImageAsset(name: "brasil")
  internal static let brunei = ImageAsset(name: "brunei")
  internal static let bulgaria = ImageAsset(name: "bulgaria")
  internal static let burkinafaso = ImageAsset(name: "burkinafaso")
  internal static let burundi = ImageAsset(name: "burundi")
  internal static let butao = ImageAsset(name: "butao")
  internal static let caboverde = ImageAsset(name: "caboverde")
  internal static let camaroes = ImageAsset(name: "camaroes")
  internal static let camboja = ImageAsset(name: "camboja")
  internal static let canada = ImageAsset(name: "canada")
  internal static let catar = ImageAsset(name: "catar")
  internal static let cazaquistao = ImageAsset(name: "cazaquistao")
  internal static let chade = ImageAsset(name: "chade")
  internal static let chile = ImageAsset(name: "chile")
  internal static let china = ImageAsset(name: "china")
  internal static let chipre = ImageAsset(name: "chipre")
  internal static let colombia = ImageAsset(name: "colombia")
  internal static let comores = ImageAsset(name: "comores")
  internal static let congo = ImageAsset(name: "congo")
  internal static let coreiadonorte = ImageAsset(name: "coreiadonorte")
  internal static let coreiadosul = ImageAsset(name: "coreiadosul")
  internal static let costadomarfim = ImageAsset(name: "costadomarfim")
  internal static let costarica = ImageAsset(name: "costarica")
  internal static let croacia = ImageAsset(name: "croacia")
  internal static let cuba = ImageAsset(name: "cuba")
  internal static let dinamarca = ImageAsset(name: "dinamarca")
  internal static let djibouti = ImageAsset(name: "djibouti")
  internal static let dominica = ImageAsset(name: "dominica")
  internal static let egito = ImageAsset(name: "egito")
  internal static let elsalvador = ImageAsset(name: "elsalvador")
  internal static let emiradosarabesunidos = ImageAsset(name: "emiradosarabesunidos")
  internal static let equador = ImageAsset(name: "equador")
  internal static let eritreia = ImageAsset(name: "eritreia")
  internal static let escocia = ImageAsset(name: "escocia")
  internal static let eslovaquia = ImageAsset(name: "eslovaquia")
  internal static let eslovenia = ImageAsset(name: "eslovenia")
  internal static let espanha = ImageAsset(name: "espanha")
  internal static let estadosunidos = ImageAsset(name: "estadosunidos")
  internal static let estonia = ImageAsset(name: "estonia")
  internal static let eswatini = ImageAsset(name: "eswatini")
  internal static let etiopia = ImageAsset(name: "etiopia")
  internal static let fiji = ImageAsset(name: "fiji")
  internal static let filipinas = ImageAsset(name: "filipinas")
  internal static let finlandia = ImageAsset(name: "finlandia")
  internal static let franca = ImageAsset(name: "franca")
  internal static let gabao = ImageAsset(name: "gabao")
  internal static let gambia = ImageAsset(name: "gambia")
  internal static let gana = ImageAsset(name: "gana")
  internal static let georgia = ImageAsset(name: "georgia")
  internal static let granada = ImageAsset(name: "granada")
  internal static let grecia = ImageAsset(name: "grecia")
  internal static let guatemala = ImageAsset(name: "guatemala")
  internal static let guiana = ImageAsset(name: "guiana")
  internal static let guianafrancesa = ImageAsset(name: "guianafrancesa")
  internal static let guineBissau = ImageAsset(name: "guine-bissau")
  internal static let guine = ImageAsset(name: "guine")
  internal static let guineequatorial = ImageAsset(name: "guineequatorial")
  internal static let haiti = ImageAsset(name: "haiti")
  internal static let holanda = ImageAsset(name: "holanda")
  internal static let honduras = ImageAsset(name: "honduras")
  internal static let hungria = ImageAsset(name: "hungria")
  internal static let iemen = ImageAsset(name: "iemen")
  internal static let ilhasmarshall = ImageAsset(name: "ilhasmarshall")
  internal static let ilhassalomao = ImageAsset(name: "ilhassalomao")
  internal static let india = ImageAsset(name: "india")
  internal static let indonesia = ImageAsset(name: "indonesia")
  internal static let inglaterra = ImageAsset(name: "inglaterra")
  internal static let ira = ImageAsset(name: "ira")
  internal static let iraque = ImageAsset(name: "iraque")
  internal static let irlanda = ImageAsset(name: "irlanda")
  internal static let irlandadonorte = ImageAsset(name: "irlandadonorte")
  internal static let islandia = ImageAsset(name: "islandia")
  internal static let israel = ImageAsset(name: "israel")
  internal static let italia = ImageAsset(name: "italia")
  internal static let jamaica = ImageAsset(name: "jamaica")
  internal static let japao = ImageAsset(name: "japao")
  internal static let jordania = ImageAsset(name: "jordania")
  internal static let kiribati = ImageAsset(name: "kiribati")
  internal static let kosovo = ImageAsset(name: "kosovo")
  internal static let kuwait = ImageAsset(name: "kuwait")
  internal static let laos = ImageAsset(name: "laos")
  internal static let lesoto = ImageAsset(name: "lesoto")
  internal static let letonia = ImageAsset(name: "letonia")
  internal static let libano = ImageAsset(name: "libano")
  internal static let liberia = ImageAsset(name: "liberia")
  internal static let libia = ImageAsset(name: "libia")
  internal static let liechtenstein = ImageAsset(name: "liechtenstein")
  internal static let lituania = ImageAsset(name: "lituania")
  internal static let luxemburgo = ImageAsset(name: "luxemburgo")
  internal static let macedonia = ImageAsset(name: "macedonia")
  internal static let madagascar = ImageAsset(name: "madagascar")
  internal static let malasia = ImageAsset(name: "malasia")
  internal static let malaui = ImageAsset(name: "malaui")
  internal static let maldivas = ImageAsset(name: "maldivas")
  internal static let mali = ImageAsset(name: "mali")
  internal static let malta = ImageAsset(name: "malta")
  internal static let marrocos = ImageAsset(name: "marrocos")
  internal static let mauricio = ImageAsset(name: "mauricio")
  internal static let mauritania = ImageAsset(name: "mauritania")
  internal static let mexico = ImageAsset(name: "mexico")
  internal static let micronesia = ImageAsset(name: "micronesia")
  internal static let mocambique = ImageAsset(name: "mocambique")
  internal static let moldova = ImageAsset(name: "moldova")
  internal static let monaco = ImageAsset(name: "monaco")
  internal static let mongolia = ImageAsset(name: "mongolia")
  internal static let montenegro = ImageAsset(name: "montenegro")
  internal static let myanmar = ImageAsset(name: "myanmar")
  internal static let namibia = ImageAsset(name: "namibia")
  internal static let nauru = ImageAsset(name: "nauru")
  internal static let nepal = ImageAsset(name: "nepal")
  internal static let nicaragua = ImageAsset(name: "nicaragua")
  internal static let niger = ImageAsset(name: "niger")
  internal static let nigeria = ImageAsset(name: "nigeria")
  internal static let noruega = ImageAsset(name: "noruega")
  internal static let novazelandia = ImageAsset(name: "novazelandia")
  internal static let oma = ImageAsset(name: "oma")
  internal static let ossetiadosul = ImageAsset(name: "ossetiadosul")
  internal static let paisdegales = ImageAsset(name: "paisdegales")
  internal static let paisesbaixos = ImageAsset(name: "paisesbaixos")
  internal static let palau = ImageAsset(name: "palau")
  internal static let palestina = ImageAsset(name: "palestina")
  internal static let panama = ImageAsset(name: "panama")
  internal static let papuaNovaguine = ImageAsset(name: "papua-novaguine")
  internal static let paquistao = ImageAsset(name: "paquistao")
  internal static let paraguai = ImageAsset(name: "paraguai")
  internal static let peru = ImageAsset(name: "peru")
  internal static let polonia = ImageAsset(name: "polonia")
  internal static let portugal = ImageAsset(name: "portugal")
  internal static let quenia = ImageAsset(name: "quenia")
  internal static let quirguistao = ImageAsset(name: "quirguistao")
  internal static let reinounido = ImageAsset(name: "reinounido")
  internal static let republicaarabesaarauidemocratica = ImageAsset(name: "republicaarabesaarauidemocratica")
  internal static let republicacentroAfricana = ImageAsset(name: "republicacentro-africana")
  internal static let republicademocraticadocongo = ImageAsset(name: "republicademocraticadocongo")
  internal static let republicadominicana = ImageAsset(name: "republicadominicana")
  internal static let republicatcheca = ImageAsset(name: "republicatcheca")
  internal static let republicaturcadechipredonorte = ImageAsset(name: "republicaturcadechipredonorte")
  internal static let romenia = ImageAsset(name: "romenia")
  internal static let ruanda = ImageAsset(name: "ruanda")
  internal static let russia = ImageAsset(name: "russia")
  internal static let samoa = ImageAsset(name: "samoa")
  internal static let sanmarino = ImageAsset(name: "sanmarino")
  internal static let santalucia = ImageAsset(name: "santalucia")
  internal static let saocristovaoenevis = ImageAsset(name: "saocristovaoenevis")
  internal static let saotomeeprincipe = ImageAsset(name: "saotomeeprincipe")
  internal static let saovicenteegranadinas = ImageAsset(name: "saovicenteegranadinas")
  internal static let seicheles = ImageAsset(name: "seicheles")
  internal static let senegal = ImageAsset(name: "senegal")
  internal static let serraleoa = ImageAsset(name: "serraleoa")
  internal static let servia = ImageAsset(name: "servia")
  internal static let singapura = ImageAsset(name: "singapura")
  internal static let siria = ImageAsset(name: "siria")
  internal static let somalia = ImageAsset(name: "somalia")
  internal static let srilanka = ImageAsset(name: "srilanka")
  internal static let sudao = ImageAsset(name: "sudao")
  internal static let sudaodosul = ImageAsset(name: "sudaodosul")
  internal static let suecia = ImageAsset(name: "suecia")
  internal static let suica = ImageAsset(name: "suica")
  internal static let suriname = ImageAsset(name: "suriname")
  internal static let tadjiquistao = ImageAsset(name: "tadjiquistao")
  internal static let tailandia = ImageAsset(name: "tailandia")
  internal static let taiwan = ImageAsset(name: "taiwan")
  internal static let tanzania = ImageAsset(name: "tanzania")
  internal static let timorleste = ImageAsset(name: "timorleste")
  internal static let togo = ImageAsset(name: "togo")
  internal static let tonga = ImageAsset(name: "tonga")
  internal static let trinidadetobago = ImageAsset(name: "trinidadetobago")
  internal static let tunisia = ImageAsset(name: "tunisia")
  internal static let turcomenistao = ImageAsset(name: "turcomenistao")
  internal static let turquia = ImageAsset(name: "turquia")
  internal static let tuvalu = ImageAsset(name: "tuvalu")
  internal static let ucrania = ImageAsset(name: "ucrania")
  internal static let uganda = ImageAsset(name: "uganda")
  internal static let uruguai = ImageAsset(name: "uruguai")
  internal static let uzbequistao = ImageAsset(name: "uzbequistao")
  internal static let vanuatu = ImageAsset(name: "vanuatu")
  internal static let vaticano = ImageAsset(name: "vaticano")
  internal static let venezuela = ImageAsset(name: "venezuela")
  internal static let vietna = ImageAsset(name: "vietna")
  internal static let zambia = ImageAsset(name: "zambia")
  internal static let zimbabue = ImageAsset(name: "zimbabue")
  internal static let buttonArrow = ImageAsset(name: "buttonArrow")
  internal static let countryImage = ImageAsset(name: "countryImage")
  internal static let doubleCheck = ImageAsset(name: "doubleCheck")
  internal static let imagemPais = ImageAsset(name: "imagemPais")
  internal static let imgHome = ImageAsset(name: "imgHome")
  internal static let infoCulturalTag = ImageAsset(name: "infoCulturalTag")
  internal static let requisitosTag = ImageAsset(name: "requisitosTag")
  internal static let selectCtryBtnTag = ImageAsset(name: "selectCtryBtnTag")
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
