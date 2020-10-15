//
//  ControlExtensions.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 14/10/20.
//

import Foundation
import UIKit

// MARK: - Extension UILABEL
extension UILabel {
    
    func getFirtsLetterText(character:Character, cantLetters:Int){
        let textControlSplit = self.text?.split(separator: character)
        var finalText = ""
        
        for item in 0...cantLetters{
            if item < textControlSplit!.count  &&  item <= cantLetters - 1 {
                if textControlSplit![item].count > 1 {
                    finalText += textControlSplit![item].prefix(1)
                }
            }
        }
        
        self.text = finalText
        
    }
    
}

// MARK: - Extension UIImageview

extension UIImageView {
    func donwloadedFrom(url:URL, contentMode mode:UIView.ContentMode = .scaleAspectFit){
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
        
    }
    
}
