//
//  NewsViewController.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
 var presenter: ViewToPresenterProtocol?
    
    var articles = [Article]()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        presenter?.updateView();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsViewController: PresenterToViewProtocol {
    
    func showNews(news: NewsModel) {
//        authorLabel.text = news.author;
//        titleLabel.text = news.title;
//        descriptionLabel.text = news.description;
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

/// MARK: Configuring Cells
extension NewsViewController :UITableViewDelegate,UITableViewDataSource {
    
    //Number of Sections
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of Rows
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
            return articles.count
       
    }
    
    //Cell for Row
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ArticlesTableViewCell.rawValue, for: indexPath) as! ArticleTableViewCell
        cell.setUp(withArticle: articles[indexPath.row])
        return  cell
}
}
