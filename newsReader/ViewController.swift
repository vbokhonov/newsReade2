//
//  ViewController.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 04.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let service = NewsApiService()
    private var article = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        service.getNews { [weak self] article in
            self?.article = article
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
//            print(news)
//            news.forEach {
//                print($0.title)
//                print($0.articleDescription)
//                print($0.urlToImage)
//                print("============================")
//            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { fatalError() }
        cell.setupWith(article[indexPath.row])
        return cell
    }
}
