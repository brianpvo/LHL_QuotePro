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
    
    func setup(quotePhoto: QuotePhoto) {
        quoteLabel.text = quotePhoto.quote?.quoteText
        authorLabel.text = quotePhoto.quote?.quoteAuthor
    }

}
