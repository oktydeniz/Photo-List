//
//  TableViewCell.swift
//  Photo List
//
//  Created by oktay on 7.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
