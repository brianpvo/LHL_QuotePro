//
//  ViewController.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quoteBuilder = segue.destination as! QuoteBuilderViewController
        
    }

}

