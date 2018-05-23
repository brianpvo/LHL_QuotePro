//
//  QuoteCell.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
