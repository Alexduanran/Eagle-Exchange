//
//  WatchListViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {

    @IBOutlet weak var watchListTableView: UITableView!
    
    var watchListArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        watchListTableView.delegate = self
        watchListTableView.dataSource = self
    }
    

    

}

extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchListCell", for: indexPath)
        cell.textLabel?.text = watchListArray[indexPath.row]
        return cell
    }
    
    
}
