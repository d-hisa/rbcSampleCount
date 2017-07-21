//
//  lapTableViewCell.swift
//  stopwatch
//
//  Created by nttr on 2017/07/19.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class lapTableViewCell: UITableViewCell {

    @IBOutlet var lapLabel: UILabel!
    @IBOutlet var lapImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
