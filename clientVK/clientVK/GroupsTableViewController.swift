//
//  GroupsTableViewController.swift
//  clientVK
//
//  Created by S D on 04.05.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var groups = ["1","2","3","4","5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }

    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reuseIdentifier, for: indexPath) as! GroupsTableViewCell

        let group = groups[indexPath.row]
        cell.configure(name: group, image: UIImage(systemName: "bolt"))
        return cell
    }
   
    
    

}
