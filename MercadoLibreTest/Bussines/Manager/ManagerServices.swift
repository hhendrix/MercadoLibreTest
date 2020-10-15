//
//  ManagerServices.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 13/10/20.
//

import Foundation

class ManagerServices {
    
    
    func getCategories(callback: @escaping ([Categories]?) -> Void) {
        var categories = [Categories]()
        let urlCategories = MLUrlSErvices.mainUrl + MLUrlSErvices.urlComplement.categories.rawValue
        
        if let url = URL(string:urlCategories){
            let getUrlCategories = NetworkingClass(url: url)
            
            getUrlCategories.network(url: url) { (data) in
                let decoder = JSONDecoder()
                if let postJSON = try? decoder.decode([Categories].self, from:data){
                    categories = postJSON
                    callback(categories)
                }else
                {
                    callback(nil)
                }
            }
        }
    }
    
    
    
    func getCategoryForID(idCategory:String, callback: @escaping (CategoryDetail?) -> Void){
        let urlCategoryDetail = MLUrlSErvices.mainUrl +  MLUrlSErvices.urlComplement.categoryItem.rawValue.replacingOccurrences(of: "{0}", with: idCategory)
        if let url = URL(string:urlCategoryDetail){
            let getUrlCategories = NetworkingClass(url: url)
            
            getUrlCategories.network(url: url) { (data) in
                let decoder = JSONDecoder()
                                
                if let postJSON = try? decoder.decode(CategoryDetail.self, from:data){
                    callback(postJSON)
                }else
                {
                    callback(nil)
                }
            }
        }
        
    }
    
    
    func getDetailItem(idItem:String, callback: @escaping (ItemDetail?) -> Void){
        let urlItemDetail = MLUrlSErvices.urlDetail.replacingOccurrences(of: "{0}", with: idItem)
        if let url = URL(string:urlItemDetail){
            let getUrlItemDetail = NetworkingClass(url: url)
            
            getUrlItemDetail.network(url: url) { (data) in
                let decoder = JSONDecoder()
                                
                if let postJSON = try? decoder.decode(ItemDetail.self, from:data){
                    callback(postJSON)
                }else
                {
                    callback(nil)
                }
            }
        }
        
    }
    
    
    
    
}
