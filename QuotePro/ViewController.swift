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

    @IBOutlet weak var tableView: UITableView!
    var quotePhotos: Results<QuotePhoto>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let realm = try Realm()
            self.quotePhotos = realm.objects(QuotePhoto.self)
            tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteCell
        
        guard let quotePhotos = quotePhotos  else {
            return UITableViewCell()
        }

        let quotePhoto = quotePhotos[indexPath.row]
        
        cell.quoteLabel.text = quotePhoto.quote?.quoteText
        cell.authorLabel.text = "- \(quotePhoto.quote?.quoteAuthor ?? "Unknown Author")"
        
        return cell
        
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
                quoteBuilder.authorLabel.text = "- \(json["quoteAuthor"] as? String ?? "Unknown Author")"
            }
        }
        
        LorempixelRequest.get { (image, error) -> (Void) in
            if let image = image {
                quoteBuilder.imageView.image = image
            }
        }
    }

}

