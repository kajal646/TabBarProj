//
//  TableViewCell.swift
//  TabBarProj
//
//  Created by Vaibhav U on 28/07/20.
//  Copyright © 2020 Vaibhav U. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var lblCapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
