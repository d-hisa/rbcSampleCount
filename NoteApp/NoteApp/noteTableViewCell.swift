//
//  noteTableViewCell.swift
//  NoteApp
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class noteTableViewCell: UITableViewCell {

    var titleNote:String = ""
    var summaryNote:String = ""
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
