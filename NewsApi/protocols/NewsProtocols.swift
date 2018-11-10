//
//  NewsProtocols.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showNews(news: NewsModel);
    func showError();
}

protocol InterectorToPresenterProtocol: class {
    func liveNewsFetched(news: NewsModel);
    func liveNewsFetchedFailed();
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set} ;
    func fetchLiveNews();
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var router: PresenterToRouterProtocol? {get set}
    func updateView();
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
}
