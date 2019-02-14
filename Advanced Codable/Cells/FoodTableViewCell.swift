//
//  FoodTableViewCell.swift
//  Advanced Codable
//
//  Created by Jonah Zukosky on 2/14/19.
//  Copyright © 2019 Zukosky, Jonah. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var jsonView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
