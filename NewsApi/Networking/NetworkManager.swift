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
        case .GetArticles(_):
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .GetArticles(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .GetArticles(ApiKey: Globals.NewsKey,Sources :Globals.sources):
            return .requestParameters(parameters: ["apiKey":Globals.NewsKey,"sources":Globals.sources], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
     
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
    
    
    
}




