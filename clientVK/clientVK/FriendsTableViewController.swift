//
//  FriendsTableViewController.swift
//  clientVK
//
//  Created by S D on 04.05.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    
    var friends  =  ["Петр", "Иван", "Антон", "Игорь" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier, for: indexPath) as! FriendsTableViewCell

        let friend = friends[indexPath.row]
        cell.configure(name: friend, image: UIImage(systemName: "bolt"))
        return cell
    }
    

   

}
