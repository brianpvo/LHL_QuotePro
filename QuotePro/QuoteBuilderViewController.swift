//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit
import RealmSwift

class QuotePhoto: Object {
    @objc var quote: Quote?
    @objc var photo: Photo?
}

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
        LorempixelRequest.get { (image, error) -> (Void) in
            if let image = image {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func saveQuote(_ sender: UIButton) {
        if let quoteText = quoteLabel.text, let author = authorLabel.text, let image = imageView.image {
            
            let quote = Quote()
            quote.quoteText = quoteText
            quote.quoteAuthor = author
            
            let photo = Photo()
            photo.imageData = UIImageJPEGRepresentation(image, 1)
            
            let quotePhoto = QuotePhoto()
            quotePhoto.quote = quote
            quotePhoto.photo = photo
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(quotePhoto)
                }
            } catch {
                print("error saving object in realm")
            }
        }
    }
    
}
