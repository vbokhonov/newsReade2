//
//  SettingsViewController.swift
//  newsReader
//
//  Created by Valentyn Bokhonov on 07.06.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let sectionsList: [String] = ["Sort","Sources","Language"]
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.dataSource = self
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        return cell
    }
    
    
}
