//
//  TableViewCell.swift
//  List_Array
//
//  Created by Furkan sakızcı on 31.07.2019.
//  Copyright © 2019 Furkan sakızcı. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
    }
}
