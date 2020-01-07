//
//  PageTableViewCell.swift
//  Task1
//
//  Created by GAVL DEV on 07/01/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import UIKit

class PageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCreatedAt: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
