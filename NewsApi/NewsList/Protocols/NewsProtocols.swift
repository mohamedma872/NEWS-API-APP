//
//  NewsProtocols.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit
/**
Viper is a design pattern that implements ‘separation of concern’ paradigm. Mostly like MVP or MVC it follows a modular approach. One feature, one module. For each module VIPER has five (sometimes four) different classes with distinct roles. No class go beyond its sole purpose. These classes are following.
 View: Class that has all the code to show the app interface to the user and get their response. Upon receiving the response View alerts the Presenter.
 Presenter: Nucleus of a module. It gets user response from the View and work accordingly. Only class to communicate with all other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI.
 Interactor: Have business logics of an app. Primarily make API calls to fetch data from a source. Responsible for making data calls but not necessarily from itself.
 Router: Does the wire-framing. Listen from the presenter about which screen to present and executes it.
 Entity: Contains plain model classes used by interactor.
 
 */
 // PRESENTER -> VIEW
protocol PresenterToViewProtocol: class {
    /**
     (showNews) this method for show News as list in uitableview.
     - Parameters:
     - NewsModel
     
     */
    func showNews(news: NewsModel);
    func showError();
    func showLoading()
    func hideLoading()
}
// INTERACTOR -> PRESENTER
protocol InterectorToPresenterProtocol: class {
    /**
     this method called when live News Fetched From Api
     - Parameters:
     - NewsModel
     
     */
    func liveNewsFetched(news: NewsModel);
    /**
     this method called when erorr happen while live News Fetched From Api
     */
    func liveNewsFetchedFailed();
}
// PRESENTER -> INTERACTOR
protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set} ;
    /**
     this method called when live News Fetched From Api so the presenter requir it from interactor
     */
    func fetchLiveNews();
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var Router: PresenterToRouterProtocol? {get set}
    func updateView();
    /**
     this method called when select table view cell to show news detail
     */
    func showNewsDetail (forArticle article: Article)
}

protocol PresenterToRouterProtocol: class {
    /**
     this method called in app deleget as first time to render News list screen
     */
    static func createModule() -> UIViewController;
    // PRESENTER -> WIREFRAME
    func presentNewsDetailScreen(from view: PresenterToViewProtocol, forarticle article: Article)
}
