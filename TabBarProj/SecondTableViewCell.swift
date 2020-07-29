//
//  SecondTableViewCell.swift
//  TabBarProj
//
//  Created by Vaibhav U on 29/07/20.
//  Copyright © 2020 Vaibhav U. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet var lblArtist: UILabel!
    @IBOutlet var lblTrack: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
