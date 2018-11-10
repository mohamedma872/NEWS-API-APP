//
//  NewsPresenter.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
class NewsPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?;
    var interector: PresentorToInterectorProtocol?;
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchLiveNews();
    }
}

extension NewsPresenter: InterectorToPresenterProtocol {
    
    func liveNewsFetched(news: NewsModel) {
        view?.showNews(news: news);
    }
    
    func liveNewsFetchedFailed(){
        view?.showError()
    }
}
