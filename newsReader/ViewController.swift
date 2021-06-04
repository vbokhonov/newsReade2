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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getNews { news in
            print(news)
        }
    }


}

