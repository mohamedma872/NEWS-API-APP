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
    @IBOutlet weak var articleImage: UIImageView!
    
    var article : Article?

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    //Sets up view with article
    func setUp(){
        
        guard let title = self.article?.title, let author = self.article?.author, let published = self.article?.publishedAt,
            let description = self.article?.description  else {return}
        self.titleLabel.text = title
        self.authorLabel.text = author
        self.sourceTimeLabel.text = published
        self.descriptionLabel.text = description
        
        articleImage.layer.borderWidth = 0.25
        articleImage.layer.masksToBounds = false
        articleImage.layer.borderColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.5).cgColor
        articleImage.layer.cornerRadius = 2
        articleImage.clipsToBounds = true
        
        //Format Time to Hours Ago before setting
        //sourceTimeLabel.text = withArticle.publishedAt
        let tempImageView = UIImageView()
        if let url = URL(string: (self.article?.urlToImage!)!) {
            tempImageView.downloadImageFromUrl(url: url) { (image) in
                if let data = image {
                    self.articleImage.image = data
                }
            }
        }
    }//End Setup
    
    
    //Opens Article in a new Safari View
    func openInSafariView(urlString : String) {
        let url = URL(string: urlString)!
        let controller = SFSafariViewController(url: url)
        self.present(controller, animated: true, completion: nil)
        controller.delegate = self
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
