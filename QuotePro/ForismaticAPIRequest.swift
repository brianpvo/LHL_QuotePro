//
//  ForismaticAPIRequest.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ForismaticAPIRequest: NSObject {
    
    static func get(completion: @escaping ([String: Any]?, Error?)->(Void)) {
        let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
            }
            
            var json: [String: Any]?
            do {
                json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print("json fail")
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("no response returned from server \(String(describing: error))")
                return
            }
            
            guard response.statusCode == 200 else {
                // handle error
                print("an error occurred)")
                return
            }
            
            DispatchQueue.main.async {
                completion(json, error)
            }
            
        }
        // do something with the json object
        task.resume()
    }

}
