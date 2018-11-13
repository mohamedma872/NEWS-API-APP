//
//  NetworkManager.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

//
//  NetworkManager.swift
//  BluetoothMessages
//
//  Created by Kareem Mohamed on 10/14/2018.
//  Copyright © 2018 Kareem Mohamed. All rights reserved.
//

// building a generic network layer using moya
// and alamofire
//

import Moya
import Foundation
 /**
 Moya is a networking library focused on encapsulating network requests in a type-safe way, typically by using enumerations (e.g., enum) to provide compile-time guarantees and confidence when working with your network layer, along with added discoverability.
 It was built by Ash Furrow and Orta Therox for Artsy’s Eidolon app and quickly gained popularity. Today, it’s entirely maintained by a passionate community of open-source contributors.
 <b>Moya’s Building Blocks</b> :
 Provider: Moya’s MoyaProvider will be the main object that you’ll create and use when interacting with any network service. It’s a generic object that takes a Moya Target upon initialization.
 Target: A Moya target usually describes an entire API service; in this case, a Marvel target and an Imgur target. Each of these targets describe the service, its possible endpoints, and the information required by each endpoint to perform a request. You define a target by conforming to the TargetType protocol.
 Endpoint: Moya uses the semi-internal Endpoint object to describe the basic pieces of information required to perform a network request, e.g., HTTP method, request body, headers and more. Moya’s MoyaProvider transforms every target to an Endpoint, which is eventually transformed into a raw URLRequest. Endpoints are highly customizable but are out of scope for this tutorial as you won’t need any custom mappings.

 */
enum Services {
    /**
     Initializes a new bicycle with the provided parts and specifications.
     
     - Parameters:
     - ApiKey: newsapi.org key
     - Sources: like animal-planet
    

     */
    case GetArticles(ApiKey: String,Sources : String)
}

extension Services: TargetType{
    var baseURL: URL {
        
        return URL(string: Globals.BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .GetArticles(_,_):
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .GetArticles:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .GetArticles(let ApiKey,let Sources):
            return .requestParameters(parameters: ["apiKey":ApiKey,"sources":Sources], encoding: URLEncoding.default)
       
        }
     
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .GetArticles:
            // Send parameters as JSON in request body
            return JSONEncoding.default
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    var sampleData: Data {
        switch self {
         case .GetArticles(let ApiKey,let Sources):
            let userJson = [
                "apiKey": ApiKey,
                "sources": Sources
            ]
            return jsonSerializedUTF8(json: userJson)
        }
    }
    
    // Helper
    private func jsonSerializedUTF8(json: [String: Any]) -> Data {
        return try! JSONSerialization.data(
            withJSONObject: json,
            options: [.prettyPrinted]
        )
    }
}
    
    
    
    
    





