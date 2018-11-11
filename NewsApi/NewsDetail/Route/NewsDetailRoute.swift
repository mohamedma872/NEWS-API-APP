//
//  NewsDetailRoute.swift
//  NewsApi
//
//  Created by user148425 on 11/11/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import UIKit
class NewsDetailRoute: NewsDetailRouteProtocol {
    static func createNewsDetailModule(forArticle article: Article) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailsViewController")
        if let view = viewController as? NewsDetailsViewController {
            let presenter: NewsDetailPresenterProtocol = NewsDetailPresenter()
            let Route: NewsDetailRouteProtocol = NewsDetailRoute()
            
            view.presenter = presenter
            presenter.view = view
            presenter.article = article
            presenter.Route = Route
            
            return viewController
        }
        return UIViewController()
    }
    
    
   
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
