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

enum Services {
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
    
    
    
    
    





