//
//  ListTableViewCell.swift
//  PicDic
//
//  Created by nttr on 2017/07/19.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var listImageView : UIImageView!
    @IBOutlet var listLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}