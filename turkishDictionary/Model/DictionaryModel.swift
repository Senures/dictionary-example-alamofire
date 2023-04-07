//
//  DictionaryModel.swift
//  turkishDictionary
//
//  Created by SEMANUR ESERLER on 29.03.2023.
//

import Foundation


struct DictionaryModel: Codable {
    let maddeID, kac, kelimeNo, cesit: String
    let anlamGor: String
    let onTaki: JSONNull?
    let madde, cesitSay, anlamSay: String
    let taki: JSONNull?
    let cogulMu, ozelMi, lisanKodu, lisan: String
    let telaffuz: JSONNull?
    let birlesikler: String
    let font: JSONNull?
    let maddeDuz: String
    let gosterimTarihi: JSONNull?
    let anlamlarListe: [AnlamlarListe]
    let atasozu: [Atasozu]

    enum CodingKeys: String, CodingKey {
        case maddeID = "madde_id"
        case kac
        case kelimeNo = "kelime_no"
        case cesit
        case anlamGor = "anlam_gor"
        case onTaki = "on_taki"
        case madde
        case cesitSay = "cesit_say"
        case anlamSay = "anlam_say"
        case taki
        case cogulMu = "cogul_mu"
        case ozelMi = "ozel_mi"
        case lisanKodu = "lisan_kodu"
        case lisan, telaffuz, birlesikler, font
        case maddeDuz = "madde_duz"
        case gosterimTarihi = "gosterim_tarihi"
        case anlamlarListe, atasozu
    }
}

// MARK: - AnlamlarListe
struct AnlamlarListe: Codable {
    let anlamID, maddeID, anlamSira, fiil: String
    let tipkes, anlam, gos: String
    let ozelliklerListe: [OzelliklerListe]?
    let orneklerListe: [OrneklerListe]?

    enum CodingKeys: String, CodingKey {
        case anlamID = "anlam_id"
        case maddeID = "madde_id"
        case anlamSira = "anlam_sira"
        case fiil, tipkes, anlam, gos, ozelliklerListe, orneklerListe
    }
}

// MARK: - OrneklerListe
struct OrneklerListe: Codable {
    let ornekID, anlamID, ornekSira, ornek: String
    let kac, yazarID: String
    let yazar: [Yazar]?

    enum CodingKeys: String, CodingKey {
        case ornekID = "ornek_id"
        case anlamID = "anlam_id"
        case ornekSira = "ornek_sira"
        case ornek, kac
        case yazarID = "yazar_id"
        case yazar
    }
}

// MARK: - Yazar
struct Yazar: Codable {
    let yazarID, tamAdi, kisaAdi, ekno: String

    enum CodingKeys: String, CodingKey {
        case yazarID = "yazar_id"
        case tamAdi = "tam_adi"
        case kisaAdi = "kisa_adi"
        case ekno
    }
}

// MARK: - OzelliklerListe
struct OzelliklerListe: Codable {
    let ozellikID, tur, tamAdi, kisaAdi: String
    let ekno: String

    enum CodingKeys: String, CodingKey {
        case ozellikID = "ozellik_id"
        case tur
        case tamAdi = "tam_adi"
        case kisaAdi = "kisa_adi"
        case ekno
    }
}

// MARK: - Atasozu
struct Atasozu: Codable {
    let maddeID, madde: String
    let onTaki: String?

    enum CodingKeys: String, CodingKey {
        case maddeID = "madde_id"
        case madde
        case onTaki = "on_taki"
    }
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
