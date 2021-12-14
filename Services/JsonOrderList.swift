// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jSONOrderList = try? newJSONDecoder().decode(JSONOrderList.self, from: jsonData)

import Foundation

// MARK: - JSONOrderList
struct JSONOrderList: Codable {
    let orderList: [[OrderList]]
}

// MARK: - OrderList
struct OrderList: Codable {
    var id: String?
    let sirketID, mustID: String
    var urunID: String?
    let siparisBilgisi, eklenmeTarihi, idSirket, idCategory: String
    let urunAdi, kisaAciklama, aciklama, tarih: String
    let fiyat, satisTipi, kampanya, kampanyaBaslik: String
    let kampanyaDetay: String
    var adi: String?
    let normal, thumb: String

    enum CodingKeys: String, CodingKey {
        case id
        case sirketID = "sirket_id"
        case mustID = "must_id"
        case urunID = "urun_id"
        case siparisBilgisi = "siparis_bilgisi"
        case eklenmeTarihi = "eklenme_tarihi"
        case idSirket = "id_sirket"
        case idCategory = "id_category"
        case urunAdi = "urun_adi"
        case kisaAciklama = "kisa_aciklama"
        case aciklama, tarih, fiyat
        case satisTipi = "satis_tipi"
        case kampanya
        case kampanyaBaslik = "kampanya_baslik"
        case kampanyaDetay = "kampanya_detay"
        case adi, normal, thumb
    }
}

