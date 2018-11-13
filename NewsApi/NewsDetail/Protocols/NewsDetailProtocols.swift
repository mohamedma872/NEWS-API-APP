//
//  NewsDetailProtocols.swift
//  NewsApi
//
//  Created by user148425 on 11/11/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit // PRESENTER -> VIEW

/**
 Viper is a design pattern that implements ‘separation of concern’ paradigm. Mostly like MVP or MVC it follows a modular approach. One feature, one module. For each module VIPER has five (sometimes four) different classes with distinct roles. No class go beyond its sole purpose. These classes are following.
 View: Class that has all the code to show the app interface to the user and get their response. Upon receiving the response View alerts the Presenter.
 Presenter: Nucleus of a module. It gets user response from the View and work accordingly. Only class to communicate with all other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI.
 Interactor: Have business logics of an app. Primarily make API calls to fetch data from a source. Responsible for making data calls but not necessarily from itself.
 Router: Does the wire-framing. Listen from the presenter about which screen to present and executes it.
 Entity: Contains plain model classes used by interactor.
 
 */

protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol? { get set }
    /**
     show News List in tableview.
     
     - Parameters:
     - article: Article
    
     */
     func showNewsDetail (forArticle article: Article)
   
   
}

protocol NewsDetailRouteProtocol: class {
    /**
     create News Detail Module when select news item from table view.
     
     - Parameters:
     - article: Article
     
     */
    static func createNewsDetailModule(forArticle article: Article) -> UIViewController
}

protocol NewsDetailPresenterProtocol: class {
    var view: NewsDetailViewProtocol? { get set }
    var Route: NewsDetailRouteProtocol? { get set }
    var article: Article? { get set }
    /**
     this method called in view didload in view controller to inilize the details.
     
     */
    // VIEW -> PRESENTER
    func viewDidLoad()
}
