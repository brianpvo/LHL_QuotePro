//
//  ViewController.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Quote.apiQuote { (quote, success) -> (Void) in
//            if(success) {
//                self.title = quote?.quoteAuthor
//            }
//            else {
//                print("Quote retrival fail")
//            }
//        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quoteBuilder = segue.destination as! QuoteBuilderViewController
        
        ForismaticAPIRequest.get { (json, error) -> (Void) in
            if let json = json {
                quoteBuilder.quoteLabel.text = json["quoteText"] as? String
                quoteBuilder.authorLabel.text = json["quoteAuthor"] as? String
                //quoteBuilder.quote = Quote(quoteText: quoteText, quoteAuthor: quoteAuthor)
            }
        }
        
        LorempixelRequest.get { (image, error) -> (Void) in
            if let image = image {
                quoteBuilder.imageView.image = image
            }
        }
    }

}

