//
//  MlUrlServices.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 13/10/20.
//

import Foundation
struct MLUrlSErvices {
    
    enum urlComplement : String {
        case categories = "/categories"
        case categoryItem = "/search?category={0}"
    }
    
    static let mainUrl  = "https://api.mercadolibre.com/sites/MCO"
    static let secondLevel = "https://api.mercadolibre.com/categories/{0}"
    static let urlDetail = "https://api.mercadolibre.com/items/{0}"
    
}
