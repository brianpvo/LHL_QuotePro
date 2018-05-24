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
    @objc dynamic var quote: Quote?
    @objc dynamic var photo: Photo?
}

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ForismaticAPIRequest.get { (json, error) -> (Void) in
            if let json = json {
                self.quoteLabel.text = json["quoteText"] as? String
                self.authorLabel.text = "- \(json["quoteAuthor"] as? String ?? "Unknown Author")"
            }
        }
        
        LorempixelRequest.get { (data, error) -> (Void) in
            if let data = data {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func generateQuote(_ sender: UIButton) {
        ForismaticAPIRequest.get { (json, error) -> (Void) in
            if let json = json {
                self.quoteLabel.text = json["quoteText"] as? String
                self.authorLabel.text = "- \(json["quoteAuthor"] as? String ?? "Unknown Author")"
            }
        }
    }
    
    @IBAction func generateImage(_ sender: UIButton) {
        LorempixelRequest.get { (data, error) -> (Void) in
            if let data = data {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func saveQuote(_ sender: UIButton) {
        guard let quoteText = quoteLabel.text, let author = authorLabel.text else { return }
            
        let quote = Quote()
        quote.quoteText = quoteText
        quote.quoteAuthor = author
        
        let photo = Photo()
        photo.imageData = UIImageJPEGRepresentation(takeSnapShot(), 1)
        
        let quotePhoto = QuotePhoto()
        quotePhoto.quote = quote
        quotePhoto.photo = photo
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(quotePhoto)
                navigationController?.popViewController(animated: true)
            }
        } catch {
            print("error saving object in realm")
        }
    }
    
    func takeSnapShot() -> UIImage {
        // take a snapshot of the quote with background image
        var image = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(quoteView.bounds.size, true, 0)
        quoteView.drawHierarchy(in: quoteView.bounds, afterScreenUpdates: true)
        guard let CGimage = UIGraphicsGetCurrentContext()?.makeImage() else {return image}
        UIGraphicsEndImageContext()
        
        image = UIImage(cgImage: CGimage)
        return image
        
    }
    
}
