//
//  NewsProtocols.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit

 // PRESENTER -> VIEW
protocol PresenterToViewProtocol: class {
    func showNews(news: NewsModel);
    func showError();
    func showLoading()
    func hideLoading()
}
// INTERACTOR -> PRESENTER
protocol InterectorToPresenterProtocol: class {
    func liveNewsFetched(news: NewsModel);
    func liveNewsFetchedFailed();
}
// PRESENTER -> INTERACTOR
protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set} ;
    func fetchLiveNews();
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var Router: PresenterToRouterProtocol? {get set}
    func updateView();
    func showNewsDetail (forArticle article: Article)
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
    // PRESENTER -> WIREFRAME
    func presentNewsDetailScreen(from view: PresenterToViewProtocol, forarticle article: Article)
}
