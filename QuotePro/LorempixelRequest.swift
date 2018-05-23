//
//  LorempixelRequest.swift
//  QuotePro
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class LorempixelRequest: NSObject {
    
    static func get(completion: @escaping (UIImage?, Error?)->(Void)) {
        let url = URL(string: "https://lorempixel.com/200/300/sports/")!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
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
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                completion(image, error)
            }
            
        }
        // do something with the json object
        task.resume()
    }

}
