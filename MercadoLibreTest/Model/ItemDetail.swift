//
//  ItemDetail.swift
//  MercadoLibreTest
//
//  Harry López
//

import Foundation

struct ItemDetail : Codable {
    var id : String
    var title : String
    var price : Int
    var condition : String
    var permalink : URL
    var pictures : [ImageItem]
    var accepts_mercadopago : Bool
    var geolocation : LocalitacionItem
    var attributes : [AtribbutesItem]
    var warranty : String
    var health : Double
    var seller_address : Address
    
    struct ImageItem:Codable {
        var url : URL
        var secure_url : URL
    }
    
    struct LocalitacionItem : Codable {
        var latitude : Double
        var longitude : Double
    }
    
    
    struct AtribbutesItem : Codable {
        var id : String
        var name : String
        var value_name : String?
        var values : [ValueAttributes]?
    }
    
    
    struct ValueAttributes : Codable {
        var id : String?
        var name : String?
    }
    
    struct Address : Codable {
        var city : City
        var state : State
        var country : Country
    }
    
    struct City:Codable {
        var id : String?
        var name : String?
    }
    
    struct State:Codable {
        var id : String?
        var name : String?
    }
    
    struct Country:Codable {
        var id : String?
        var name : String?
    }
    
    
    
}
