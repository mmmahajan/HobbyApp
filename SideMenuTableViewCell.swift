//
//  SideMenuTableViewCell.swift
//  
//
//  Created by Admin on 05/05/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
