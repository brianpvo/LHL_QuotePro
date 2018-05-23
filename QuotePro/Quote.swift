//
//  Quote.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit
import RealmSwift

class Quote: Object {
    
    @objc dynamic var quoteText: String?
    @objc dynamic var quoteAuthor: String?
    
}
