//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func generateQuote(_ sender: UIButton) {
        ForismaticAPIRequest.get { (json, error) -> (Void) in
            if let json = json {
                self.quoteLabel.text = json["quoteText"] as? String
                self.authorLabel.text = json["quoteAuthor"] as? String
            }
        }
    }
    
    @IBAction func generateImage(_ sender: UIButton) {
    }
    
    @IBAction func saveQuote(_ sender: UIButton) {
        if let quoteText = quoteLabel.text, let author = authorLabel.text {
            Quote(quoteText: quoteText, quoteAuthor: author)
        }
    }
    
}
