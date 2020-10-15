//
//  DetailCategoryTableViewCell.swift
//  MercadoLibreTest
//
//  Created by Ibm Mac on 14/10/20.
//

import UIKit

class DetailCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var priceLabelCell: UILabel!
    @IBOutlet weak var QuantityLabelCell: UILabel!
    @IBOutlet weak var ubicationLabelCell: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
