//
//  ProprtyTableViewCell.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit

class ProprtyTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyIMG: UIImageView!

    @IBOutlet weak var propertyBedsLBL: UILabel!
    @IBOutlet weak var propertyTitleLBL: UILabel!
    
    @IBOutlet weak var propertyPriceLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        propertyIMG.image = nil
        propertyTitleLBL.text = nil
        propertyPriceLBL.text = nil
        propertyBedsLBL.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
