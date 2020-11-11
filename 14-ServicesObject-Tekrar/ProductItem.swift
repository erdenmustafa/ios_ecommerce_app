//
//  ProductItem.swift
//  14-ServicesObject-Tekrar
//
//  Created by emir kartal on 25.09.2020.
//  Copyright © 2020 Mustafa Erden. All rights reserved.
//

import UIKit

class ProductItem: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
