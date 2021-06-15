//
//  NewsViewController.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 15.06.2021.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    var newsUrl = "https://www.bbc.com/news/technology-57474504"
    //https://www.bbc.com/news/technology-57474504
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(newsUrl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showNews(newsUrl)
    }
    
    func showNews(_ which: String) {
        if let url = URL(string: which) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
