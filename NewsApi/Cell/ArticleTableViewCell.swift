//
//  ArticleTableViewCell.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import UIKit
import SVProgressHUD

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sourceImageView: UIImageView!
    @IBOutlet weak var sourceTitleLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var sourceDateMonthLabel: UILabel!
    
    var article : Article?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setUp(withArticle: Article) {
        //Set Selected Article
        self.article = withArticle
        sourceTitleLabel.text = withArticle.title
        sourceNameLabel.text = withArticle.author
        sourceImageView.image = UIImage()
        
        sourceImageView.layer.borderWidth = 0.25
        sourceImageView.layer.masksToBounds = false
        sourceImageView.layer.borderColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.5).cgColor
        sourceImageView.layer.cornerRadius = 7
        sourceImageView.clipsToBounds = true
        
        //Format Time to Hours Ago before setting
        //sourceTimeLabel.text = withArticle.publishedAt
        let tempImageView = UIImageView()
        guard let imageURLString = withArticle.urlToImage else {
            SVProgressHUD.setDefaultMaskType(.black)
            SVProgressHUD.setMinimumSize(CGSize(width: 100, height: 200))
            SVProgressHUD.setMinimumDismissTimeInterval(1.8)
            SVProgressHUD.showSuccess(withStatus: "Some images are missing")
            return
        }
        
        if let url = URL(string: imageURLString) {
            tempImageView.downloadImageFromUrl(url: url) { (image) in
                if let data = image {
                    self.sourceImageView.image = data
                }
            }
        }
    }
    
    
    
    
}// End StarsTableViewCell

