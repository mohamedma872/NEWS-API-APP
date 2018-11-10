//
//  Utility.swift
//  NewsApi
//
//  Created by user148425 on 11/10/18.
//  Copyright © 2018 user148425. All rights reserved.
//

import UIKit
import SVProgressHUD
extension UIImageView {
    typealias IMAGEResult = ( (UIImage?) -> Void  )
    
    func downloadImageFromUrl(url : URL , completion : @escaping IMAGEResult) {
        
        let imageDownloader = NetworkProcessor(url: url)
        
        imageDownloader.downloadImageDataFromURL { (imageData, response, error) in
            
            DispatchQueue.main.async {
                guard let data = imageData else { return }
                guard let image = UIImage(data: data) else {
                    SVProgressHUD.setDefaultMaskType(.black)
                    SVProgressHUD.setMinimumSize(CGSize(width: 100, height: 200))
                    SVProgressHUD.setMinimumDismissTimeInterval(1.8)
                    SVProgressHUD.showSuccess(withStatus: "Some images are missing")
                    return
                }
                completion(image)
            }
        }
    }
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.6)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() {
                self.backgroundColor = UIColor.clear
                self.image = image
            }
            }.resume()
    }
    
}
