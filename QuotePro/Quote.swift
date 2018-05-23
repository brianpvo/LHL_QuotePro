//
//  Quote.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var quoteText: String
    var quoteAuthor: String
    
    init(quoteText: String, quoteAuthor: String) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
    }
    
//    static func apiQuote(completion: @escaping (Quote?, Bool)->(Void)) {
//        ForismaticAPIRequest.get { (json, error) -> (Void) in
//            if let json = json {
//                let quote = Quote()
//                quote.quoteText = json["quoteText"] as? String
//                quote.quoteAuthor = json["quoteAuthor"] as? String
//                completion(quote, true)
//            } else {
//                completion(nil, false)
//            }
//        }
//    }
    
}
