//
//  ViewController.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var quotePhotos: Results<QuotePhoto>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let realm = try Realm()
            self.quotePhotos = realm.objects(QuotePhoto.self)
        } catch {
            print("cant query realm objects")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let quotePhotos = quotePhotos else {
            return 0
        }
        return quotePhotos.count
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

