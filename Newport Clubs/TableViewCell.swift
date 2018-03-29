//
//  TableViewCell.swift
//  Newport Clubs
//
//  Created by Chettiar Valliappan, Valliappan on 6/30/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import AWSDynamoDB
class TableViewCell: UITableViewCell {
    
    @IBOutlet var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
