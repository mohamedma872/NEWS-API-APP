//
//  NewsRouter.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit

class NewsRouter: PresenterToRouterProtocol{
    func presentNewsDetailScreen(from view: PresenterToViewProtocol, forarticle article: Article) {
        let NewsDetailViewController = NewsDetailRoute.createNewsDetailModule(forArticle: article)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(NewsDetailViewController, animated: true)
        }
    }
    
    
    class func createModule() ->UIViewController{
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NewsNavigationController")
        if let view = navController.children.first as? NewsViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = NewsPresenter();
        let interactor: PresentorToInterectorProtocol = NewsInterector();
        let router: PresenterToRouterProtocol = NewsRouter();
        
        view.presenter = presenter;
        presenter.view = view;
        presenter.Router = router;
        presenter.interector = interactor;
        interactor.presenter = presenter;
        
        return navController;
        
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
   
    
}

