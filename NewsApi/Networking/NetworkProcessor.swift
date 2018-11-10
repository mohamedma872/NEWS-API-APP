//
//  NetworkProcessor.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
class NetworkProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?) -> Void  )
    typealias DataHandler = ( (Data?, HTTPURLResponse?, Error?) -> Void  )
    
   
    
    //Downloads ImageData from URL
    func downloadImageDataFromURL( _ completion : @escaping DataHandler ){
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        if let responseData = data {
                            completion(responseData, nil, nil)
                        }
                    default:
                        return
                    }
                }
            }else {
                completion(nil, nil, error!)
            }
        }
        dataTask.resume()
    }
    
    
    
    
}// End class NetworkProcessor
