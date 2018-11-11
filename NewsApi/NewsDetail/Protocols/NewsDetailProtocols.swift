//
//  NewsDetailProtocols.swift
//  NewsApi
//
//  Created by user148425 on 11/11/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit // PRESENTER -> VIEW
protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol? { get set }
     func showNewsDetail (forArticle article: Article)
   
   
}

protocol NewsDetailRouteProtocol: class {
    static func createNewsDetailModule(forArticle article: Article) -> UIViewController
}

protocol NewsDetailPresenterProtocol: class {
    var view: NewsDetailViewProtocol? { get set }
    var Route: NewsDetailRouteProtocol? { get set }
    var article: Article? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
