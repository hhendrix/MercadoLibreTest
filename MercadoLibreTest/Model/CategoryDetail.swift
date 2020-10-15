//
//  CategoryDetail.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 14/10/20.
//

import Foundation

struct CategoryDetail: Codable {
    
    var site_id : String
    
    var results : [Results]
    
    
    
    struct Results: Codable {
        var id: String
        var title : String
        var price : Int
        var available_quantity : Int
        var sold_quantity : Int
        var thumbnail : URL
        var permalink : URL
        var address : Address
        
        
        struct Address : Codable {
            var state_name : String
            var city_name:String
        }
    }
    
}
