//
//  NewsDetailsViewController.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import UIKit
import SafariServices
class NewsDetailsViewController: UIViewController , SFSafariViewControllerDelegate{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
      @IBOutlet weak var ContentLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    var presenter: NewsDetailPresenterProtocol?
    var article : Article?

    override func viewDidLoad() {
        super.viewDidLoad()
             presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Open Article to SafariViewController
    @IBAction func openButtonTapped(_ sender: Any) {
        if let urlString = self.article?.url {
            openInSafariView(urlString: urlString)
        }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
   
    
    //Opens Article in a new Safari View
    func openInSafariView(urlString : String) {
        let url = URL(string: urlString)!
        let controller = SFSafariViewController(url: url)
        self.present(controller, animated: true, completion: nil)
        controller.delegate = self
    }
    
  


}
extension NewsDetailsViewController: NewsDetailViewProtocol {
    func showNewsDetail(forArticle article: Article) {
        self.article = article
        
        guard let title = self.article?.title, let author = self.article?.author, let published = self.article?.publishedAt,
            let description = self.article?.description, let content = self.article?.content  else {return}
        self.titleLabel.text = title
        self.authorLabel.text = author
        var dateForm: Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let date = dateFormatter.date(from:published)
        dateForm = date ?? Date()
        let datestring = dateFormatter.string(from: dateForm)
        self.sourceTimeLabel.text = datestring
        
      self.ContentLabel.text = content
        self.descriptionLabel.text = description
        
        articleImage.layer.borderWidth = 0.25
        articleImage.layer.masksToBounds = false
        articleImage.layer.borderColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.5).cgColor
        articleImage.layer.cornerRadius = 2
        articleImage.clipsToBounds = true
        
        //Format Time to Hours Ago before setting
        //sourceTimeLabel.text = withArticle.publishedAt
        let tempImageView = UIImageView()
        if let url = URL(string: (self.article?.urlToImage)!) {
            tempImageView.downloadImageFromUrl(url: url) { (image) in
                if let data = image {
                    self.articleImage.image = data
                }
            }
        }

    }
    
    
  
    
}
