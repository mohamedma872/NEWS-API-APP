//
//  NewsInterector.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import Alamofire
import Moya
class NewsInterector: PresentorToInterectorProtocol{
    
    var presenter: InterectorToPresenterProtocol?;
    private let ServiceProvider = MoyaProvider<Services>()

    func fetchLiveNews() {
        ServiceProvider.request(.GetArticles(ApiKey: Globals.NewsKey, Sources: Globals.sources)) { (result) in // Result<Moya.Response, MoyaError>
            
            switch result {
                
            case .success(let response):
                
                // a 200 because requests are too easy now.
                let statusCode = response.statusCode
                if(statusCode == 200)
                {
                    //convert result and mapping to  to article class using json encoder
                 
                        
                        //decode data
                        let jsonDecoder = JSONDecoder()
                        let obj = try? jsonDecoder.decode(NewsModel.self, from: response.data)
                       
                        if let NewsModelobj = obj
                        {
                            self.presenter?.liveNewsFetched(news: NewsModelobj)
                        }else
                        {
                            self.presenter?.liveNewsFetchedFailed()
                        }
                        
                    
                   
                    
                }else
                {
                   self.presenter?.liveNewsFetchedFailed()
                    
                }
                // Do something after we create a new user
                
            case .failure(let error):
            self.presenter?.liveNewsFetchedFailed()
            // Could not make a network request
            // Maybe we should try again when there is internet?
            print(error)
                break
            }
        }
        
    }
}

