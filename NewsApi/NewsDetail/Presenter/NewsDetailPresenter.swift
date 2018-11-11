//
//  NewsDetailPresenter.swift
//  NewsApi
//
//  Created by user148425 on 11/11/18.
//  Copyright © 2018 user148425. All rights reserved.
//
class NewsDetailPresenter: NewsDetailPresenterProtocol {
    var Route: NewsDetailRouteProtocol?
    
    var article: Article?

    weak var view: NewsDetailViewProtocol?
    
    func viewDidLoad() {
        view?.showNewsDetail(forArticle: article!)
    }
    
}
