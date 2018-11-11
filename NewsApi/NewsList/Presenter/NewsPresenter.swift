//
//  NewsPresenter.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import Foundation
class NewsPresenter: ViewToPresenterProtocol {
     weak var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var Router: PresenterToRouterProtocol?
    func showNewsDetail(forArticle article: Article) {
       Router?.presentNewsDetailScreen(from: view!, forarticle: article)
    }
    
    
   
    
    func updateView() {
        view?.showLoading()
        interector?.fetchLiveNews()
    }
}

extension NewsPresenter: InterectorToPresenterProtocol {
    
    func liveNewsFetched(news: NewsModel) {
        view?.hideLoading()
        view?.showNews(news: news)
    }
    
    func liveNewsFetchedFailed(){
        view?.hideLoading()
        view?.showError()
    }
}
