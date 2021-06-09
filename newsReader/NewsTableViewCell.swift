//
//  NewsTableViewCell.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 09.06.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLable: UILabel!
    @IBOutlet weak var newsDescriptionLable: UILabel!
    
    func setupWith (_ articles: Article) {
        newsTitleLable.text = articles.title
        newsDescriptionLable.text = articles.articleDescription
//        newsImageView.image = articles.urlToImage
    }

}
